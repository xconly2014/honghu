<?php
namespace Home\Model;
use Utils\ConstantUtils;
class GoodsOrderMgrModel extends DataMgrBaseModel{
    private $tableName = 'goods_order';

    public function AddData($id){
    	$created_date = date('Y-m-d H:i:s',time());
    	$goods_id = $id;
    	
    	$goodsObj = new GoodsMgrModel();
    	$rowData = $goodsObj->getRow($id);
    	$credits = $rowData['order_credits'];
    	
    	$customer_id = get_uid();
    	$credits_record_id = ConstantUtils::$CREDIT_RECORD_NON_ID;
    	$state = ConstantUtils::$GOODS_ORDER_STATE_INIT;
    	$sql ="insert into $this->tableName (created_date,goods_id,credits,customer_id,credits_record_id,state)
    	values('$created_date','$goods_id','$credits','$customer_id','$credits_record_id','$state')";
    	return $this->insert($sql);
    }
    
    public function getRow($oid){
    	$sql = "select goods_id,credits from $this->tableName where id = '$oid'";
    	$info = $this->query($sql);
    	
    	$goodsObj = new GoodsMgrModel();
    	$rowData = $goodsObj->getRow($info[0]['goods_id']);
    	$rowData['credits'] = $info[0]['credits']; 
    	
    	return $rowData;
    }
    
    public function updateInfo($oid,$cid){
    	$modified_date = date('Y-m-d H:i:s',time());
    	$address_info = I('post.address');
    	$state = ConstantUtils::$GOODS_ORDER_STATE_IS_PAID;
    	$name = I('post.recipient');
    	$tel = I('post.tel');
    	$sql = "update $this->tableName set modified_date = '$modified_date',credits_record_id = '$cid',address_info = '$address_info',state = '$state',name = '$name',tel = '$tel' where id = '$oid'";
    	$result = $this->execute($sql);
    	 
    	if(is_int($result)){
    		$order = $this->getOrder($oid);
    		
    		$goodsObj = new GoodsMgrModel();
    		return $goodsObj->updateNum($$order['goods_id']);
    	}
    }
    
    
    public function getList(){
    	$uid = get_uid();
    	$state = ConstantUtils::$GOODS_ORDER_STATE_INIT;
    	
    	$sql = "select A.id,A.created_date,A.goods_id,A.credits,A.state,B.name from $this->tableName as A 
    	LEFT JOIN goods as B on  A.goods_id = B.id
    	where customer_id = '$uid' and state <> '$state' order by A.id desc";
    	$data = $this->query($sql);
    	
    	if($data){
    		$num = count($data);
    		for($i = 0;$i < $num; $i++){
    			$goods[$i]['id'] = $data[$i]['id'];
    			$goods[$i]['type'] = ConstantUtils::$ORDER_TYPE_STRING['TYPE_GOODS'];
    			$goods[$i]['time'] = $data[$i]['created_date'];
    			$goods[$i]['name'] = $data[$i]['name'];
    			$goods[$i]['describe'] = '<a href='.U('Home/User/credits').'>'.$data[$i]['credits'].'积分</a>';
    			$goods[$i]['state'] = ConstantUtils::$CZ_ORDER_STATE[$data[$i]['state']];
    			$goods[$i]['link'] = U('Home/CreditsStore/goods_info',array('id'=>$data[$i]['goods_id']));
    		}
    		return $goods;
    	}else{
    		return "";
    	}
    }

    public function getOrder($oid){
        $sql = "select id,credits,goods_id,state,credits_record_id from $this->tableName where id = '$oid'";
        $result =  $this->query($sql);
        return empty($result) ? '' : $result[0];
    }
    
    
} 