<?php

class NuLoader{

    protected $app;

    public function __construct(){
        $this->app              =& getInstance();
    }

    public function model($model_name){
        if(property_exists($this->app,$model_name))
            return;
        if(!$model_name)
            return;
        $model       = 'models/'.$model_name.'.php';
        require_once $model;
        $this->app->set($model_name,new $model_name());
    }
}