<?php
namespace Home\Model;

class OrganizationLogoMgrModel extends DataMgrBaseModel{
    private $tableName = "organization_logo";

    public function getRow($id){
        $sql = "select id,name,pic_name from $this->tableName where id = '$id'";
        $res = $this->query($sql);
        return empty($res) ? '' : $res[0];
    }

    public function getList(){

        $sql = "select id, pic_name, name from $this->tableName where is_used=0";
        return $this->query($sql);
    }

    public function updateLogoState($id){

        $sql = "update $this->tableName set is_used=1 where id='$id'";
        return $this->execute($sql);
    }

}