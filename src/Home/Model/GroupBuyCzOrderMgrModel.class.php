<?php
namespace Home\Model;
use Utils\ConstantUtils;


class GroupBuyCzOrderMgrModel extends OrderBaseModel{
    protected   $tableName = 'group_buy_cz_order';
    
    public function gb_insert($id){
        $group_buy_cz_id = $id;
        $real_payment = intval(I('post.num'));
        $is_paid = ConstantUtils::$IS_PAY['no'];
        $created_date = date('Y-m-d H:i:s',time());
        $user_id = get_uid();
        
        $sql = "insert into $this->tableName (group_buy_cz_id,real_payment,is_paid,created_date,customer_id)
        values ('$group_buy_cz_id','$real_payment','$is_paid','$created_date','$user_id')";
        
        return $this->insert($sql);
    }
    
    public function getRowOrder($orderId){
        $sql = "select id,group_buy_cz_id,real_payment from $this->tableName where id = '$orderId'";
        $result = $this->query($sql);
        
        $gbczMgr = new GroupBuyCzMgrModel();
        $bgczRes = $gbczMgr->getRow($result[0]['group_buy_cz_id']);
        
        if(!empty($bgczRes)){
            $gameMgr = new GameMgrModel();
            
            $gameInfo = $gameMgr->getInfo($bgczRes['game_id']);
            $bgczRes['game'] = $gameInfo['name'];
            $bgczRes['pic']  = $gameInfo['pic'];
            $bgczRes['payment'] = $result[0]['real_payment'];
            $bgczRes['orderId'] = $orderId;
            
            return $bgczRes;
        }else{
            return '';
        } 
    }
    
    
    public function getFields($orderId){
        $sql = "select id,real_payment,pay_time from $this->tableName where id = '$orderId'";
        $result = $this->query($sql);
        return empty($result) ? '' : $result[0];
    }

    public function getCustomerPaidNum($group_buy_cz_id,$uid){
        $is_paid = ConstantUtils::$IS_PAY['yes'];
        $sql = "select sum(real_payment) as num from $this->tableName where is_paid = $is_paid and group_buy_cz_id = '$group_buy_cz_id' and customer_id = '$uid'";
        return $this->getPaidNum($sql);
    }

    public function getItemPaidNum($group_buy_cz_id){
        $is_paid = ConstantUtils::$IS_PAY['yes'];
        $sql = "select sum(real_payment) as num from $this->tableName where is_paid = $is_paid and group_buy_cz_id = '$group_buy_cz_id'";
        return $this->getPaidNum($sql);
    }

    private function getPaidNum($sql){
        $num = $this->query($sql);
        return empty($num[0]['num']) ? 0 : $num[0]['num'];
    }

    public function getMyGbRecord($uid){
        $is_paid = ConstantUtils::$IS_PAY['yes'];
        
        $sql = "select A.real_payment,B.option_text,B.id,G.name from $this->tableName as A  
        LEFT JOIN group_buy_cz as B on A.group_buy_cz_id = B.id 
        LEFT JOIN game as G on B.game_id = G.id 
        where is_paid = '$is_paid' and customer_id = '$uid' order by A.id desc limit 8";
        
        $result = $this->query($sql);
        return empty($result) ? '' : $result;
    }

   public function getList(){
       $uid = get_uid();
       $sql = "select id from $this->tableName where customer_id='$uid' and is_paid=1";
       $res = $this->query($sql);
       $count = count($res);
       $Page = new \Think\Page($count,8);
       $sql = "select id,group_buy_cz_id, real_payment, created_date from $this->tableName where customer_id='$uid' and is_paid=1 order by id desc limit $Page->firstRow,$Page->listRows";
       $result = $this->query($sql);
       $show = $Page->show();

       $retValue = array();
       $rowUnit = "";
       $groupBuyTicket = new GroupBuyCzTicketMgrModel();
       $groupBuyMgr = new GroupBuyCzMgrModel();
       foreach($result as $row){
           $rowUnit['id'] = $row['id'];
           $rowUnit['created_date'] = $row['created_date'];
           $rowUnit['real_payment'] = $row['real_payment'];
           $rowUnit['group_buy_cz_id'] = $row['group_buy_cz_id'];
           $ticketInfo = $groupBuyTicket->tranCode($row['id'], ConstantUtils::$TICKET_LIMIT_COUNT_SINGLE);
           $groupBuyInfo  = $groupBuyMgr->getRow($row['group_buy_cz_id']);
           $rowUnit['title'] = $groupBuyInfo['option_text'];
           $rowUnit['dued_date'] = $groupBuyInfo['dued_date'];
           $rowUnit['code_list'] = $ticketInfo['data'];
           $rowUnit['simple_code'] = $ticketInfo['short_data'];
           $rowUnit['flag'] = $ticketInfo['flag'];

           if($groupBuyMgr->hasLuckerAnnounced($row['group_buy_cz_id'])){
               $luckerInfo = $groupBuyTicket->getLuckyInfo($groupBuyInfo['lucky_ticket_id']);
               if($luckerInfo && $luckerInfo['user_id'] == get_uid()){
                   $url = U('Home/GroupBuyCz/confirm_info', array('itemId'=>$row['group_buy_cz_id']));
               }//if
           }//if
           $rowUnit['url'] = $url;

           $retValue[] = $rowUnit;
       }
       $resData = array();
       $resData['page'] = $show;
       $resData['list'] = $retValue;

       return $resData;
   }
   
