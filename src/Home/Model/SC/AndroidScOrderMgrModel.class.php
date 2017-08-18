<?php
namespace Home\Model\SC;

use Home\Model\OrderBaseModel;
use Home\Model\GameMgrModel;
use Home\Model\CZ\AndroidOperatorModel;
use Utils\ConstantUtils;

class AndroidScOrderMgrModel extends OrderBaseModel{
    protected $tableName = 'sc_order_android';

    public function scOrderInsert($sc_account_id){
        $scAndroid = new AndroidScMgrModel();
        $scAndroidRes = $scAndroid->getAndroidOne($sc_account_id);
        $sc_account_id = $scAndroidRes['id'];
        $game_id = $scAndroidRes['game_id'];
        $real_payment = floor($scAndroidRes['price']*$scAndroidRes['discount']);
        $created_date = date('Y-m-d H:i:s',time());
        $state = ConstantUtils::$SCH_ORDER_STATE_INIT;
        
        $customer_id = get_uid();

        $scGameAccount = new AndroidScGameAccountMgrModel();
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
    
    public function getPayment($id){
        $sql = "select real_payment from $this->tableName where id = '$id'";
        $result = $this->query($sql);
        return empty($result)?"":$result[0]['real_payment'];
    }
    
    public function getInfo($orderId){
        $sql = "select id,game_id,sc_account_id,real_payment from $this->tableName where id='$orderId'";
        $result = $this->query($sql);
        if(empty($result)){
            return '';
        }
        $retValue = $result[0];
        $game = new GameMgrModel();
        $retValue['game_name'] = $game->getGameName($retValue['game_id']);

        $scAndroid = new AndroidScMgrModel();
        $scAndroidInfo = $scAndroid->getInfo($retValue['sc_account_id']);
        $retValue['details'] = $scAndroidInfo['info'];
        
        return $retValue;
    }
    
    public function getList(){
        $uid = get_uid();
        $is_paid = ConstantUtils::$IS_PAY['yes'];
    
        $sql = "select A.id,A.game_id,A.sc_account_id,A.real_payment,A.state,B.name,C.details from $this->tableName as  A
        LEFT JOIN game as B on B.id = A.game_id
        LEFT JOIN sc_account_android as C on C.id = A.sc_account_id
        where A.customer_id = '$uid' and A.is_paid ='$is_paid' order by A.id desc";
    
        $reault = $this->query($sql);
        if($reault){
            foreach($reault as $key=>$list){
                $reault[$key]['system'] = '安卓系统';
                $reault[$key]['state'] = ConstantUtils::$SCH_ORDER_STATE[$list['state']];
                $reault[$key]['link'] = U('Home/AndroidSc/buy',array('id'=>$list['sc_account_id']));
            }
        }
        return empty($reault) ? '' : $reault;
    }
    
    public function addGrowRecord($idNo){
        $oid = $this->getRealId($idNo);
        $orderInfo = $this->getInfo($oid);
        $unit = $orderInfo['real_payment'];
        $type = ConstantUtils::$GROW_RECORD_TYPE_SCH_ANDROID;
        
        $this->insertGrow($idNo,$oid,$unit,$type);
    }
    
    public function orderHandle($idNo){
        parent::orderHandle($idNo);
        $this->addGrowRecord($idNo);
        $scOrder = new AndroidScOrderMgrModel();
        $scOrder->orderUpdateState($this->getRealId($idNo));
        BackgroudTask(ConstantUtils::$TASK_SCH_EMAIL, "", "", 2);
    }
    
    private function orderUpdateState($oid){
        $state = ConstantUtils::$SCH_ORDER_STATE_IS_PAID;
        $sql = "update $this->tableName set state = '$state' where id = '$oid'";
        return $this->execute($sql);
    }
    
    
    
} 