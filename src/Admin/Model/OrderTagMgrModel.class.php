<?php
namespace Admin\Model;


class OrderTagMgrModel extends DataMgrBaseModel{
    private $TableName = 'order_tag';
    
    public function getList(){
        
        $sql = "select id, name, bg from $this->TableName";
        return $this->query($sql);
    }
    
    public function tagInsert(){
        $name = I('post.name');
        $bg = I('post.bg');
        
        $sql = "insert into $this->TableName (name,bg) value ('$name','$bg')"; 
        return $this->execute($sql);
    }
    
    public function tagDel($id){
        $sql = "delete from $this->TableName where id='$id'";
        return $this->execute($sql);
    }
    
    public function getTagRow($id){
        $sql = "select id,name,bg from $this->TableName where id='$id'";
        $result = $this->query($sql);
        return empty($result)?'':$result[0];
    }
    
}