   public function getLastPaytime($group_buy_cz_id){
       $sql = "select pay_time from $this->tableName where group_buy_cz_id = $group_buy_cz_id and is_paid = 1 order by pay_time desc limit 1";
       $result = $this->query($sql);
       return empty($result) ? '' : $result[0]['pay_time'];
   }
  
   public function getLastHundred($group_buy_cz_id){
       $lastPayTime = $this->getLastPaytime($group_buy_cz_id);
   
       $sql = "select A.id,A.pay_time,A.real_payment,A.customer_id,B.option_text from $this->tableName as A
       LEFT JOIN group_buy_cz as B on A.group_buy_cz_id = B.id
       where pay_time <= '$lastPayTime' and is_paid = ".ConstantUtils::$IS_PAY['yes']."  order by A.id desc limit 100";
       $data  =$this->query($sql);
   
       $userMgr = new UserMgrModel();
       $sum = 0;
       foreach($data as $key=>$value){
           $codeArr = explode(' ', $value['pay_time']);
           $data[$key]['code'] = preg_replace("/\.|\:/",'',$codeArr[1]);
           $userInfo = $userMgr->getUserInfo($data[$key]['customer_id']);
           $data[$key]['username'] = $userInfo['short_name'];
           $sum += $data[$key]['code']; 
       }

       $result['sum']  = $sum;
       $result['data'] = $data;
       return $result;
   }

    private function getGroupBuyCZItemId($id){
        $sql = "select group_buy_cz_id from $this->tableName where id=$id";
        $result = $this->query($sql);
        return !empty($result) && $result[0]? $result[0]['group_buy_cz_id']:"";
    }

    private function isTimeToCalLuckCode($soldOutSum, $num){
        return ($soldOutSum == $num) ?  true : false;
    }

    private  function fixedPayTime($idNo){
        $pay_time = microtime_format();
        $sql = "update $this->tableName set pay_time = '$pay_time' where id_no = $idNo";
        return $this->execute($sql);
    }
    
    public function addGrowRecord($idNo){
        $oid = $this->getRealId($idNo);
        $orderInfo = $this->getRowOrder($oid);
        $unit = $orderInfo['payment'];
        $type = ConstantUtils::$GROW_RECORD_TYPE_ONE_GROUP;
        
        $this->insertGrow($idNo, $oid, $unit, $type);
    }
    
    public function orderHandle($idNo){
        parent::orderHandle($idNo);
        $this->addGrowRecord($idNo);
        $result = $this->fixedPayTime($idNo);
        if(is_int($result)){
            $oId = $this->getRealId($idNo);
            $itemId = $this->getGroupBuyCZItemId($oId);
            if($itemId){
                $gbczItemMgr = new GroupBuyCzMgrModel();
                $ticketMgr = new GroupBuyCzTicketMgrModel();
                $itemInfo = $gbczItemMgr->getRow($itemId);
                
                $orderInfo = $this->getRowOrder($oId);
                $paidTicketCount = intval($this->getItemPaidNum($itemId));
                $ticketCount = intval($orderInfo['payment']);
                $usedTicketCount = $paidTicketCount - $ticketCount;
                $startIndex = $itemInfo['sep_line'];
                $uId = $this->getCustomerId($idNo);

                $ticketMgr->distributeTicket($startIndex, $oId, $uId, $ticketCount, $usedTicketCount);

                $flag = $this->isTimeToCalLuckCode($paidTicketCount, $itemInfo['price']);

                if($flag){
                    $payTime = $this->getPaidTime($oId);
                    $sumInfo = $this->getLastHundred($itemId);
                    if($gbczItemMgr->createLuckyCode($itemId,$payTime,$sumInfo['sum'])){
                        $gbczItemMgr->updateState($itemId,ConstantUtils::$GROUP_BUY_STATE_TIMING);

                        $buyerList = $this->getBuyerList($itemId);
                        $messageMgr = new MessageMgrModel();
                        $msgType = ConstantUtils::$MESSAGE_TYPE_GB_FINISH;
                        $extraParam = array(
                            'id'          => $itemId,
                            'option_text' => $itemInfo['option_text']
                        );
                        foreach($buyerList as $buyer){
                            $messageMgr->generateMessage($msgType, $buyer['customer_id'], $extraParam);
                        }//foreach
                        BackgroudTask(ConstantUtils::$TASK_GROUP_BUY_CZ_TIMING, '', '', $itemId);//通知客服
                    }
                    else {
                        //TODO:Log
                    }
                    
                }
            }
        }
    }

    public function getBuyerList($itemId){
        $sql = "select distinct(customer_id) from $this->tableName where group_buy_cz_id=$itemId and is_paid=1";
        return $this->query($sql);
    }

    public function updateTel($id,$tel){
        $sql = "update $this->tableName set tel = '$tel' where id = '$id'";
        return $this->execute($sql);
    }
   
 
} 