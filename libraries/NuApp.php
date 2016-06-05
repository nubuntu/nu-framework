<?php

class NuApp{

    public $db;
    public $uri;
    public $ext;
    public $input;
    public $config;
    private static $instance;


    public function __construct($config){
        self::$instance =& $this;
        $this->config               = $config;
        $this->db                   = new NuDB($config['db']);
        $this->load_helper();
        $this->initialize();
    }

    public static function &getInstance(){
        return self::$instance;
    }

    protected function initialize(){
        $uri                        = explode('.',$_SERVER['REQUEST_URI']);
        $this->ext                  = count($uri)>1?$uri[count($uri)-1]:'html';

        if(count($uri)<2){
            $this->uri              = explode('/',$uri[0]);
        }else{
            unset($uri[count($uri)-1]);
            $this->uri              = explode('/',implode('',$uri));
        }
    }

    public function response($code,$message=''){
        header("HTTP/1.1 " . $code . " " . $message);
        header('Content-Type: application/'.$this->ext);
        die($message);
    }

    public function load_helper(){
        foreach (glob("helpers/*.php") as $helper)
        {
            require_once $helper;
        }
    }

    public function set($property_name,$obj){
        $this->$property_name   = $obj;
    }

    public function run(){
        $this->input                = new NuInput();
        $this->session              = new NuSession();
        $this->load                 = new NuLoader();
        array_shift($this->uri);

        # no controller defined
        if(count($this->uri)<1 || $this->uri[0]=='')
            if(!isset($this->config['default_controller']))
                $this->response(404,'Hi, this is Nu Framework, you are in 404 area');
            else
                $this->uri[0]       = $this->config['default_controller'];

        $controller_name        = array_shift($this->uri);
        $controller_class       = strtoupper($controller_name);
        $controller             = new $controller_class();
        $action                 = array_shift($this->uri);
        if(!method_exists($controller,$action))
            if(!method_exists($controller,'index'))
                $this->response(404,'Ooops, Where are you goin, It\'s wrong way...' );
            else
                $action         = 'index';
        $reflection = new ReflectionMethod($controller, $action);
        if (!$reflection->isPublic()) {
            $this->response(403,'Oh no..., You\'re not allowed to enter my private area, Get Out!');
        }

        call_user_func_array(array($controller,$action),$this->uri);
    }

}