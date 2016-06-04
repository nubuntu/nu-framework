<?php

class NuSession{

    public function set($key,$value){
        $_SESSION[$key]     = json_encode($value);
    }

    public function delete($key){
        unset($_SESSION[$key]);
    }

    public function get($key,$default=false){
        if(!isset($_SESSION[$key]))
            return $default;
        return json_decode($_SESSION[$key]);
    }

}