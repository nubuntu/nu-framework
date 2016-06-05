<?php

class NuLoader extends NuController{

    protected $app;

    public function __construct(){
        parent::__construct();
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

    public function view($view_name='index',$data=[],$return=false){
        $path_view      = 'views/'.$view_name.'.php';

        # preparing data
        if(count($data)>0){
            foreach ($data as $key => $value){
                $$key = $value;
            }
        }

        ob_start();
        require_once $path_view;
        $content        = ob_get_contents();
        ob_end_clean();

        if($return)
            return $content;

        echo $content;
    }
}