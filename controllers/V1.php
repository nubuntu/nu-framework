<?php

class V1 extends NuApi{

    /**
     * @apiDefine NoAPIKey
     * @apiError No apikey defined in header.
     * @apiErrorExample {json} Error-Response:
     *    HTTP/1.1 400 No apikey defined in header
     */

    /**
     * @apiDefine APIKeyInvalid
     * @apiError Invalid apikey.
     * @apiErrorExample {json} Error-Response:
     *    HTTP/1.1 401 Invalid apikey
     */

    /**
     * @apiDefine NoToken
     * @apiError No token defined.
     * @apiErrorExample {json} Error-Response:
     *    HTTP/1.1 401 No token defined
     */

    /**
     * @apiDefine TokenInvalid
     * @apiError Invalid Token.
     * @apiErrorExample {json} Error-Response:
     *    HTTP/1.1 401 Token invalid or expired
     */

    /**
     * @apiDefine CategoryUpdateFail
     * @apiError Failed to update category.
     * @apiErrorExample {json} Error-Response:
     *    HTTP/1.1 500 Failed to update category
     */

    /**
     * @apiDefine CategoryDeleteFail
     * @apiError Failed to delete category.
     * @apiErrorExample {json} Error-Response:
     *    HTTP/1.1 500 Failed to delete category
     */

    /**
     * @apiDefine CategoryInsertFail
     * @apiError Failed to insert new category.
     * @apiErrorExample {json} Error-Response:
     *    HTTP/1.1 500 Failed to insert new category
     */

    /**
     * @apiDefine ProductUpdateFail
     * @apiError Failed to update product.
     * @apiErrorExample {json} Error-Response:
     *    HTTP/1.1 500 Failed to update product
     */

    /**
     * @apiDefine ProductDeleteFail
     * @apiError Failed to delete product.
     * @apiErrorExample {json} Error-Response:
     *    HTTP/1.1 500 Failed to delete product
     */

    /**
     * @apiDefine ProductInsertFail
     * @apiError Failed to insert new category.
     * @apiErrorExample {json} Error-Response:
     *    HTTP/1.1 500 Failed to insert new category
     */

    /**
     * @apiDefine ItemUpdateFail
     * @apiError Failed to update item.
     * @apiErrorExample {json} Error-Response:
     *    HTTP/1.1 500 Failed to update item
     */

    /**
     * @apiDefine ItemDeleteFail
     * @apiError Failed to delete item.
     * @apiErrorExample {json} Error-Response:
     *    HTTP/1.1 500 Failed to delete item
     */

    /**
     * @apiDefine ItemInsertFail
     * @apiError Failed to insert new item.
     * @apiErrorExample {json} Error-Response:
     *    HTTP/1.1 500 Failed to insert new item
     */
    
    protected $model;

    public function __construct()
    {
        parent::__construct();
    }

    protected function set_model($model_name){
        $this->load->model($model_name);
        $this->model        = $this->$model_name;
    }

    public function auth(){
        /**
         * @apiVersion 1.0.0
         * @api {get} /v1/auth Request Token
         * @apiName Auth
         * @apiGroup Auth
         * @apiExample {js} Example usage:
         * GET /v1/auth HTTP/1.1
         * Host: api.salestock.noercholis.com
         * apikey: 1067cce5bc8569b846f2e9e6f3a56ac1
         *
         * @apiParam {String} APIKEY defined in HTTP Header.
         *
         * @apiSuccess {json} response token.
         *
         * @apiSuccessExample {json} Success-Response:
         *     HTTP/1.1 200 OK
         *       {
         *           "data": {
         *               "name": "Pasar Malam",
         *               "token": "14a558913f934419f98fde741f2e5106"
         *           },
         *           "message": "",
         *           "error": false
         *       }
         *
         *
         * @apiUse NoAPIKey
         * @apiUse APIKeyInvalid
         *
         */
        parent::auth();
    }

