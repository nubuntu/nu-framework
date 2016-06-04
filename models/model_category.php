<?php

class model_category extends model_api{

    public $table_name              = '#_category TC';
    public $table_key               = 'id_category';

    public function __construct(){
        parent::__construct();
    }

    public function list_item($where = ['category_parent'=>' is null']){
        return parent::list_item($where)?:[];
    }

    protected function list_item_callback(&$row){
        $row['childs']              = $this->list_item(['category_parent'=>$row[$this->table_key]]);
        unset($row['category_parent']);
    }
    
    protected function read_item_callback(&$item){
        # unset unused fields
        unset($item['category_parent']);

        # get products
        $this->load->model('model_product');
        $item['products']                   = $this->model_product->reads_by('id_category',$item['id_category'],
            function(&$row){
                # encrypt id product
                $row['id_product']                = md5($this->config['secret'].$row['id_product']);
                unset($row['id_category']);
                return $row;
            }
        )?:[];
    }

}