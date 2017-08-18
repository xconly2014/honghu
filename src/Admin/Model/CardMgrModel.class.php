<?php
namespace Admin\Model;

use Utils\ConstantUtils;

class CardMgrModel extends DataMgrBaseModel{
    private $tableName = 'card';
    
    public function getList(){
        $sql = "select id, name from $this->tableName order by id desc";
        return $this->query($sql);
    }
    
    public function cardInsert(){
        $name = I('post.name');
        
        $sql = "insert into $this->tableName (name) value ('$name')";
        return $this->execute($sql);
    }
    
    public function cardDel($id){
        $sql = "delete from $this->tableName where id=$id";
        return $this->execute($sql);
    }
    
    public function getRow($id){
        $sql = "select id, name from $this->tableName where id='$id'";
        $result = $this->query($sql);
        if(empty($result)){
            $result[0]['id']= ConstantUtils::$ID_NONE;
            $result[0]['name'] = "";
        }
        return $result[0];
    }
}