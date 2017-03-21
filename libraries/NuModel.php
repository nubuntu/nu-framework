<?php

class NuModel extends NuController{

    protected $app;
    public $table_name;
    public $table_key;
    protected $table;
    protected $fields;
    protected $assign;
    protected $parameter        = [];

    public function __construct(){
        parent::__construct();
        if(!empty($this->table_name) && !empty($this->table_key))
            $this->setTable();
    }

    public function reads($callback=false){
        return $this->getRows($callback);
    }

    public function read_where($where=[]){
        return $this->where($where)->getRow();
    }

    public function read_by($field_name,$field_value){
        return $this->where([
            $field_name => $field_value
        ])->getRow();
    }

    public function reads_where($where=[],$callback=false){
        return $this->where($where)->getRows($callback);
    }

    public function reads_by($field_name,$field_value,$callback=false){
        return $this->reads_where([
            $field_name     => $field_value
        ],$callback);
    }

    public function create($data){
        unset($data[$this->table_key]);
        $status             = $this->bind($data)->store();
        return $status['state'] ? $status['lastId'] : false;
    }

    public function update($data){
        $status             = $this->bind($data)->store();
        return $status['state'];
    }
    
    public function delete($id){
        $status             = $this->bind([$this->table_key=>$id])->store(true);
        return $status['state'];
    }

    protected function getFields(){
        return $this->fields;
    }

    protected function setTable(){
        $prefix             = isset($this->config['db']['prefix'])?$this->config['db']['prefix']:'';
        $this->table        = str_replace('#_',$prefix,$this->table_name);
        $this->setField();
    }

    protected function setField(){
        $this->fields       = [];
        $table              = explode(' ',$this->table);
        $q                  = "show columns from ".$table[0];
        $this->db->setQuery($q);
        $rows               = $this->db->getRows();
        foreach($rows as $row){
            $this->fields[$row['Field']]    = $row['Type'];
        }
    }

    public function bind($data){
        $this->assign       = [];
        foreach($this->fields as $key => $value):
            if(isset($data[$key])):
                $this->assign[$key] = $data[$key];
            endif;
        endforeach;
        return $this;
    }

    protected function getDeleted(){
        $new                = $this->assign;
        $key                = $new[$this->table_key];
        $data               = [];
        $data['table']      = $this->table;
        $data['key']        = $this->table_key;
        $data['id']         = $key;
        $q                  = "select * from ".$this->table." where ".$this->table_key."='".$key."'";
        $old                = $this->db->setQuery($q)->getRow();
        $data['old']        = $old;
        return $data;
    }

    protected function getUpdated($isnew=false){
        $new                = $this->assign;
        $key                = isset($new[$this->table_key])?$new[$this->table_key]:"";
        $data               = [];
        $data['table']      = $this->table;
        $data['key']        = $this->table_key;
        $data['id']         = $key;
        if($isnew){
            foreach($this->assign as $key => $value):
                $data['new'][$key]          = $value;
            endforeach;
        }else{
            $q                  = "select * from ".$this->table." where ".$this->table_key."='".$key."'";
            $old                = $this->db->setQuery($q)->getRow();
            foreach($this->assign as $key => $value):
                if($old[$key]!=$value){
                    $data['new'][$key]          = $value;
                    $data['old'][$key]          = $old[$key];
                }
            endforeach;
        }
        return $data;
    }

