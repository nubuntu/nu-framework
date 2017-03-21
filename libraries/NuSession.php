<?php
session_start();

class NuSession{

    protected $memcache;
    protected $use_memcache=false;

    public function __construct(){
        $app            = getInstance();
        if(isset($app->config['memcache'])){
            $this->use_memcache = true;
            $this->memcache = new Memcache;
            $this->memcache->connect($app->config['memcache']['host'],$app->config['memcache']['port']) or die ("Could not connect");
        }
    }

    public function set($key,$value){
        if($this->use_memcache)
            return $this->memcache->set($key,$value);
        $_SESSION[$key] = $value;
    }

    public function delete($key){
        if($this->use_memcache)
            return $this->memcache->delete($key);
        unset($_SESSION[$key]);
    }

    public function get($key,$default=false){
        if($this->use_memcache){
            $result = $this->memcache->get($key);
        }else{
            $result = isset($_SESSION[$key])?$_SESSION[$key]:false;
        }
        if(!$result)
            return $default;
        return $result;
    }

}