<?php
namespace Home\Model;

class SuggestMgrModel extends DataMgrBaseModel{
    private $tableName = 'suggestion';
    
    public function suggestInsert(){
        
        $contact_way = I('post.contact_way');
        $advice = I('post.advice');
        $created_date = date('Y-m-d H:i:s',time());
        
        $sql = "insert into $this->tableName (created_date,contact_way,advice) value('$created_date','$contact_way','$advice')";
        return $this->execute($sql);
    }
    
}