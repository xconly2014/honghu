<?php


namespace Admin\Model;

use Utils\ConstantUtils;
use Utils\SMSMgr;

class CZOrderIOSModel extends DataMgrBaseModel{
    private $tableName = "cz_order_ios";

    public function getList($id)
    {
        $state = ConstantUtils::$CZ_ORDER_STATE_INIT;
        if ($id != ConstantUtils::$ID_NONE) {
            $show = "";
            $sql = "select O.id, O.card_name, O.id_no, O.game_id, O.bought_num, O.details, O.pay_way, O.state, O.receiver, O.customer_id,O.is_star from $this->tableName O, cz_game_account_ios A where O.game_account_id=A.id and (O.id=$id or O.id_no=$id or A.contact_way=$id)";
        }
        else {
            $sql = "select id from $this->tableName where state<>$state";
            $res = $this->query($sql);
            $count = count($res);
            $Page = new \Think\Page($count, 20);
            $show = $Page->show();
            $sql = "select id,card_name, created_date,pay_time, id_no, game_id, bought_num, details, pay_way, state, receiver,customer_id,is_star from $this->tableName where state<>$state order by modified_date desc limit $Page->firstRow,$Page->listRows";
        }

        $result = $this->query($sql);

        $gameMgr = new GameMgrModel();
        $userMgr = new UserMgrModel();
        $tagLinkMgr = new TagLinkMgrModel();

        $rowList = array();
        $rowUnit = array();
        $star_class = ConstantUtils::$STAR_CLASS_NAME;
        foreach ($result as $row) {
            $rowUnit['tag_list'] = $tagLinkMgr->getList($row['id']);
            $rowUnit['create_time'] = $row['created_date'];
            $rowUnit['pay_time'] = $row['pay_time'];
            $rowUnit['oid'] = $row['id'];
            $rowUnit['game'] = $gameMgr->getGameName($row['game_id']);
            $rowUnit['re_user'] = $userMgr->getUserNickName($row['receiver']);
            $rowUnit['number'] = $row['bought_num'];
            $rowUnit['option'] = $row['details'];
            $rowUnit['card_name'] = $row['card_name'] ? $row['card_name'] : '';

            $rowUnit['pay_way'] = $row['pay_way'];
            $rowUnit['state'] = ConstantUtils::$CZ_ORDER_STATE[$row['state']];
            $rowUnit['id_no'] = $row['id_no'];
            $rowUnit['coins_href'] = U('Admin/CoinsOrder/record_list', array('uid'=>$row['customer_id']));
            $rowUnit['back_order_href'] = "";
            $rowUnit['star_class'] = $row['is_star'] ? $star_class : '';
            $cancleInfo = $this->canOrderCancle($row['id']);
            if($cancleInfo['can_cancle']){
                $rowUnit['back_order_href'] = U('Admin/CZOrderIOS/order_cancle', array('id'=>$row['id']));
            }
            $rowUnit['can_cancle'] = $cancleInfo['can_cancle'];
            $rowUnit['color'] = $this->decideColorByState($row['state']);
            $rowList[] = $rowUnit;
        }
        return array('show' => $show, 'data' => $rowList);
    }

    public function decideColorByState($state){
        $color = ConstantUtils::$ORDER_BG_COLOR_UNFINISH;
        if($state == ConstantUtils::$CZ_ORDER_STATE_FINISH){
            $color = ConstantUtils::$ORDER_BG_COLOR_FINISH;
        }

        return $color;
    }

    private function getDateSql($date){
        if(is_array($date) && !empty($date)){
           $retDate = implode(' and ',$date);
        }
        return $retDate;
    }
    
    public function getThirdList($start,$end){
        $date[] = '';
        if($start != ''){
            $date[] = "pay_time>'$start' ";
        }
        if($end != ''){
            $end = $end.' :23:59:59';
            $date[] = "pay_time<'$end' ";
        }
        $is_paid = ConstantUtils::$ORDER_STATE_PAID;
        
        $dateSql = $this->getDateSql($date);
        $sql = "select C.id from $this->tableName C,partner P,game G where C.is_paid=$is_paid and C.customer_id=P.user_id and C.game_id=G.id $dateSql";

        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count, 20);
        $show = $Page->show();
        $info['show'] = $show;
        