    protected function is_valid()
    {
        /**
         *
         * @apiUse NoToken
         * @apiUse TokenInvalid
         *
         */
        return parent::is_valid();
    }

    /*
    |--------------------------------------------------------------------------
    |   Category
    |
    |   List        => GET /v1/category
    |   Create      => POST /v1/category
    |   Read        => GET /v1/category/:id_category
    |   Update      => POST /v1/category/:id_category
    |   Delete      => DELETE /v1/catehory/:id_category
    |
    |--------------------------------------------------------------------------
    */

    public function category($md5_id=false){
        /**
         *
         * @apiVersion 1.0.0
         * @api {get} /v1/category List Of Category
         * @apiName Category List
         * @apiGroup Category
         * @apiExample {js} Example usage:
         *   GET /v1/category HTTP/1.1
         *   Host: api.salestock.noercholis.com
         *   token: 256310be31be1b1bd50b5eb64daaa1f6
         *
         * @apiParam {String} TOKEN defined in HTTP Header.
         *
         * @apiSuccess {json} response token.
         *
         * @apiSuccessExample {json} Success-Response:
         *     HTTP/1.1 200 OK
         *       {
         *           "data": [
         *           {
         *               "id_category": "d968412a31c7833d41a28810b52458b6",
         *               "category_name": "Blazer",
         *               "childs": []
         *           }]
         *       }
         *
         *
         */

        /**
         *
         * @apiVersion 1.0.0
         * @api {get} /v1/category/:id_category View Category
         * @apiName Category View
         * @apiGroup Category
         * @apiExample {js} Example usage:
         *   GET /v1/category/d968412a31c7833d41a28810b52458b6 HTTP/1.1
         *   Host: api.salestock.noercholis.com
         *   token: 3d2625d97133a54d6d3822a049860ceb
         *
         * @apiParam {String} TOKEN defined in HTTP Header.
         *
         * @apiSuccess {json} response token.
         *
         * @apiSuccessExample {json} Success-Response:
         *     HTTP/1.1 200 OK
         *       {
         *           "data": {
         *               "id_category": "d968412a31c7833d41a28810b52458b6",
         *               "category_name": "Blazer",
         *               "products": [
         *                   {
         *                       "id_product": "1c35f10abd1ed07f3d886f8750593749",
         *                       "product_name": "Nereide Polkadot Casual Big Blazer",
         *                       "product_price": "189000",
         *                       "product_description": "Warna Black Motif 1 dan Black Motif 2  \n\nSize XXL:  \nLingkar dada 126 cm, Lebar bahu 44 cm, Panjang lengan 39 cm, Lingkar lengan 38 cm, Panjang 64 cm, Lingakr pinggang 126 cm, Lingkar pinggul 134 cm  \n\nSize XXXL:  \nLingkar dada 129 cm, Lebar bahu 47 cm, Panjang lengan 42 cm, Lingkar lengan 40 cm, Panjang 67 cm, Lingakr pinggang 128 cm, Lingkar pinggul 137 cm  \n\nSize XXXXL:  \nLingkar dada 132 cm, Lebar bahu 50 cm, Panjang lengan 45 cm, Lingkar lengan 44 cm, Panjang 70 cm, Lingakr pinggang 132 cm, Lingkar pinggul 140 cm  \n\nBahan Katun Twill  \n2 Kancing depan, 2 Saku depan"
         *                   },
         *                   {
         *                       "id_product": "5cc02e87beffd7c00acf03db82763ee7",
         *                       "product_name": "Cedasa Plain Longsleeve Blazer",
         *                       "product_price": "119000",
         *                       "product_description": "Warna Black dan Navy  \nSatu Ukuran Muat sampai size L  \nLingkar dada 100 cm, Lebar bahu 38 cm, Panjang lengan 55 cm, Lingkar lengan 40 cm, Panjang 94 cm, Lingkar pinggang 92 cm, Lingkar pinggul 100 cm  \nBahan Denim  \n3 Kancing depan"
         *                   }
         *               ]
         *           },
         *           "message": "",
         *           "error": false
         *       }
         *
         */


        /**
         *
         * @apiVersion 1.0.0
         * @api {post} /v1/category/:id_category Update Category
         * @apiName Category Update
         * @apiGroup Category
         * @apiExample {js} Example usage:
         *   POST /v1/category/d968412a31c7833d41a28810b52458b6 HTTP/1.1
         *   Host: api.salestock.noercholis.com
         *   token: 3d2625d97133a54d6d3822a049860ceb
         *   Content-Type: multipart/form-data;
         *   Content-Disposition: form-data; name="category_name"
         *   Blazer Modern
         *
         * @apiParam {String} TOKEN defined in HTTP Header.
         *
         * @apiSuccess {json} response token.
         *
         * @apiSuccessExample {json} Success-Response:
         *     HTTP/1.1 200 OK
         *       {
         *           "data": {
         *               "id_category": "d968412a31c7833d41a28810b52458b6",
         *               "category_name": "Blazer Modern",
         *               "products": [
         *                   {
         *                       "id_product": "1c35f10abd1ed07f3d886f8750593749",
         *                       "product_name": "Nereide Polkadot Casual Big Blazer",
         *                       "product_price": "189000",
         *                       "product_description": "Warna Black Motif 1 dan Black Motif 2  \n\nSize XXL:  \nLingkar dada 126 cm, Lebar bahu 44 cm, Panjang lengan 39 cm, Lingkar lengan 38 cm, Panjang 64 cm, Lingakr pinggang 126 cm, Lingkar pinggul 134 cm  \n\nSize XXXL:  \nLingkar dada 129 cm, Lebar bahu 47 cm, Panjang lengan 42 cm, Lingkar lengan 40 cm, Panjang 67 cm, Lingakr pinggang 128 cm, Lingkar pinggul 137 cm  \n\nSize XXXXL:  \nLingkar dada 132 cm, Lebar bahu 50 cm, Panjang lengan 45 cm, Lingkar lengan 44 cm, Panjang 70 cm, Lingakr pinggang 132 cm, Lingkar pinggul 140 cm  \n\nBahan Katun Twill  \n2 Kancing depan, 2 Saku depan"
         *                   },
         *                   {
         *                       "id_product": "5cc02e87beffd7c00acf03db82763ee7",
         *                       "product_name": "Cedasa Plain Longsleeve Blazer",
         *                       "product_price": "119000",
         *                       "product_description": "Warna Black dan Navy  \nSatu Ukuran Muat sampai size L  \nLingkar dada 100 cm, Lebar bahu 38 cm, Panjang lengan 55 cm, Lingkar lengan 40 cm, Panjang 94 cm, Lingkar pinggang 92 cm, Lingkar pinggul 100 cm  \nBahan Denim  \n3 Kancing depan"
         *                   }
         *               ]
         *           },
         *           "message": "",
         *           "error": false
         *       }
         *
         * @apiUse CategoryUpdateFail
         *
         */

        /**
         *
         * @apiVersion 1.0.0
         * @api {post} /v1/category Add Category
         * @apiName Category Add
         * @apiGroup Category
         * @apiExample {js} Example usage:
         *   POST /v1/category HTTP/1.1
         *   Host: api.salestock.noercholis.com
         *   token: 1f29d8da08c709e246a0f799fd3a0166
         *   Content-Type: multipart/form-data;
         *   Content-Disposition: form-data; name="category_name"
         *   Blaze Unik
         *   Content-Disposition: form-data; name="category_parent"
         *   d968412a31c7833d41a28810b52458b6
         *
         * @apiParam {String} TOKEN defined in HTTP Header.
         * @apiParam {String} category_name defined in post data.
         * @apiParam {String} category_parent defined in post data.
         *
         * @apiSuccess {json} response token.
         *
         * @apiSuccessExample {json} Success-Response:
         *     HTTP/1.1 200 OK
         *       {
         *           "data": {
         *               "id_category": "f239b88c2959cd112b01e472b29ff71b"
         *           },
         *           "message": "new category added",
         *           "error": false
         *       }
         *
         * @apiUse CategoryInsertFail
         *
         */

        /**
         *
         * @apiVersion 1.0.0
         * @api {delete} /v1/category/:id_category Delete Category
         * @apiName Category Delete
         * @apiGroup Category
         * @apiExample {js} Example usage:
         * DELETE /v1/category/f239b88c2959cd112b01e472b29ff71b HTTP/1.1
         * Host: api.salestock.noercholis.com
         * token: 3d2625d97133a54d6d3822a049860ceb
         *
         * @apiParam {String} TOKEN defined in HTTP Header.
         *
         * @apiSuccess {json} response token.
         *
         * @apiSuccessExample {json} Success-Response:
         *     HTTP/1.1 200 OK
         *       {
         *           "data": [],
         *           "message": "f239b88c2959cd112b01e472b29ff71b deleted...",
         *           "error": false
         *       }
         *
         * @apiUse CategoryDeleteFail
         *
         */

        $this->is_valid();
        $this->set_model('model_category');
        # If id_category not defined go to categories
        if(!$md5_id)
            $this->category_list();

        # load category by id_category with product
        $this->get(function()use($md5_id){
            $this->load_category($md5_id);
        });
        
        # Update category
        $this->post(function()use($md5_id){
            $post                       = $this->input->post();
            if(!$this->model->update_item($md5_id,$post))
                $this->error(500,'Failed to update category');
            $this->load_category($md5_id);
        });

        # delete category
        $this->delete(function()use($md5_id){
            if(!$this->model->delete_item($md5_id))
                $this->error(500,'Failed to delete category');
            $this->response([],$md5_id.' deleted...');
        });

    }

