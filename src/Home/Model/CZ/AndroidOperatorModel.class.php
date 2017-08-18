<?php
namespace Home\Model\CZ;


use Home\Model\DataMgrBaseModel;

class AndroidOperatorModel extends DataMgrBaseModel{
    private $table_name = "android_operator";

    public function getOperatorAll() {
        $sql = "select * from $this->table_name";
        return $this->query($sql);
    }

    /**
     * 获取指定的客户端id的客户端名
     */
    public function getOperatorName($id){
        $sql = "select id as operator,name as operatorName from $this->table_name where id in($id)";
        return $data = $this->query($sql);
    }
    
    public function getName($id){
        $sql = "select name from $this->table_name where id = '$id'";
        $result = $this->query($sql);
        return empty($result)? "":$result[0]['name'];
    }

} 