    public function store($delete=false){
        $table                      = explode(' ',$this->table)[0];
        # delete
        if($delete){
            $updates                = $this->getDeleted();
            $q                      = "delete from ".$table." where ".$this->table_key." = '".$this->db->quote($this->assign[$this->table_key])."'";
            $this->db->setQuery($q);
            return [
                'state'             => $this->db->query(),
                'action'            => 'delete',
                'lastId'            => $this->db->lastId(),
                'update'            => $updates
            ];
        }

        # create & update
        if(!isset($this->assign[$this->table_key]))
            $this->assign[$this->table_key]     = '';

        $q                  = "select count(*) from ".$this->table." where ".$this->table_key." = '".$this->db->quote($this->assign[$this->table_key])."'";
        $this->db->setQuery($q);
        $count              = $this->db->getResult();
        if($count >= 1):
            foreach($this->assign as $key => $value):
                if($key != $this->primary):
                    $row[]              = "`".$key."`= '".$this->db->quote($value)."'";
                endif;
            endforeach;
            $updates                    = $this->getUpdated();
            $q                          = "update ".$table." set ".implode(',',$row)." where ".$this->table_key." = '".$this->db->quote($this->assign[$this->table_key])."'";
            $action                     = "update";
        else:
            foreach($this->assign as $key => $value):
                if($key==$this->table_key){
                    if(strlen(trim($value))<1){
                        continue;
                    }
                    if($value=="0"){
                        continue;
                    }
                }
                $row['field'][]             = $key;
                $row['value'][]             = "'".$this->db->quote($value)."'";
            endforeach;
            $updates                    = $this->getUpdated(true);
            $q                          = "insert into ".$table."(`".implode("`,`",$row['field'])."`) VALUES (".implode(',',$row['value']).") ON DUPLICATE KEY UPDATE ".$this->table_key."=".$this->table_key;
            $action                     = "create";
        endif;
        $this->db->setQuery($q);
        return [
            'state'             => $this->db->query(),
            'action'            => $action,
            'lastId'            => $this->db->lastId(),
            'update'            => $updates
        ];
    }

    protected function build_operator($value){
        $find           = ['is null','not null','>','>=','<','<=','%'];
        $sign           = '__???__';
        $temp           = str_replace($find,$sign,$value);
        if(strpos($temp,$sign)===false)
            return is_string($value)? "='".$this->db->quote($value)."'" : '='.$this->db->quote($value);
        return $value;
    }

    protected function build_query(){
        $sql            = 'select '. (isset($this->parameter['select'])?implode(',',$this->parameter['select']):'*');
        $sql            .= ' from '.$this->table;

        # join
        if(isset($this->parameter['joins'])&& count($this->parameter['joins'])>0) {
            $joins      = [];
            foreach ($this->parameter['joins'] as $join){
                $joins[]    = $join['type'].' join '.$join['table'].' on '.$join['on'];
            }
            $sql        .= ' '.implode(' ',$joins);
        }

        $where          = [];

        # where_or
        if(isset($this->parameter['where_or'])&& count($this->parameter['where_or'])>0) {
            foreach ($this->parameter['where_or'] as $key => $val){
                $where_or = [];
                for($i=0;$i<count($val);$i++){
                    $where_or[] = $key. $this->build_operator($val[$i]);
                }
                $where[]    = '('.implode(' or ',$where_or).')';
            }

        }

        # where
        if(isset($this->parameter['where'])&& count($this->parameter['where'])>0){
            foreach ($this->parameter['where'] as $key => $value){
                $where[]    = $key. $this->build_operator($value);
            }
        }

        if(count($where)>0){
            $sql        .= ' where '. implode(' and ',$where);
        }

        if(isset($this->parameter['group_by'])){
            $sql        .= ' group by '.$this->parameter['group_by'];
        }

        # limit
        if(isset($this->parameter['limit'])){
            $sql        .= ' limit '.$this->parameter['limit']['offset'].','.$this->parameter['limit']['limit'];
        }
        $this->db->setQuery($sql);
        $this->parameter    = [];
    }

    protected function where($array){
        $this->parameter['where']   = $array;
        return $this;
    }

    protected function limit($offset,$limit){
        $this->parameter['limit']   = [
            'offset'    => $offset,
            'limit'     => $limit
        ];
        return $this;
    }

    protected function join($join_table,$join_on,$join_type='inner'){
        $this->parameter['joins'][] = [
            'table'    => $join_table,
            'on'       => $join_on,
            'type'     => $join_type
        ];
        return $this;
    }

    protected function group_by($group_by){
        $this->parameter['group_by']    = $group_by;
        return $this;
    }

    protected function param($parameter){
        $this->parameter    = array_merge($this->parameter,$parameter);
        return $this;
    }

    protected function inner_join($join_table,$join_on){
        return $this->join($join_table,$join_on);
    }

    protected function left_join($join_table,$join_on){
        return $this->join($join_table,$join_on,'left');
    }

    protected function right_join($join_table,$join_on){
        return $this->join($join_table,$join_on,'right');
    }

    protected function getRow(){
        $this->build_query();
        return $this->db->getRow();
    }

    protected function getRows($callback=false){
        $this->build_query();
        return $this->db->getRows($callback);
    }

}