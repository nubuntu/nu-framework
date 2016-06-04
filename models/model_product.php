<?php

class model_product extends model_api{

    public $table_name              = '#_product TP';
    public $table_key               = 'id_product';

    public function __construct(){
        parent::__construct();
        $this->load->model('model_item');
    }

    protected function list_item_callback(&$row){
        $this->read_item_callback($row);
    }

    protected function read_item_callback(&$item){
        # unset unused fields
        unset($item['id_category']);
        unset($item['product_price']);

        # get items
        $item['items']              = $this->model_item->get_by_id_product($item['id_product']);
    }

    public function list_item_search($parameter){
        $products           = [];
        $this->param($parameter)
            ->join('#_item TI','TP.id_product=TI.id_product')
            ->left_join('#_color TC','TI.id_color=TC.id_color')
            ->left_join('#_size TS','TI.id_size=TS.id_size')
            ->getRows(function($row)use(&$products){
                $products[$row['id_product']][] = $row;
            });

        $rows               = [];
        foreach($products as $key => $product){
            $items          = [];
            foreach ($product as $p){
                $items[]    = [
                    'id_sku'            => md5($this->config['secret'].$p['id_item']),
                    'price'             => $p['item_price']>0?$p['item_price']:$p['product_price'],
                    'color'             => $p['color_name'],
                    'size'              => $p['size_name'],
                ];
            }
            $rows[]         = [
                'id_product'            => md5($this->config['secret'].$product[0]['id_product']),
                'product_name'          => $product[0]['product_name'],
                'product_description'   => $product[0]['product_description'],
                'items'                 => $items
            ];
        }
        return $rows;
    }


}