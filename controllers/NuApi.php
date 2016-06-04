<?php

class NuAPI extends NuController{
    
    protected $db;
    protected $route;
    protected $method;
    protected $status           = [
        200     => 'OK',
        400     => 'Bad Request',
        401     => 'Unauthorized',
        403     => 'Forbidden',
        404     => 'Not Found',
        500     => 'Internal Server Error'
    ];

    public function __construct(){
        parent::__construct();
        $this->method   = $_SERVER['REQUEST_METHOD'];
        if($this->ext=='html')
            $this->ext  = 'json';
        $this->load->model('model_api');
    }

    protected function get($callback){
        if($this->method=='GET'){
            call_user_func($callback);
        }
        return $this;
    }

    protected function post($callback){
        if($this->method=='POST'){
            call_user_func($callback);
        }
        return $this;
    }

    protected function put($callback){
        if($this->method=='PUT'){
            call_user_func($callback);
        }
        return $this;
    }

    protected function delete($callback){
        if($this->method=='DELETE'){
            call_user_func($callback);
        }
        return $this;
    }

    protected function response($data,$message=''){
        $this->output(200,[
            'data'      => $data,
            'message'   => $message,
            'error'     => false
        ]);
    }

    protected function error($code,$message){
        $this->output($code,[
            'message'   => $message,
            'error'     => true
        ]);
    }

    protected function output($code,$data){
        header("HTTP/1.1 " . $code . " " . $this->status[$code]);
        header('Content-Type: application/'.$this->ext);
        call_user_func_array([$this,'output_'.$this->ext],[$data]);
    }

    protected function output_json($data){
        die(json_encode($data));
    }

    protected function output_xml($data){
        $xml = new SimpleXMLElement('<root/>');
        NuHelper::array_to_xml($xml,$data);
        die($xml->asXML());
    }
    
    public function auth(){
        $this->get(function(){
            $apikey     = $this->input->header('APIKEY');
            if(!$apikey)
                $this->error(400,'No apikey defined in header');

            $this->load->model('model_client');
            $client     = $this->model_client->read_by('api_key',$apikey);
            if(!$client)
                $this->error(401,'Invalid apikey');

            $token      = md5(uniqid());
            $this->session->set($token,$client);

            $this->response([
                'name'  => $client['client_name'],
                'token' => $token
            ]);
        });
    }
    
    protected function is_valid(){
        $token          = $this->input->header('TOKEN');
        if(!$token)
            $this->error(401,'No token defined');

        $client         = $this->session->get($token);
        if(!$client)
            $this->error(401,'Token invalid or expired');

        return $client;
    }

}