    protected function category_list(){
        # List Categories
        $this->get(function(){
            $this->response($this->model->list_item());
        });

        # Add Category
        $this->post(function(){
            $post                       = $this->input->post();
            if(isset($post['category_parent'])){
                $parent                 = $this->model->read_by('md5(concat("'.$this->config['secret'].'",id_category))',$post['category_parent']);
                if(!$parent)
                    $this->error(404,"Parent Category Not Found");
                $post['category_parent']= $parent['id_category'];
            }
            $id                         = $this->model->create_item($post);
            if(!$id)
                $this->error(500,'Failed to insert new category');
            $this->response([$this->model->table_key=>$id],'new category added');
        });
    }

    protected function load_category($md5_id){
        $item                           = $this->model->read_item($md5_id);
        # encryp id category
        $item[$this->model->table_key]  = $md5_id;
        $this->response($item);
    }

    /*
    |--------------------------------------------------------------------------
    |   Product
    |
    |   List        => GET /v1/product
    |   Search      => POST /v1/product/search
    |   Create      => POST /v1/product
    |   Read        => GET /v1/product/:id_product
    |   Update      => POST /v1/product/:id_product
    |   Delete      => DELETE /v1/product/:id_product
    |
    |--------------------------------------------------------------------------
    */

    public function product($md5_id=false){
        /**
         *
         * @apiVersion 1.0.0
         * @api {get} /v1/product List Of Product
         * @apiName Product List
         * @apiGroup Product
         * @apiExample {js} Example usage:
         *   GET /v1/product HTTP/1.1
         *   Host: api.salestock.noercholis.com
         *   token: 256310be31be1b1bd50b5eb64daaa1f6
         *
         * @apiParam {String} TOKEN defined in HTTP Header.
         *
         * @apiSuccess {json} response token.
         *
         * @apiSuccessExample {json} Success-Response:
         *     HTTP/1.1 200 OK
         *       {
         *           "data": [
         *               {
         *                   "id_product": "d968412a31c7833d41a28810b52458b6",
         *                   "product_name": "Lafita Army Over Size Tote",
         *                   "product_description": "Warna Broken White Brown, Caramel, dan Tangerine,  \n1 Ruang utama, 1 Kancing, 1 Saku depan  \nPanjang 40 cm, Tinggi 44 cm, Lebar 8 cm. Panjang tali 58 cm  \nBahan Canvas",
         *                   "items": [
         *                           {
         *                               "id_sku": "d968412a31c7833d41a28810b52458b6",
         *                               "price": "99000",
         *                               "color": "Broken White",
         *                               "size": "No Size"
         *                           },
         *                           {
         *                               "id_sku": "731b52917aec17e12bc0db3e5f83fc2f",
         *                               "price": "99000",
         *                               "color": "Brown",
         *                               "size": "No Size"
         *                           },
         *                           {
         *                               "id_sku": "3d34c5233c11df991e2ca27542e4c7c0",
         *                               "price": "99000",
         *                               "color": "Caramel",
         *                               "size": "No Size"
         *                           },
         *                          {
         *                               "id_sku": "30653a93669da88aa5d556c0a5552771",
         *                               "price": "99000",
         *                               "color": "Tangerine",
         *                               "size": "No Size"
         *                           }
         *                   ]
         *               }
         *           ],
         *           "message": "",
         *           "error": false
         *       }
         *
         *
         */

        /**
         *
         * @apiVersion 1.0.0
         * @api {post} /v1/product/search Search Product
         * @apiName Product Search
         * @apiGroup Product
         * @apiExample {js} Example usage:
         *   POST /v1/product/search HTTP/1.1
         *   Host: api.salestock.noercholis.com
         *   token: 3d2625d97133a54d6d3822a049860ceb
         *   Content-Type: multipart/form-data;
         *   Content-Disposition: form-data; name="color"
         *   black,white
         *   Content-Disposition: form-data; name="size"
         *   s,m,x
         *   Content-Disposition: form-data; name="price_min"
         *   100000
         *   Content-Disposition: form-data; name="price_max"
         *   200000
         *
         * @apiParam {String} TOKEN defined in HTTP Header.
         * @apiParam {String} color defined in post data.
         * @apiParam {String} size defined in post data.
         * @apiParam {Integer} price_min defined in post data.
         * @apiParam {Integer} price_max defined in post data.
         *
         * @apiSuccess {json} response token.
         *
         * @apiSuccessExample {json} Success-Response:
         *     HTTP/1.1 200 OK
         *       {
         *           "data": [
         *               {
         *                   "id_product": "731b52917aec17e12bc0db3e5f83fc2f",
         *                   "product_name": "Bivanska Plain Pleated Culottes Big Pants",
         *                   "product_description": "Warna Navy dan Black  \nSatu Ukuran Muat Sampai Size XXXL  \nLingkar Pinggang 92 cm, Lingkar Pinggul 126 cm, Panjang 57 cm  \nBahan Jeans  \nPinggang Belakang Karet, Saku Samping",
         *                   "items": [
         *                       {
         *                           "id_sku": "ef2beeb5ecac7e4ef3ab999a1df17db2",
         *                           "price": "159000",
         *                           "color": "Black",
         *                           "size": "XXXL"
         *                       }
         *                   ]
         *               },
         *               {
         *                   "id_product": "ef2beeb5ecac7e4ef3ab999a1df17db2",
         *                   "product_name": "Dessiva Floral Flare Big Midi Dress",
         *                   "product_description": "Warna Baby Pink, Black, Blue, Red dan White  \nSatu ukuran muat sampai size XXXL  \nLingkar dada 112 cm, Lebar bahu 46 cm, Lingkar lengan 56 cm,  \nPanjang 92 cm, Lingkar pinggang 90 cm  \nBahan Satin  \nPinggang belakang full karet",
         *                   "items": [
         *                       {
         *                           "id_sku": "57ca4c2740a815fa0132c7a6fe8e4224",
         *                           "price": "129000",
         *                           "color": "Black",
         *                           "size": "XXXL"
         *                       },
         *                       {
         *                           "id_sku": "7e38008d9d65e999120556d505dc59c0",
         *                           "price": "129000",
         *                           "color": "White",
         *                           "size": "XXXL"
         *                       }
         *                   ]
         *               }
         *           ],
         *           "message": "",
         *           "error": false
         *       }
         *
         */
        $this->is_valid();
        $this->set_model('model_product');
        # If id_product not defined go to product list
        if(!$md5_id)
            return $this->product_list();

        # if search
        if($md5_id=='search')
            return $this->product_search();

        # load category by id_product with items
        $this->get(function()use($md5_id){
            $this->load_product($md5_id);
        });

        # Update category
        $this->post(function()use($md5_id){
            $post                       = $this->input->post();
            if(!$this->model->update_item($md5_id,$post))
                $this->error(500,'Failed to update product');
            $this->load_category($md5_id);
        });

        # delete category
        $this->delete(function()use($md5_id){
            if(!$this->model->delete_item($md5_id))
                $this->error(500,'Failed to delete product');
            $this->response([],$md5_id.' deleted...');
        });

    }

