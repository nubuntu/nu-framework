<?php

/**
 * Class NuController
 *
 * @property NuLoader $load
 * @property NuSession $session
 * @property NuInput $input
 */

class NuController{

    protected $app;

    public function __construct(){
        $this->app              =& getInstance();
        foreach (get_object_vars($this->app) as $key => $obj){
            $this->$key             = $obj;
        }
    }

    public function __get($name){
        if(property_exists($this,$name))
            return $this->$name;
        if(property_exists($this->app,$name)){
            $this->$name            = $this->app->$name;
            return $this->$name;
        }
    }
}