<?php
namespace Home\Model;

use Utils\ConstantUtils;

class CoinsOrderMgrModel extends OrderBaseModel{
	protected $tableName = 'coins_order';
	
	public function coinsOrderInsert($payment,$coins){
		
		$created_date = date('Y-m-d H:i:s',time());
		$customerId = get_uid();
		$tel = "";
		
		$sql = "insert into $this->tableName (customer_id, real_payment,coins,created_date,tel) value ($customerId, '$payment','$coins','$created_date','$tel')";
		return $this->insert($sql);
	}
	
	public function getInfo($id){
		$sql ="select id, coins, real_payment, pay_way from $this->tableName where id='$id'";
		$result = $this->query($sql);
		return empty($result)?'':$result[0];
	}

    public function orderHandle($idNo){
        parent::orderHandle($idNo);

        $oId = $this->getRealId($idNo);
        $orderInfo = $this->getInfo($oId);
        $coins = $orderInfo['coins'];

        $coinsMgr =  new CoinsRecordMgrModel();
        if(!$coinsMgr->RecordExist($oId, ConstantUtils::$HB_RECORD_TYPE_BUY) && $coins){
			$buyerId = $this->getCustomerId($idNo);
            $coinsMgr->generateRecord($oId, $coins, $buyerId, ConstantUtils::$HB_RECORD_TYPE_BUY);
        }
    }

}