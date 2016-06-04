<?php

class NuInput{

    protected $app;

    public function __construct(){
        $this->app              =& getInstance();
    }

    protected function clean($value){
        return $this->app->db->quote($value);
    }

    protected function clean_array($values){
        foreach ($values as $key => &$value){
            $value = $this->clean($value);
        }
        return $values;
    }

    public function get($input_name=false,$default=false){
        if(!$input_name)
            return $this->clean_array($_GET);
        if(!isset($_GET[input_name]))
            return $default;
        return $_GET[$input_name];
    }

    public function post($input_name=false,$default=false){
        if(!$input_name)
            return $this->clean_array($_POST);
        if(!isset($_POST[$input_name]))
            return $default;
        return $_POST[$input_name];
    }

    public function header($input_name=false,$default=false){
        if(!$input_name){
            $headers                = [];
            foreach ($_SERVER as $key => $value){
                if(strpos($key,'HTTP_')!==false){
                    $headers[str_replace('HTTP_','',$key)]              = $value;
                }
            }
            return $headers;
        }
        if(!isset($_SERVER['HTTP_'.strtoupper($input_name)]))
            return $default;
        return $_SERVER['HTTP_'.strtoupper($input_name)];
    }

}