<?php
/**
 * 代练需求订单model
 * @author Administrator
 *
 */
namespace Home\Model;

use Utils\ConstantUtils;

class RequirementOrderMgrModel extends OrderBaseModel{
	protected $tableName = "requirement_order";
	
	/**
	 *将数据添加到订单表
	 * @param unknown $nid
	 * @return string
	 */
	public function addOrder($type, $rid, $trainerTel){
		$created_date = date("Y-m-d H:i:s",time()); //创建时间

        $requirementObj = new RequirementMgrModel();
        $isPaid = 0;
        $customer_id = get_uid();

        if($type == ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER){
            $realPayment = $requirementObj->getPrice($rid);
        }
        else if($type == ConstantUtils::$ORDER_TYPE_DEPOSIT_TRAINER){
            $realPayment = $requirementObj->getSecurityPrice($rid);
        }

		$sql = "insert into $this->tableName (trainer_tel, real_payment, created_date, requirement_id, type, is_paid, customer_id)
		values('$trainerTel', $realPayment, '$created_date','$rid','$type', '$isPaid' ,'$customer_id')";
		return $this->insert($sql);	
	}
	
	public function getInfo($id){
	    $sql = "select id,requirement_id, trainer_tel from $this->tableName where id=$id";
	    $result = $this->query($sql);
	    if(empty($result)){
	        return '';
	    }
	    $retValue = $result[0];
	    
	    $requirement = new RequirementMgrModel();
	    $requirementInfo = $requirement->getInfo($retValue['requirement_id']);
	    
	    $retValue['game_name'] = $requirementInfo['game_name'];
	    $retValue['title'] = $requirementInfo['title'];
	    $retValue['security_money'] = $requirementInfo['security_money'];
	    $retValue['money'] = $requirementInfo['money'];
	    
	    return $retValue;
	}

    public function addTradeOrder($contact, $rid){
        $type = ConstantUtils::$ORDER_TYPE_TRADE;
        $created_date = date('Y-m-d H:i:s',time());
        $sql = "insert into $this->tableName (created_date,requirement_id,type,trainer_tel)
			values('$created_date','$rid','$type','$contact')";
        return $this->insert($sql);
    }
	
	/**
	 * 通过订单id查出订单相关的数据信息
	 */
	public function getOrderById($oid){
		//1.通过订单id查出订单表的内容
		$sql = "select requirement_id from $this->tableName where id = '$oid'";
		$orderData = $this->query($sql);
		
		//通过requirement_id获取requirement表的数据
		$requirementObj = new RequirementMgrModel();
		$fiel="title,spend_day,cz_provided,price,game_account_id,game_id";
		$requireData = $requirementObj->getFieldById($orderData[0]['requirement_id'],$fiel);

		//通过game_id获取游戏名
		$gameObj = new GameMgrModel();
		$gameName = $gameObj->getGameName($requireData['game_id']);
		
		//通过game_account_id，获取数据
		$accountObj = new RequirementAccountMgrModel();
		$field = "qufu";
		$qufu = $accountObj->getFieldById($requireData['game_account_id'],$field);
		
		//组装数据
		$data['oid'] 			= $oid;								//订单编号
		$data['hu_title']		= $requireData['title'];			//标题
		$data['hu_days'] 		= $requireData['spend_day'];		//代练天数
		$data['hu_price'] 		= $requireData['price'];			//价格
		$data['hu_game_name'] 	= $gameName;						//游戏名字
		$data['hu_qufu']		= $qufu;							//游戏区服
		//$cons = new ConStantVtics;
		$requireData['cz_provided'] == 1 ? $data['hu_provided'] = '支持' : $data['hu_provided'] = '不支持';
		
		return $data;
	}

    public function getRequirement($id){
        $sql = "select requirement_id from $this->tableName where id=".$id;
        $result = $this->query($sql);
        return !empty($result) && is_array($result)? $result[0]['requirement_id']:0;
    }

    /**
     * 通过订单的requirement_id修改对应的玩家和代练师的订单
     */
    public function updateOrder($rid,$dealOid,$type){
        $modified_date = date("Y-m-d H:i:s",time());
        $sql ="update $this->tableName set parent_order_id = '$dealOid',modified_date = '$modified_date' where requirement_id = '$rid' and type = '$type' ";
        return $this->execute($sql);
    }

    public function getOrderType($id){
        $sql = "select type from $this->tableName where id=$id";
        $result = $this->query($sql);
        return $result[0]['type'];
    }

    public function setParentOrderId($id, $parent_order_id){
        $sql = "update $this->tableName set parent_order_id=$parent_order_id where id=$id ";
        return $this->insert($sql);
    }

    public function orderHandle($idNo){
        parent::orderHandle($idNo);

        $orderId = $this->getRealId($idNo);
        $type = $this->getOrderType($orderId);
        $reqId = $this->getRequirement($orderId);
        $requirementMgr = new RequirementMgrModel();

        if($type == ConstantUtils::$ORDER_TYPE_DEPOSIT_TRAINER){
            $orderInfo = $this->getInfo($orderId);
            $tradeOrderId = $this->addTradeOrder($orderInfo['trainer_tel'], $reqId);
            $requirementMgr->processAfterTrainerPay($reqId, $tradeOrderId, $orderId, $this->getCustomerId($idNo));

            $cashOrderInfo = $requirementMgr->getCashOrder($reqId);
            assert($cashOrderInfo[ConstantUtils::$CASH_ORDER_TRAINER] == $orderId);
            $this->setParentOrderId($cashOrderInfo[ConstantUtils::$CASH_ORDER_PLAYER], $tradeOrderId);
            $this->setParentOrderId($cashOrderInfo[ConstantUtils::$CASH_ORDER_TRAINER], $tradeOrderId);
        }
        else if($type == ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER){
            $requirementMgr->processAfterPlayerPay($reqId, $orderId);
        }
    }

    public function delNotPaidOrderIfNeed($requirement_id){
        $type = ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER;
        $uid = get_uid();

        $sql = "delete from $this->tableName where requirement_id=$requirement_id and type=$type and customer_id=$uid";
        $this->execute($sql);
    }

    public function getSellerOrderHref($rid){
        $retHref = array('url'=>"", 'text'=>"");

        $is_paid = ConstantUtils::$IS_PAY['no'];
        $type = ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER;
        $uid = get_uid();

        $sql = "select id from $this->tableName where requirement_id=$rid and type=$type and is_paid=$is_paid and customer_id=$uid";
        $result = $this->query($sql);
        if(!empty($result) && $result[0]['id']){
            $retHref['url'] =  U('Home/RequirementOrder/pay_price', array('orderId'=>$result[0]['id']));
            $retHref['text'] = "马上付款";
        }

        return  $retHref;
    }
}
	