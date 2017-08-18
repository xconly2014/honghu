<?php
namespace Home\Model\SC;

use Home\Model\DataMgrBaseModel;
use Home\Model\OrderBaseModel;
use Home\Model\GameMgrModel;
use Utils\ConstantUtils;

class IOSScOrderMgrModel extends OrderBaseModel{
    protected $tableName = 'sc_order_ios';

    public function scOrderInsert($sc_account_id){
        $scIos = new IOSScMgrModel();
        $scIosRes = $scIos->getIosOne($sc_account_id);
        $sc_account_id = $scIosRes['id'];
        $game_id = $scIosRes['game_id'];
        $real_payment = floor($scIosRes['price']*$scIosRes['discount']);
        $created_date = date('Y-m-d H:i:s',time());
        $state = ConstantUtils::$SCH_ORDER_STATE_INIT;
        
        $customer_id = get_uid();

        $scGameAccount = new IOSScGameAccountMgrModel();
        $game_account_id = $scGameAccount->scAccountInsert();

        $sql = "insert into $this->tableName(created_date, game_id,sc_account_id,game_account_id,customer_id,real_payment,state)
                value('$created_date', '$game_id','$sc_account_id','$game_account_id','$customer_id','$real_payment','$state')";
        return $this->insert($sql);
    }

    public function getScOrder($id){
        $sql = "select * from $this->tableName where id=$id";
        $result = $this->query($sql);
        return empty($result)?"":$result[0];
    }
    
    public function getInfo($orderId){
        $sql = "select id,game_id,sc_account_id,game_account_id,real_payment from $this->tableName where id=$orderId";
        $result = $this->query($sql);
        if(empty($result)){
            return '';
        }
        $retValue = $result[0];
        
        $game = new GameMgrModel();
        $retValue['game_name'] = $game->getGameName($retValue['game_id']);
        
        $scIos = new IOSScMgrModel();
        $scIosInfo = $scIos->getIosOne($retValue['sc_account_id']);
        $retValue['details'] = $scIosInfo['details'];
        
        $scGameAccount = new IOSScGameAccountMgrModel();
        $accountInfo = $scGameAccount->getGameAccount($retValue['game_account_id']);
        $retValue['accountInfo'] = $accountInfo;
        
        return $retValue;
    }
    
    public function getPayment($id){
        $sql = "select real_payment from $this->tableName where id = '$id'";
        $result = $this->query($sql);
        return empty($result)?"":$result[0]['real_payment'];
        
    }
    
    public function getList(){
        $uid = get_uid();
        $is_paid = ConstantUtils::$IS_PAY['yes'];
        
        $sql = "select A.id,A.game_id,A.sc_account_id,A.real_payment,A.state,B.name,C.details from $this->tableName as  A 
        LEFT JOIN game as B on B.id = A.game_id 
        LEFT JOIN sc_account_ios as C on C.id = A.sc_account_id 
        where A.customer_id = '$uid' and A.is_paid ='$is_paid' order by A.id desc";
        
        $reault = $this->query($sql);
        if($reault){
            foreach($reault as $key=>$list){
                $reault[$key]['system'] = '苹果系统';
                $reault[$key]['state'] = ConstantUtils::$SCH_ORDER_STATE[$list['state']];
                $reault[$key]['link'] = U('Home/IOSSc/addGameAccount',array('sc_id'=>$list['sc_account_id']));
            }
        }
        return empty($reault) ? '' : $reault;
    }
    
    public function addGrowRecord($idNo){
        $oid = $this->getRealId($idNo);
        $orderInfo = $this->getInfo($oid);
        $unit = $orderInfo['real_payment'];
        $type = ConstantUtils::$GROW_RECORD_TYPE_SCH_IOS;
        
        $this->insertGrow($idNo, $oid, $unit, $type);
    }
    public function orderHandle($idNo){
        parent::orderHandle($idNo);
        
        $this->addGrowRecord($idNo);
        $this->orderUpdateState($this->getRealId($idNo));
        BackgroudTask(ConstantUtils::$TASK_SCH_EMAIL, "", "", 1);
    }
    
    private function orderUpdateState($oid){
        $state = ConstantUtils::$SCH_ORDER_STATE_IS_PAID;
        $sql = "update $this->tableName set state = '$state' where id = '$oid'";
        return $this->execute($sql);
    }
} 