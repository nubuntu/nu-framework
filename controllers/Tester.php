<?php

class Tester extends NuController{

    public function __construct()
    {
        parent::__construct();
    }

    protected function curl($cmd,$method='GET',$data=[]){
        $url            = $this->config['apihost']. $cmd;
        $curl           = curl_init();

        $curl_options   = [
            CURLOPT_URL             => $url,
            CURLOPT_RETURNTRANSFER  => true,
            CURLOPT_CUSTOMREQUEST   => $method,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1
        ];

        if(isset($data['header'])){
            foreach ($data['header'] as $key => $value){
                $curl_options[CURLOPT_HTTPHEADER][] = "$key:$value";
            }
        }

        if(isset($data['post'])){
            $curl_options[CURLOPT_POSTFIELDS] = http_build_query($data['post']);
        }

        curl_setopt_array($curl, $curl_options);

        $response       = curl_exec($curl);
        $err            = curl_error($curl);

        curl_close($curl);
        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            return $response;
        }
    }

    protected function get($command,$data=[]){
        return $this->curl($command,'GET',$data);
    }

    protected function post($command,$data=[]){
        return $this->curl($command,'POST',$data);
    }

    protected function delete($command,$data=[]){
        return $this->curl($command,'DELETE',$data);
    }

    protected function load_view($viewname,$data=[]){
        $content        = $this->load->view($viewname,$data,true);
        $this->load->view('index',['content'=>$content]);
    }

    public function index(){
        $this->auth();
    }

    public function auth(){
        $response   = json_decode($this->get('/v1/auth',[
                        'header'    => ['apikey'=>$this->config['apikey']]
                    ]),true);
        $token      = $response['data']['token'];
        $this->session->set('token',$token);
        $this->load_view('auth',[
            'config'        => $this->config,
            'response'      => $response
        ]);
    }

    public function category_list(){
        $token      = $this->session->get('token');
        $response   = json_decode($this->get('/v1/category',[
                        'header'    => ['token'=>$token]
                    ]),true);
        $id_category    = $response['data'][0]['id_category'];
        $category_name  = $response['data'][0]['category_name'];
        $this->load_view('category_list',[
            'token'         => $token,
            'response'      => $response,
            'id_category'   => $id_category,
            'category_name' => $category_name
        ]);
    }

    public function category($id_category){
        $token      = $this->session->get('token');
        $response   = json_decode($this->get('/v1/category/'.$id_category,[
            'header'    => ['token'=>$token]
        ]),true);

        #build select input for parent category
        $categories = json_decode($this->get('/v1/category/',[
            'header'    => ['token'=>$token]
        ]),true);
        $select     = '<select name="category_parent" class="form-control">';
        foreach ($categories['data'] as $category){
            $select.= '<option value="'.$category['id_category'].'">'.$category['category_name'].'</option>';
        }
        $select     .= '</select>';
        $this->load_view('category',[
            'token'         => $token,
            'response'      => $response,
            'id_category'   => $id_category,
            'select'        => $select
        ]);
    }

    public function category_create(){
        $token      = $this->session->get('token');
        $response   = json_decode($this->post('/v1/category',[
            'header'    => ['token'=>$token],
            'post'      => $this->input->post()
        ]),true);

        # cek response
        if($response['error'])
            die("Sorry, something error happen, please back and try again");

        $id_category    = $response['data']['id_category'];
        $this->load_view('category_create',[
            'token'             => $token,
            'response'          => $response,
            'id_category'       => $id_category,
            'category_name'     => $this->input->post('category_name'),
            'category_parent'   => $this->input->post('category_parent')
        ]);
    }

    public function category_check($id_category){
        $token      = $this->session->get('token');
        $response   = json_decode($this->get('/v1/category/'.$id_category,[
            'header'    => ['token'=>$token]
        ]),true);

        $id_category    = $response['data']['id_category'];
        $category_name  = $response['data']['category_name'];
        $this->load_view('category_check',[
            'token'             => $token,
            'response'          => $response,
            'id_category'       => $id_category,
            'category_name'     => $category_name
        ]);
    }

    public function category_update($id_category){
        $token      = $this->session->get('token');
        $response   = json_decode($this->post('/v1/category/'.$id_category,[
            'header'    => ['token'=>$token],
            'post'      => $this->input->post()
        ]),true);

        # cek response
        if($response['error'])
            die("Sorry, something error happen, please back and try again");

        $id_category    = $response['data']['id_category'];
        $category_name  = $response['data']['category_name'];
        $this->load_view('category_update',[
            'token'             => $token,
            'response'          => $response,
            'id_category'       => $id_category,
            'category_name'     => $category_name
        ]);
    }

    public function category_delete($id_category){
        $token      = $this->session->get('token');
        $response   = json_decode($this->delete('/v1/category/'.$id_category,[
            'header'    => ['token'=>$token],
        ]),true);

        # cek response
        if($response['error'])
            die("Sorry, something error happen, please back and try again");

        $this->load_view('category_delete',[
            'token'             => $token,
            'response'          => $response,
            'id_category'       => $id_category
        ]);
    }

    public function product_list(){
        $token      = $this->session->get('token');
        $response   = json_decode($this->get('/v1/product',[
            'header'    => ['token'=>$token]
        ]),true);

        $id_product  = $response['data'][0]['id_product'];
        $product_name= $response['data'][0]['product_name'];
        $this->load_view('product_list',[
            'token'             => $token,
            'response'          => $response,
            'id_product'        => $id_product,
            'product_name'      => $product_name
        ]);
    }

    public function product($id_product){
        $token      = $this->session->get('token');
        $response   = json_decode($this->get('/v1/product/'.$id_product,[
            'header'    => ['token'=>$token]
        ]),true);

        $this->load_view('product',[
            'token'             => $token,
            'response'          => $response,
            'id_product'        => $id_product
        ]);
    }

    public function product_search(){
        $token      = $this->session->get('token');
        $post       = $this->input->post();

        if($post['price_min']=='')
            unset($post['price_min']);

        if($post['price_max']=='')
            unset($post['price_max']);

        $response   = json_decode($this->post('/v1/product/search',[
            'header'    => ['token'=>$token],
            'post'      => $post
        ]),true);

        $this->load_view('product_search',[
            'token'             => $token,
            'response'          => $response
        ]);

    }
}