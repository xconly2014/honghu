<?php
namespace Home\Model;

class HelpMgrModel extends DataMgrBaseModel{
    
    public function getList(){
        $sql = "select id,name from help_category";
        $result = $this->query($sql);
        
        if(empty($result)){
            return '';
        }
        $retValue = $result;
        
        foreach ($result as $k=>$v){
            $retValue[$k]['article'] = $this->getArticleList($v['id']);
        }
        return $retValue;
    }
    
    public function getArticleList($help_category_id){
        $sql = "select id,name,text,help_category_id from help_article where help_category_id='$help_category_id'";
        $result = $this->query($sql);
        return empty($result)?'':$result;
    }
    
    public function getInfo($id){
        $sql = "select id,name,text,help_category_id from help_article where id='$id'";
        $result = $this->query($sql);
        return empty($result)?'':$result[0];
    }
}