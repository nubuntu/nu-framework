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

    public function index(){
        $this->auth();
    }

    public function auth(){
        $response   = json_decode($this->get('/v1/auth',[
                        'header'    => ['apikey'=>$this->config['apikey']]
                    ]),true);
        $token      = $response['data']['token'];
        $this->session->set('token',$token);
        $html       = <<<EOT
        <h1>GET /v1/auth</h1>
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br> 
        apikey : %s
        <h3>Response</h3>
        <pre>%s</pre>
        your new token is {$token}<br/>
        we save that token from now in session, for later use if we need to call other request<br/>
        next, go to <a href='/tester/category_list'><strong>category list</strong></a>
EOT;
        echo sprintf($html,$this->config['apikey'],print_r($response,true));
    }

    public function category_list(){
        $token      = $this->session->get('token');
        $response   = json_decode($this->get('/v1/category',[
                        'header'    => ['token'=>$token]
                    ]),true);
        $id_category    = $response['data'][0]['id_category'];
        $category_name  = $response['data'][0]['category_name'];
        $html       = <<<EOT
        <h1>GET /v1/category</h1>
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br> 
        token : {$token}
        <h3>Response</h3>
        <pre>%s</pre>
        let we choose first category ({$id_category}) to see detail and product<br/>
        next, go to <a href='/tester/category/{$id_category}'><strong>category {$category_name}</strong></a>
EOT;
        echo sprintf($html,print_r($response,true));
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
        $select     = '<select name="category_parent">';
        foreach ($categories['data'] as $category){
            $select.= '<option value="'.$category['id_category'].'">'.$category['category_name'].'</option>';
        }
        $select     .= '</select>';


        $html       = <<<EOT
        <h1>GET /v1/category/{$id_category}</h1>
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br> 
        token : {$token}
        <h3>Response</h3>
        <pre>%s</pre>
        ok, you got category detail and product right now<br/>
        now let we try add new category, just fill the form bellow<br/>
        <form method='post' action='/tester/category_create'>
            Name    : <input name='category_name' type='text'/><br/>
            Parent  : %s <br/>
            <input type="submit" value="Submit"/>
        </form>
EOT;
        echo sprintf($html,print_r($response,true),$select);
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
        $html       = <<<EOT
        <h1>POST /v1/category</h1>
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong><br/> 
        token : {$token} <br/>
        <strong>HTTP_POST</strong><br/> 
        category_name : %s <br/>
        category_parent : %s <br/>
        <h3>Response</h3>
        <pre>%s</pre>
        Nice.., you just created new category, and the id_category is {$id_category}<br/>
        so, let we check is it right or not <a href="/tester/category_check/{$id_category}">/v1/category/{$id_category}</a><br/>
EOT;
        echo sprintf($html,$this->input->post('category_name'),$this->input->post('category_parent'),print_r($response,true));
    }

    public function category_check($id_category){
        $token      = $this->session->get('token');
        $response   = json_decode($this->get('/v1/category/'.$id_category,[
            'header'    => ['token'=>$token]
        ]),true);

        $html       = <<<EOT
        <h1>GET /v1/category/{$id_category}</h1>
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br> 
        token : {$token}
        <h3>Response</h3>
        <pre>%s</pre>
        yeah, you're awesome.... new category has ben added and displayed here<br/>
        how about if you edit this category?, I think the name is not too cool<br/>
        <form method='post' action='/tester/category_update/%s'>
            Name    : <input name='category_name' type='text' value='%s'/><br/>
            <input type="submit" value="Submit"/>
        </form>
EOT;
        echo sprintf($html,print_r($response,true),$response['data']['id_category'],$response['data']['category_name']);
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
        $html       = <<<EOT
        <h1>POST /v1/category/{$id_category}</h1>
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong><br/> 
        token : {$token} <br/>
        <strong>HTTP_POST</strong><br/> 
        category_name : %s <br/>
        <h3>Response</h3>
        <pre>%s</pre>
        Oh... that worst, more better if you just <a href="/tester/category_delete/{$id_category}">delete it</a><br/>
EOT;
        echo sprintf($html,$this->input->post('category_name'),print_r($response,true));
    }

    public function category_delete($id_category){
        $token      = $this->session->get('token');
        $response   = json_decode($this->delete('/v1/category/'.$id_category,[
            'header'    => ['token'=>$token],
        ]),true);

        # cek response
        if($response['error'])
            die("Sorry, something error happen, please back and try again");

        $html       = <<<EOT
        <h1>DELETE /v1/category/{$id_category}</h1>
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong><br/> 
        token : {$token} <br/>
        <h3>Response</h3>
        <pre>%s</pre>
        good job, I think we are done with this category<br/>
        you can go back and repeat it if you want, or move on to <a href="/tester/product_list">product list</a></br>
EOT;
        echo sprintf($html,print_r($response,true));
    }

    public function product_list(){
        $token      = $this->session->get('token');
        $response   = json_decode($this->get('/v1/product',[
            'header'    => ['token'=>$token]
        ]),true);

        $id_product  = $response['data'][0]['id_product'];
        $product_name= $response['data'][0]['product_name'];
        $html       = <<<EOT
        <h1>GET /v1/product</h1>
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br> 
        token : {$token}
        <h3>Response</h3>
        <pre>%s</pre>
        let we choose first product ({$id_product}) to see detail and items<br/>
        next, go to <a href='/tester/product/{$id_product}'><strong>product {$product_name} </strong></a>
EOT;
        echo sprintf($html,print_r($response,true));
    }

    public function product($id_product){
        $token      = $this->session->get('token');
        $response   = json_decode($this->get('/v1/product/'.$id_product,[
            'header'    => ['token'=>$token]
        ]),true);


        $html       = <<<EOT
        <h1>GET /v1/product/{$id_product}</h1>
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br> 
        token : {$token}
        <h3>Response</h3>
        <pre>%s</pre>
        ok, you got product detail and variants right now<br/>
        now search anything you want by fill the form bellow, trust me it's works<br/>
        <form method='post' action='/tester/product_search'>
            Color    : <input name='color' type='text' placeholder='black,white,red,etc'/><br/>
            Size     : <input name='size' type='text' placeholder='s,m,x,etc'/><br/>
            Price Range  : <input name='price_min' type='text' placeholder='100000'/> to <input name='price_max' type='text' placeholder='200000'/><br/>
            <input type="submit" value="Submit"/>
        </form>
EOT;
        echo sprintf($html,print_r($response,true));
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

        $html       = <<<EOT
        <h1>POST /v1/product</h1>
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br> 
        token : {$token}<br/>
        <strong>HTTP_POST</strong></br> 
        %s<br/>
        <h3>Response</h3>
        <pre>%s</pre>
        yeah, you just finished wizard, thank's for your patience and see you later <br/>
        === The End ====
EOT;
        echo sprintf($html,print_r($post,true),print_r($response,true));
    }
}