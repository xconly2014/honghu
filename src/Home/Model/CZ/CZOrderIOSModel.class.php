<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-3-20
 * Time: 下午6:27
 */

namespace Home\Model\CZ;

use Home\Model\CoinsRecordMgrModel;
use Home\Model\DataMgrBaseModel;
use Home\Model\GameMgrModel;
use Home\Model\GrowRecordMgrModel;
use Home\Model\MessageMgrModel;
use Home\Model\OrderBaseModel;
use Home\Model\PayImp;
use Home\Model\SchRecordMgrModel;
use Utils\ConstantUtils;
use Home\Model\CreditRecordsMgrModel;
use Home\Model\UserMgrModel;
use Home\Model\OrganizationMgrModel;
use Home\Model\ContributionRecordMgrModel;

class CZOrderIOSModel extends OrderBaseModel {
    protected $tableName = 'cz_order_ios';

    public function orderInsert($gameId, $price){
        $customer_id = get_uid();
        
        $remark = I('post.remark');

        $account = new CZGameAccountIOSModel();
        $game_account_id = $account->accountInsert();  //游戏账号id
        $isForbbiden = $account->isAccountForbbiden(trim($_POST['cz_account']), $gameId);
		
        $option_id_arr = $_POST['cz_option'];       //面额id

        $czOptionIOS = new CZOptionIOSMgrModel();
        foreach($option_id_arr as $k => $v){
        	$details[] = $czOptionIOS->getOptionSingle($v);
        }
        $details = join(',',$details);
        
        $option_id = join(',',$option_id_arr);

        $bought_num = $_POST['cz_number'];    //购买数量
        $created_date = date('Y-m-d H:i:s',time());
        $real_payment = round($bought_num*$price,1);
        $state = ConstantUtils::$CZ_ORDER_STATE_INIT;

        $sql = "insert into $this->tableName
        (`is_forbbiden`, `show`, game_id,customer_id,game_account_id,option_id,bought_num,created_date,real_payment, is_paid, state, can_modify,details, remark, is_sc,is_star)
        value($isForbbiden, 1, $gameId, $customer_id, '$game_account_id','$option_id','$bought_num','$created_date','$real_payment', 0, $state, 0,'$details','$remark', 0,0)";
        return $this->insert($sql);
    }
	
    
    public function getMyOrder(){
        $userId = get_uid();
    	$isPaid = ConstantUtils::$CZ_ORDER_STATE_IS_PAID;
    	$gameMgr = new GameMgrModel();
    	$optionMgr = new CZOptionIOSMgrModel();
    	
    	$sql = "select id from $this->tableName where is_paid=$isPaid and customer_id='$userId' and `show`=1";
    	$res = $this->query($sql);
    	$count = count($res);
    	$Page = new \Think\Page($count,8);//实例化分页类，传入总记录数和每页显示的记录条数。
    	$sql = "select id,game_id,option_id,bought_num,real_payment,modified_date,can_modify,details,state from $this->tableName where is_paid=$isPaid and customer_id='$userId' and `show`=1 order by id desc limit $Page->firstRow,$Page->listRows";
    	$result = $this->query($sql);
    	$show = $Page->show();//分页显示输出。
    		
    	$retValue = $result;
    	foreach($result as $k=>$v){
    		$gameInfo = $gameMgr->getInfo($v['game_id']);
    		$retValue[$k]['game_name']=$gameInfo['name'];
            $retValue[$k]['state'] = ConstantUtils::$CZ_ORDER_STATE[$v['state']];
            $retValue[$k]['link_data'] = ConstantUtils::$CZ_ORDER_OPEARTION[$v['state']];
    	}
    	$info['data'] = $retValue;
    	$info['show'] = $show;
    	return $info;        
    }
    
    public function getInfo($id){
        $sql = "select id, id_no, customer_id, game_id, bought_num, real_payment, pay_way, option_id, details, remark, game_account_id
                from $this->tableName where id=".$id;
        $result = $this->query($sql);
        if(empty($result)){
            return "";
        }

        $row = $result[0];
        
        $gameInfo = $this->_getOrderGameInfo($row['game_id']);
        $orderObj['game_name'] = $gameInfo['name'];

		$orderObj['details'] = $row['details'];
        $orderObj['id'] = $id;
        $orderObj['game_id'] = $row['game_id'];
        $orderObj['option_id'] = $row['option_id'];
        $orderObj['number'] = $row['bought_num'];
        $orderObj['payway'] = $row['pay_way'];
        $orderObj['payment'] = $row['real_payment'];
        $orderObj['uid'] = $row['customer_id'];
        $orderObj['remark'] = $row['remark'];
        $orderObj['id_no'] = $row['id_no'];
        $gameAccountInfo = $this->_getOrderGameAccount($row['game_account_id']);

        return array('czInfo'=>$orderObj,
                     'accountInfo'=>$gameAccountInfo);
    }
    