        $sql = "select C.id, C.details,G.name, C.pay_time,C.bought_num,C.real_payment,C.state from $this->tableName C,partner P,game G where C.is_paid=$is_paid and C.customer_id=P.user_id and C.game_id=G.id $dateSql";
        $result = $this->query($sql);
        
        $retValue = $result;
        foreach($result as $k=>$v){
            $retValue[$k]['state'] = ConstantUtils::$CZ_ORDER_STATE[$v['state']];
            $countSelect['payment'] += $v['real_payment'];
        }
        if(empty($countSelect['payment'])){
            $countSelect['payment'] = 0;
        }
        $countSelect['number'] = $count;
        $info['data'] = $retValue;
        $info['count'] = $countSelect;
        
        return $info;
    }
    
    public function getInfo($id){
        $sql = "select id,customer_id, game_account_id, game_id,bought_num,details,pay_way,state,real_payment,created_date, remark from $this->tableName where id='$id'";
        $result = $this->query($sql);
        if(empty($result)){
           return '';
        }
        $retValue = $result[0];
        
        $gameMgr = new GameMgrModel();
        $gameRes = $gameMgr->getInfo($retValue['game_id']);
        
        $retValue['game_name'] = $gameRes['name'];
        $retValue['beizhu'] = $gameRes['beizhu'];

        $gameAccountObj = new CZGameAccountIOSModel();
        $gaInfo = $gameAccountObj->getInfo($retValue['game_account_id']);

        $retValue['account'] = $gaInfo['account'];
        $retValue['password'] = $gaInfo['password'];
        $retValue['qufu'] = $gaInfo['qufu'];
        $retValue['qufu_type'] = $gaInfo['qufu_type'];
        $retValue['role'] = $gaInfo['role'];
        $retValue['card_name'] = $result[0]['card_name'];
        $retValue['tel'] = $gaInfo['contact_way'];
        return $retValue;
    }
    
    public function canUpdateState($oid){
        $sql = "select state, receiver from $this->tableName where id=$oid";
        $result = $this->query($sql);
        if(is_array($result) && !empty($result)){
            if($result[0]['state'] == ConstantUtils::$CZ_ORDER_STATE_DOING){
                if($result[0]['receiver'] == get_uid()){
                    return array('status'=>true, 'msg'=>"");
                }
                return array('status'=>false, 'msg'=>"订单当前状态不允许修改");
            }

            return array('status'=>true, 'msg'=>"");
        }//if
        return array('status'=>false, 'msg'=>"获取订单信息失败");
    }
    public function updateState($oid,$state){
        $uid = get_uid();
        $sql = "update $this->tableName set state = '$state',receiver = '$uid' where id = '$oid'";
        $userMgr = new UserMgrModel();
        $receiverName = $userMgr->getUserNickName($uid);
        $stateErrorOrException = array(ConstantUtils::$CZ_ORDER_STATE_ERROR, ConstantUtils::$CZ_ORDER_STATE_ACCOUNT_EXCEPTION);
        if(in_array($state, $stateErrorOrException)){
            $sql = "update $this->tableName set state = '$state', is_send=0, can_modify=1, receiver = '$uid' where id = '$oid'";
        }
        if($state == ConstantUtils::$CZ_ORDER_STATE_IS_PAID){
            $receiverId = ConstantUtils::$ID_NONE;
            $sql = "update $this->tableName set state = '$state', receiver =$receiverId where id = '$oid'";
            $receiverName = '';
        }
        $result = $this->execute($sql);
        
        $data = array('status'=>false, "msg"=>"更新订单状态失败（可能是状态没有改变）");
        if($result){
            $data = $this->processByState($oid, $state);
            $data['username'] = $receiverName;
        }
        return $data;
    }
    
    public function updateCardName($oid,$cardName){
        $sql = "update $this->tableName set card_name='$cardName' where id='$oid'";
        return $this->execute($sql);
    }
    
    private function deleteCzCredit($oid){
        $creditType = ConstantUtils::$CREDITS_TYPE_CZ;
        $sql = "delete from credit_records where original_id=$oid and type=$creditType";
        $this->execute($sql);
    }

    private function sendMsgToCustomer($oid, $msgType){
        $orderInfo = $this->getInfo($oid);
        $msgMgr = new SMSMgr();
        if($orderInfo){
            $tel = $orderInfo['tel'];
            /*if(!preg_match("/1[3458]{1}\d{9}$/",$tel)){
                return array('status'=> false, 'msg'=>"客户填写的手机号码格式不正确，短信未发送");
            }//if*/
        }//if
        return $msgMgr->sendMsg($tel, $msgType, "6666");
    }

    private function processByState($oid, $toState){
            switch($toState){
                case ConstantUtils::$CZ_ORDER_STATE_DOING:
                    $info = $this->sendMsgToCustomer($oid, $toState);
                    break;
                case ConstantUtils::$CZ_ORDER_STATE_FINISH:
                    $info = $this->sendMsgToCustomer($oid, $toState);
                    break;
                case ConstantUtils::$CZ_ORDER_STATE_ERROR:
                    $info = $this->sendMsgToCustomer($oid, $toState);
                    break;
                case ConstantUtils::$CZ_ORDER_STATE_BACK:
                    $this->deleteCzCredit($oid);//消除积分
                    $info = $this->sendMsgToCustomer($oid, $toState);
                    break;
                case ConstantUtils::$CZ_ORDER_STATE_FAILED:
                    $info = $this->sendMsgToCustomer($oid, $toState);
                    break;
                case ConstantUtils::$CZ_ORDER_STATE_ACCOUNT_EXCEPTION:
                    $info = $this->sendMsgToCustomer($oid, $toState);
                    break;
                default:
                    $info = array('status'=>true, 'msg'=>"");
                    break;
            }

        return $info;

    }

    public function cancleOrderImp($id){
        $state = ConstantUtils::$CZ_ORDER_STATE_BACK;
        $sql = "update $this->tableName set is_paid=0, state=$state where id=$id";
        $this->execute($sql);
    }

    public function canOrderCancle($oid){
        $orderInfo = $this->getInfo($oid);
        if(!in_array($orderInfo['pay_way'], ConstantUtils::$HB_PAY)){
            return array(
                'can_cancle'=>false,
                'msg'=>"该操作只支持虎币付款的订单"
            );
        }

        if($orderInfo['state'] == ConstantUtils::$CZ_ORDER_STATE_BACK){
            return array(
                'can_cancle'=>false,
                'msg'=>"订单已被处理"
            );
        }

        if($orderInfo['is_sc']){
            return array(
                'can_cancle'=>false,
                'msg'=>"首充号订单，请联系管理员操作"
            );
        }

        return array(
            'can_cancle'=>true,
            'msg'=>""
        );
    }

    public function orderCancle($oid){
        $orderInfo = $this->getInfo($oid);

        if($orderInfo['real_payment'] < I('post.coins')){
            return array(
                'status'=>false,
                'msg'=>"退款金额不正确"
            );
        }
        $this->cancleOrderImp($oid);

        $creditsRecordMgr = new CreditRecordsMgrModel();
        $creditsRecordMgr->delRecord($oid);
        $creditsInfo = $creditsRecordMgr->user_credit_info($orderInfo['customer_id']);

        $growRecordMgr = new GrowRecordMgrModel();
        $growRecordMgr->delRecord($oid);
        $unitInfo = $growRecordMgr->updateUnitInfo($orderInfo['customer_id']);

        $coinsRecordMgr = new CoinsRecordMgrModel();
        $coinsRecordMgr->addRecord($orderInfo['customer_id'], $oid, I('post.coins'));

        $userMgr = new UserMgrModel();
        $userMgr->addCoins($orderInfo['customer_id'], I('post.coins'));
        $userMgr->updateCredits($orderInfo['customer_id'], $creditsInfo['current']);
        $userMgr->updateUnit($orderInfo['customer_id'], $unitInfo['current']);

        return array(
            'status'=>true,
            'msg'=>""
        );
    }

    public function updateStar($id){

        $old_star = $this->getStarById($id);
        $new_star  = $old_star ? (ConstantUtils::$DARK_STAR) : (ConstantUtils::$BRIGHT_STAR);
        $sql = "update $this->tableName set is_star = '$new_star' where id = '$id'";
        $res = array('state'=>false);
        if($this->execute($sql)){
            $res = array('state'=>true,'data'=>$new_star);
        }
        return $res;

    }

    private function getStarById($id){
        $sql = "select is_star from $this->tableName where id = '$id'";
        $info = $this->query($sql);
        return $info[0]['is_star'];
    }

}