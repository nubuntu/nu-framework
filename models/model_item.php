<?php

class model_item extends model_api{

    public $table_name              = '#_item TI';
    public $table_key               = 'id_item';

    public function __construct(){
        parent::__construct();
    }

    public function get_by_id_product($id_product){
        $rows               = $this->where([
                                        'TP.id_product'    => $id_product
                                    ])
                                    ->join('#_product TP','TI.id_product=TP.id_product')
                                    ->left_join('#_color TC','TI.id_color=TC.id_color')
                                    ->left_join('#_size TS','TI.id_size=TS.id_size')
                                    ->getRows(function($row){
                                        return [
                                            'id_sku'    => md5($this->config['secret']. $row['id_item']),
                                            'price'     => $row['item_price']>0 ? $row['item_price'] : $row['product_price'],
                                            'color'     => $row['color_name'],
                                            'size'      => $row['size_name']
                                        ];
                                    });
        return $rows;
    }

}