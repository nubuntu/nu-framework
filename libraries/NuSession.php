<?php

class NuSession{

    protected $memcache;

    public function __construct(){
        $app            = getInstance();
        $this->memcache = new Memcache;
        $this->memcache->connect($app->config['memcache']['host'],$app->config['memcache']['port']) or die ("Could not connect");
    }

    public function set($key,$value){
        $this->memcache->set($key,$value);
    }

    public function delete($key){
        $this->memcache->delete($key);
    }

    public function get($key,$default=false){
        $result = $this->memcache->get($key);
        if(!$result)
            return $default;
        return $result;
    }

}