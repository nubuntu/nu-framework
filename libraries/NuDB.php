<?php

class NuDB {

    private $config;
    private $sql            = '';
    protected $conn         = NULL;
    protected $recordset;

    public function __construct($config){
        $this->config       = $config;
        if(!isset($config['prefix']))
            $this->config['prefix'] = '';
        $this->connect();
    }

    public function connect() {
        $this->conn         = new \mysqli($this->config['host'],$this->config['user'], $this->config['pass'], $this->config['database']);
        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        }
        mysqli_set_charset($this->conn, 'utf8');
    }

    public function setQuery($q){
        $q              = str_replace('#_',$this->config['prefix'],$q);
        $this->sql      = $q;
        return $this;
    }
    
    public function query($affected_rows=true){
        if($this->conn==NULL){
            $this->connect();
        }
        if(!$result = $this->conn->query($this->sql)){
            $this->conn==NULL;
            echo $this->sql;
            die('There was an error running the query [' . $this->conn->error . ']');
        }
        $this->parameter    = [];
        $this->sql          = '';
        if($affected_rows){
            return $this->conn->affected_rows;
        }else{
            return $result;
        }
    }

    public function execute($q){
        return $this->setQuery($q)->query();
    }

    public function getResult(){
        $res = $this->query(false);
        $row = $res->fetch_array(MYSQLI_NUM);
        if(count($row)<1){
            return NULL;
        }else{
            return $row[0];
        }
    }

    public function getRes(){
        return $this->query(false);
    }

    public function getRow(){
        $res = $this->query(false);
        $row = $res->fetch_assoc();
        if(count($row)<1){
            return false;
        }
        return $row;
    }

    public function getRows($callback=false){
        $res = $this->query(false);
        $rows = array();
        while($row=$res->fetch_assoc()){
            $rows[]=$row;
        }
        if(count($rows)<1){
            return false;
        }
        if($callback){
            foreach ($rows as &$row){
                $row = call_user_func($callback,$row);
            }
        }
        return $rows;
    }
    
    function getEscaped( $text, $extra = false )
    {
        $result = mysqli_real_escape_string( $text );
        if ($extra) {
            $result = addcslashes( $result, '%_' );
        }
        return $result;
    }

    function lastId(){
        return $this->conn->insert_id;
    }


    function quote($str){
        return mysqli_real_escape_string($this->conn,$str);
    }
    
}
?>
