<?php

function array_to_xml($obj, $array)
{
    foreach ($array as $key => $value)
    {
        if(is_numeric($key))
            $key = 'item' . $key;

        if (is_array($value))
        {
            $node = $obj->addChild($key);
            self::array_to_xml($node, $value);
        }
        else
        {
            $obj->addChild($key, htmlspecialchars($value));
        }
    }
}

function redirect($url){
    header('Location: '.$url);
}

function &getInstance(){
    return NuApp::getInstance();
}