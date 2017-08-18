<?php
namespace Admin\Model;
use Utils\ConstantUtils;

class GoodsOrderMgrModel extends DataMgrBaseModel{
	protected $tableName = 'goods_order';
	
	public function getList($keywords){
	    $sql = "select A.id from $this->tableName as A 
	           LEFT JOIN goods as B on A.goods_id = B.id 
	           where A.state != ".ConstantUtils::$GOODS_ORDER_STATE_INIT." and B.name like '%$keywords%'";
	    
	    $res = $this->query($sql);
	    $count = count($res);
	    $Page = new \Think\Page($count,20);
	    
	    $sql = "select A.id,A.customer_id,A.state,A.credits_record_id,B.name,A.credits from $this->tableName as A
	            LEFT JOIN goods as B on A.goods_id = B.id 
	            where A.state != ".ConstantUtils::$GOODS_ORDER_STATE_INIT." and B.name like '%$keywords%' order by A.id desc limit $Page->firstRow,$Page->listRows";
	    
	    $data = $this->query($sql);
	    
	    $userMgr = new UserMgrModel();
	    $creditRecordsMgr = new CreditRecordsMgrModel();
	    
	    foreach($data as $key=>$list){
	        $data[$key]['username'] = $userMgr->getUserName($list['customer_id']);
	        $data[$key]['state'] = ConstantUtils::$GOODS_ORDER_STATE[$list['state']];
	        $data[$key]['pay_time'] = $creditRecordsMgr->getCreatedDate($list['credits_record_id']);
	    }
	    
	    $show = $Page->show();
	    $result['page'] = $show;
	    $result['data'] = $data;
	    return $result;
	}
	
	public function getRow($id){
	    $sql = "select goods_id,name,tel,address_info,state,credits from $this->tableName where id = '$id'";
	    $orderRes = $this->query($sql);
	    
	    $GoodsMgr = new GoodsMgrModel();
	    $result = $GoodsMgr->getInfo($orderRes[0]['goods_id']);
	    
	    $result['recipient'] = $orderRes[0]['name'];
	    $result['contact_way'] = $orderRes[0]['tel'];
	    $result['place'] = $orderRes[0]['address_info'];
	    $result['state'] = ConstantUtils::$GOODS_ORDER_STATE[$orderRes[0]['state']];
	    $result['real_pay_credits'] = $orderRes[0]['credits'];
	    return $result;
  
	}
	
	public function  updateState($oid,$state){
	    $data = array('status'=>false,'stateText'=>'');
	    $result = $this->changeOrderState($oid, $state);
	    if($result){
	        $stateText = ConstantUtils::$GOODS_ORDER_STATE[$state];
	        $data = array('status'=>true,'stateText'=>$stateText);
	    }
	    return $data;
	}
	
	
	
}