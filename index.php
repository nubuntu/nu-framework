<?php
require_once "config.php";

function __autoload($class)
{
    static $loaded_class;
    if(!$loaded_class)
        $loaded_class = [];
    if(isset($loaded_class[$class]))
        return;
    $dirs       = ['libraries','controllers'];
    foreach ($dirs as $dir){
        $path       = $dir.'/'.$class.'.php';
        if(file_exists($path)){
            require_once $path;
            $loaded_class[$class]       = true;
            break;
        }
    }

}

$app = new NuApp($config);
$app->run();


?>
