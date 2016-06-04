<?php

class model_api extends NuModel{
    
    public function __construct(){
        parent::__construct();
    }

    public function list_item($where=[]){
        $list                 = $this->reads_where($where,
            function(&$row){
                $this->list_item_callback($row);
                $row[$this->table_key]               = md5($this->config['secret'].$row[$this->table_key]);
                return $row;
            }
        );
        return $list;
    }

    protected function list_item_callback(&$row){}

    public function create_item($data){
        $id                         = $this->create($data);
        return $id ? md5($this->config['secret'].$id) : false;
    }

    public function read_item($md5_id){
        $item                       = $this->read_by('md5(concat("'.$this->config['secret'].'",'.$this->table_key.'))',$md5_id);
        $this->read_item_callback($item);
        return $item;
    }

    protected function read_item_callback(&$item){}

    public function update_item($md5_id,$post){
        $item                       = $this->read_item($md5_id);
        $post[$this->table_key]     = $item[$this->table_key];
        return $this->update($post);
    }

    public function delete_item($md5_id){
        $item                       = $this->read_item($md5_id);
        return  $this->delete($item[$this->table_key]);
    }

    


}