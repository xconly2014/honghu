<?php
namespace Admin\Model;

use Utils\ConstantUtils;


class ScOrderMgrModel extends DataMgrBaseModel{
     
    
    public function  updateState($oid,$state){
        $data = array('status'=>false,'stateText'=>'');
        $result = $this->changeOrderState($oid, $state);
        if($result){
            $stateText = ConstantUtils::$SCH_ORDER_STATE[$state];
            $data = array('status'=>true,'stateText'=>$stateText);
        }
        return $data;
    }
} 