    public function canModifyUpdate($id){
        $modified_date = date('Y-m-d H:i:s',time());
    	$sql = "update $this->tableName set modified_date='$modified_date', can_modify=0, state=1 where id='$id'";
    	return $this->execute($sql);
    }

    public function setPayWay($payWay, $id){
        $sql = "update $this->tableName set pay_way='$payWay' where id=".$id;
        $this->execute($sql);
    }

    public function _getOrderGameInfo($gameId){
        $gameObj = new GameMgrModel();
        return array('name'=>$gameObj->getGameName($gameId),
                     'currency'=>$gameObj->getCurrencyName($gameId));
    }

    public function _getOrderOption($optionId, $currencyName){
        $optionObj = new CZOptionIOSMgrModel();
        return $optionObj->getOptionSingle($optionId);
    }

    public function _getOrderGameAccount($gcId){
        $gameAccountObj = new CZGameAccountIOSModel();
        return $gameAccountObj->getInfo($gcId);
    }

    private function addCredits($idNo){
        $creditsMgr = new CreditRecordsMgrModel();
        $oid = $this->getRealId($idNo);
        $orderInfo = $this->getInfo($oid);

        if(!$creditsMgr->recordExist(ConstantUtils::$CREDITS_TYPE_CZ, $oid)){
            $number = $orderInfo['czInfo']['number'];
            $optionIds = $orderInfo['czInfo']['option_id'];
            $optionIds = explode(',',$optionIds);

            $czOptionMgr = new CZOptionIOSMgrModel();
            $credits = 0;
            foreach($optionIds as $v){
                $credits += $czOptionMgr->getCredits($v);
            }
            $score = $credits * $number;

            $uid = $orderInfo['czInfo']['uid'];

            $creditsMgr->generateCZRecord($uid, $oid, $score);

            $userMgr = new UserMgrModel();
            $userMgr->addCredits($uid, $score);
        }
    }

    private function addSCHCoinsIfNeed($idNo){
        $oid = $this->getRealId($idNo);
        $orderInfo = $this->getInfo($oid);
        $schRecordMgr = new SchRecordMgrModel();
        if($schRecordMgr->isSCHAccount($orderInfo['czInfo']['game_id'], $orderInfo['accountInfo']['account'])){
            $coinsNum = intval($orderInfo['czInfo']['payment']) * ConstantUtils::$CZ_BACK_COINS_MULTIPLE;
            $customerId = $this->getCustomerId($idNo);
            $coinsMgr = new CoinsRecordMgrModel();
            $coinsMgr->generateRecord($oid, $coinsNum, $customerId, ConstantUtils::$HB_RECORD_TYPE_SC_BACK);
            $this->changeOrderToSCH($oid);
        }
    }

    private function changeOrderToSCH($oId){
        $sql = "update $this->tableName set is_sc=1 where id=$oId";
        $this->execute($sql);
    }

    public function changeState($id, $state){
        $sql = "update $this->tableName set state=$state where id=$id"; 
        $this->execute($sql);
    }

    private function addGrowRecord($idNo){
        $oid = $this->getRealId($idNo);
        $orderInfo = $this->getInfo($oid);
        $unit = $orderInfo['czInfo']['payment'];
        $type = ConstantUtils::$GROW_RECORD_TYPE_CZ;
        $customer_id = $this->getCustomerId($idNo);
          
        $this->insertGrow($idNo,$oid,$unit,$type);
    }

    public function orderHandle($idNo){
        parent::orderHandle($idNo);
        $this->addCredits($idNo);
        $this->addSCHCoinsIfNeed($idNo);
        $this->addGrowRecord($idNo);
        $this->addContributionRecord($idNo);
        $this->changeState($this->getRealId($idNo), ConstantUtils::$CZ_ORDER_STATE_IS_PAID);
        BackgroudTask(ConstantUtils::$TASK_CZ_ORDER, "", "", $idNo);
    }


    private function addContributionRecord($idNo){
        $oid = $this->getRealId($idNo);
        $orderInfo = $this->getInfo($oid);
        $user_id = $orderInfo['czInfo']['uid'];
        $payment = $orderInfo['czInfo']['payment'];

        $organizationMgr = new OrganizationMgrModel();
        $organizationMgr->addContributionRecords($user_id,$oid,$payment*ConstantUtils::$CONTRIBUTION_MULTIPLE);
    }

    public function updateForbbidenFlag($id, $flag){
        $sql = "update $this->tableName set is_forbbiden=$flag where id=$id";
        $this->execute($sql);
    }
} 