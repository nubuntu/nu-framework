<?php

class model_user extends NuModel{

    public $table_name              = 'user U';
    public $table_key               = 'id_user';

    public function __construct()
    {
        parent::__construct();
    }

    public function user_logged(){
        return $this->session->get('user_logged');
    }

    public function login($post){
        $user = $this->read_where([
            'username'  => $post['username'],
            'password'  => $post['password']
        ]);
        if($user)
            $this->session->set('user_logged',$user['id_user']);
        return $user;
    }

    public function logout(){
        return $this->session->delete('user_logged');
    }

}