    protected function product_list(){
        # List Product
        $this->get(function(){
            $this->response($this->model->list_item());
        });

        # Add Product
        $this->post(function(){
            $post                       = $this->input->post();
            $id                         = $this->model->create_item($post);
            if(!$id)
                $this->error(500,'Failed to insert new product');
            $this->response([$this->model->table_key=>$id],'new product added');
        });
    }

    protected function load_product($md5_id){
        $item                           = $this->model->read_item($md5_id);
        # encryp id product
        $item[$this->model->table_key]  = $md5_id;
        $this->response($item);
    }

    protected function product_search(){
        $this->post(function(){
            $post                       = $this->input->post();
            $param                      = [];

            # search by color ex: black,white,red
            if(isset($post['color'])){
                $colors                             = explode(',',$post['color']);
                foreach ($colors as $color){
                    $param['where_or']['lower(TC.color_name)'][] = ' like "'.strtolower($color).'%"';
                }
            }

            # search by size ex : xl,m
            if(isset($post['size'])){
                $sizes                              = explode(',',$post['size']);
                foreach ($sizes as $size){
                    $param['where_or']['lower(TS.size_name)'][] = ' like "'.strtolower($size).'%"';
                }
            }

            # search by price => price >= price_min and price <= price_max
            if(isset($post['price_min'])){
                $param['where']['TP.product_price']         = '>= '.$post['price_min'];
            }

            if(isset($post['price_max'])){
                $param['where']['TP.product_price']  = '<= '.$post['price_max'];
            }

            $this->response($this->model->list_item_search($param));
        });
    }

    /*
    |--------------------------------------------------------------------------
    |   Item
    |
    |   Create      => POST /v1/item
    |   Update      => POST /v1/item/:id_sku
    |   Delete      => DELETE /v1/item/:id_sku
    |
    |--------------------------------------------------------------------------
    */

    public function item($md5_id=false){
        $this->is_valid();
        $this->set_model('model_item');

        # If id_product not defined go to item create
        if(!$md5_id)
            return $this->item_create();


        # Update category
        $this->post(function()use($md5_id){
            $post                       = $this->input->post();
            if(!$this->model->update_item($md5_id,$post))
                $this->error(500,'Failed to update item');
            $this->load_category($md5_id);
        });

        # delete category
        $this->delete(function()use($md5_id){
            if(!$this->model->delete_item($md5_id))
                $this->error(500,'Failed to delete item');
            $this->response([],$md5_id.' deleted...');
        });

    }

    protected function item_create(){
        # Add Item
        $this->post(function(){
            $post                       = $this->input->post();
            $id                         = $this->model->create_item($post);
            if(!$id)
                $this->error(500,'Failed to insert new item');
            $this->response([$this->model->table_key=>$id],'new item added');
        });
    }

}