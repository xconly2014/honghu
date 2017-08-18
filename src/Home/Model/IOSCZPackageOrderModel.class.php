<?php


namespace Home\Model;


use Utils\ConstantUtils;

class IOSCZPackageOrderModel extends OrderBaseModel {
    protected $tableName = "cz_package_order";

    /**
     *将数据添加到订单表
     * @param unknown $nid
     * @return int
     */
    public function addOrder($id){
        //通过cz_package表的id获取price
        $PackageObj = new IOSCZPackageModel();
        $price = $PackageObj->getPrice($id);
        $created_date = date("Y-m-d H:i:s",time());
        $bought_num = I('post.number');
        $customer_id = get_uid();
        $real_payment = $bought_num * $price;
        $state = ConstantUtils::$CZ_ORDER_STATE_INIT;

        $sql = "insert into $this->tableName (created_date,cz_package_id,customer_id,bought_num,real_payment,is_paid, state)
		values('$created_date','$id','$customer_id','$bought_num','$real_payment',0, $state)";
        return $this->insert($sql);
    }

    /**
     * 修改订单表
     * @param int $oid   订单id
     * @param int $aid	 cz_package_game_account表的id
     * @return \Think\false
     */
    public function insertGameAccount($oid,$aid){
        $sql ="update $this->tableName set game_account_id = '$aid' where id = '$oid'";
        return $this->execute($sql);
    }


    /**
     * 通过cz_package_id来统计套餐的购买数量是否完成(支付后的才算)
     * @param int $id
     */
    public function getSum($id){
        $state = ConstantUtils::$CZ_PACKAGE_ORDER_STATE_CHANGE;
        $sql = "select sum(bought_num) as sum from $this->tableName where cz_package_id = '$id' and is_paid=1 and state!=$state";
        $data = $this->query($sql);
        return   empty($data[0]['sum']) ? 0 :$data[0]['sum'];
    }

    /**
     * 通过订单id获取订单的信息
     */
    public function getOrderById($oid){
        $sql = "select cz_package_id,bought_num,real_payment from $this->tableName where id = '$oid'";
        $orderData = $this->query($sql);

        $packageObj = new IOSCZPackageModel();
        $packageData = $packageObj->getRow($orderData[0]['cz_package_id']);
        
        $data['is_tx'] = $packageData['is_tx'];
        $data['oid'] = $oid;
        $data['text'] = $packageData['option'];
        $data['game_name'] = $packageData['game'];
        $data['price'] = $packageData['price'];
        $data['num'] = $orderData[0]['bought_num'];
        $data['payment'] = $orderData[0]['real_payment'];
        $data['cz_package_id'] = $orderData[0]['cz_package_id'];
        $data['percentage'] = $packageData['percentage'];
        return $data;
    }

    public function getMyOrder(){
    	$uid = get_uid();
    	
    	$sql = "select A.id,A.created_date,A.cz_package_id,A.bought_num,A.state,B.option_text,C.name
        from $this->tableName as A
    	LEFT JOIN `cz_package` as B on A.cz_package_id = B.id 
    	LEFT JOIN `game` as C on B.game_id = C.id 
    	where customer_id = '$uid' and is_paid=1 order by A.id desc";
    	
    	$data = $this->query($sql);
    	
    	if($data){
    		$num = count($data);
    		for($i = 0;$i < $num;$i++){
    			$cz[$i]['id'] = $data[$i]['id'];
    			$cz[$i]['type'] = ConstantUtils::$ORDER_TYPE_STRING['TYPE_CZPACKAGE'];
    			$cz[$i]['time'] = $data[$i]['created_date'];
    			$cz[$i]['name'] = $data[$i]['name'];
    			$cz[$i]['describe'] = $data[$i]['option_text'].'*'.$data[$i]['bought_num'].'笔';
    			$cz[$i]['state'] = ConstantUtils:: $CZ_ORDER_STATE[$data[$i]['state']];
    			$cz[$i]['link'] = U('Home/IOSCZPackage/buy',array('id'=>$data[$i]['cz_package_id']));
    		}
    		return $cz;
    	}else{
    		return "";
    	}
     }

    public function changeState($oId, $state){
        $sql = "update $this->tableName set state =$state where id=$oId";
        $this->execute($sql);
    }
    
    public function addGrowRecord($idNo){
        $oid = $this->getRealId($idNo);
        $orderInfo = $this->getOrderById($oid);
        $unit = $orderInfo['payment'];
        $type = ConstantUtils::$GROW_RECORD_TYPE_CZ_PACKAGE;
        
        $this->insertGrow($idNo, $oid, $unit, $type);
    }
    
    public function orderHandle($idNo){
        parent::orderHandle($idNo);
        $this->addGrowRecord($idNo);
        $czOid = $this->getRealId($idNo);
        $this->changeState($czOid, ConstantUtils::$CZ_ORDER_STATE_IS_PAID);
        $orderInfo = $this->getOrderById($czOid);
        $czItemId = $orderInfo['cz_package_id'];
        $czItemMgr = new IOSCZPackageModel();
        $czItemInfo = $czItemMgr->getRow($czItemId);

        if($this->getSum($czItemId) == $czItemInfo['sum']){
            $czItemMgr->changeActive($czItemId, ConstantUtils::$CZ_PACKAGE_UNACTIVE);
            $czItemMgr->changeState($czItemId, ConstantUtils::$CZ_PACKAGE_STATE_FULL);
            BackgroudTask(ConstantUtils::$TASK_IOS_CZ_PACKAGE, '', '', $czItemId);
        }
    }
} 