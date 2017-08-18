<?php
namespace Home\Model;

use Utils\ConstantUtils;
class TrafficOrderMgrModel extends OrderBaseModel{
    protected $tableName = 'traffic_order';
    
    public function insertOrder(){
        $option_id = I('post.option_id');
        $pay_way = I('post.pay_way');
        $tel = I('post.tel');
        $is_paid = ConstantUtils::$IS_PAY['no'];
        $customer_id = get_uid();
        
        $traffic = new TrafficMgrModel();
        $trafficInfo = $traffic->getInfo($option_id);
        $real_payment = $trafficInfo['real_price'];

        $sql = "insert into $this->tableName (customer_id, tel, pay_way, real_payment, option_id, is_paid) value ($customer_id, '$tel', '$pay_way', '$real_payment', '$option_id', '$is_paid')";
        return $this->insert($sql);
    }

    private function postService($oid){
        BackgroudTask(ConstantUtils::$TASK_TRAFFIC_SERVICE, "", "", $oid);
    }

    public function orderHandle($idNo){
        parent::orderHandle($idNo);
        $this->postService($this->getRealId($idNo));
    }
}