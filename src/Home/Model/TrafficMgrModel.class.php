<?php
namespace Home\Model;

class TrafficMgrModel extends DataMgrBaseModel{
    private $tableName = 'traffic_option';
    
    public function getList($yysType){
        $sql = "select id,price,real_price,real_num from $this->tableName where yys_type_id=$yysType order by num";
        $result = $this->query($sql);
        return empty($result)?'':$result;
    }
    
    public function getInfo($id){
        $sql = "select id,price,real_price,num from $this->tableName where id='$id'";
        $result = $this->query($sql);
        return empty($result)?'':$result[0];
    }

    public function getMobileInfo($mobileInfo){
        $pId = $mobileInfo['p_id'];
        $yysTypeId = $mobileInfo['yys_type'];

        $sql = "select name from traffic_province where id=$pId";
        $pInfo = $this->query($sql);
        $pName =  $pInfo[0]['name'];

        $sql = "select name from traffic_yys where id=$yysTypeId";
        $yysInfo = $this->query($sql);
        $yysName = $yysInfo[0]['name'];

        return array('yys_name'=>$yysName,
                     'p_name'=>$pName);
    }
}