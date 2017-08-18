<?php
namespace Admin\Model;

class SuggestMgrModel extends DataMgrBaseModel{
    private $tableName = 'suggestion';
    
    public function getList(){
        $sql = "select id, contact_way, advice, created_date from $this->tableName";
        return $this->query($sql);
        
    }
    
    public function deleteSuggest($id){
        $sql = "delete from $this->tableName where id='$id'";
        return $this->execute($sql);
    }
}