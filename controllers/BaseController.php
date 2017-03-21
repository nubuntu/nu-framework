<?php

/**
 * Class BaseController
 *
 * @property model_user $model_user
 */


class BaseController extends NuController{

    protected $user;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('model_user');
        $this->user     = $this->model_user->user_logged();
    }

    protected function is_login(){
        if(!$this->user)
            $this->login();
    }

    public function login(){
        $post = $this->input->post();
        if($post){
            $valid = $this->model_user->login($post);
            if(!$valid)
                redirect('/login');
            redirect('/home');
        }
        $this->load->view('login_form');
    }

    public function logout(){
        $this->model_user->logout();
        redirect('/login');
    }

}