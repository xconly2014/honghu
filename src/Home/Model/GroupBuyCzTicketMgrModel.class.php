<?php


namespace Home\Model;
use Utils\ConstantUtils;


class GroupBuyCzTicketMgrModel extends DataMgrBaseModel{
    private $tableName = "group_buy_cz_ticket";

    private function translateCode($code){
        return $code + ConstantUtils::$FIXED_NUMBER_CODE -1;
    }
    
    private function reTranslateCode($code){
        return $code - ConstantUtils::$FIXED_NUMBER_CODE + 1;
    }

    /*
     * 同一张订单，对应多条ticket记录
     */
    public function tranCode($orderId, $limitCount){
        $retValue = array('flag'=> false,
                          'data' => "",
                          'short_data' => "");

        $sql = "select ticket_text from $this->tableName where order_id=$orderId";
        $result = $this->query($sql);
        $codeList = array();
        foreach($result as $row){
            $codeList[] = $this->translateCode($row['ticket_text']);
        }

        if(count($codeList) < $limitCount){
            $fullCodeTxt = implode(',',$codeList);
            $retValue['flag'] = false;
            $retValue['data'] = $fullCodeTxt;
            $retValue['short_data'] = $fullCodeTxt;
        }
        else{
            $shortCodeTxt = "";
            for($i=0; $i<$limitCount; $i++){
                $shortCodeTxt.= $codeList[$i].',';
            }
            $shortCodeTxt = rtrim($shortCodeTxt,',').'...';

            $retValue['flag'] = true;
            $retValue['data'] = $codeList;
            $retValue['short_data'] = $shortCodeTxt;
        }

        return $retValue;
    }

    private function getOrderIdSet($id){
        $sql = "select distinct(order_id), user_id from $this->tableName where item_id=$id and is_used =1";
        return $this->query($sql);
    }

    public function getCurrentGbRecord($item_id){
        $userMgr = new UserMgrModel();
        $list = array();
        $listUnit = "";
        $orderIdList = $this->getOrderIdSet($item_id);
        foreach($orderIdList as $order){
            $userInfo = $userMgr->getUserInfo($order['user_id']);
            $listUnit['user'] = $userInfo['short_name'];
            $listUnit['img'] = $userInfo['thumb_img'];

            $codeInfo = $this->tranCode($order['order_id'], ConstantUtils::$TICKET_LIMIT_COUNT_ALL);
            $listUnit['simple_code'] = $codeInfo['short_data'];
            $listUnit['codes_list'] = $codeInfo['data'];
            $listUnit['flag'] = $codeInfo['flag'];

            $list[] = $listUnit;
        }

        return $list;
    }
    
    public function getTicketByOrderId($orderId){
        $sql = "select id,value from $this->tableName where order_id='$orderId'";
        $result = $this->query($sql);
        return empty($result) ? '' : $result[0];
    }
    
    public function getLuckyInfo($id){
   
        $sql = "select id, user_id,order_id,item_id,ticket_text from $this->tableName where id=$id";
        $result = $this->query($sql); 
        
        $codeInfo = $this->tranCode($result[0]['order_id'], 0);
        $result[0]['code'] = $codeInfo['data'];
        
        return  empty($result) ? '':$result[0];
         
    }

    public function getLuckyerTicketId($itemId, $luckyCode){
        $id = ConstantUtils::$ID_NONE;

        $sql = "select id from $this->tableName where item_id=$itemId and ticket_text= $luckyCode";
        $result = $this->query($sql);
        if(!empty($result) && $result[0]['id']){
            $id = $result[0]['id'];
        }

        return $id;
    }

    public function distributeTicket(/*$itemId, $orderId*/$startRowId, $orderId, $uId, $num, $useCount){
       // BackgroudTask(ConstantUtils::$TASK_DISTRIBUTE_TICKET, "", $itemId, $orderId);

        $startId = $startRowId + $useCount + 1;
        $endId = $startId + $num -1;
        $sql = "update $this->tableName set user_id=$uId, order_id=$orderId,is_used=1 where id between $startId and $endId";
        $this->execute($sql);


/*
        $sql = "select id, value from $this->tableName where item_id=$itemId";
        $result = $this->query($sql);
        $ticketSeriNo = "";
        foreach($result as $row){
            $ticketSeriNo = $ticketSeriNo.$row['value'];
        }

        $usedTicket = explode(',', $ticketSeriNo);
        $emptyTicket = array();
        foreach($usedTicket as $ticket){
            $emptyTicket[$ticket] = true;
        }

        $gbczItemMgr = new GroupBuyCzMgrModel();
        $ItemInfo = $gbczItemMgr->getRow($itemId);
        $randTicket = range(1, $ItemInfo['price']);
        shuffle($randTicket);//随机排列
        $disTicket = array();
        $offset = 0;
        $curNum = 0;
        $cutCount = $num;

        while($num>0){
            $partTicket = array_slice($randTicket, $offset, $cutCount);
            foreach($partTicket as $one){
                if(!$emptyTicket[$one]){
                    $disTicket[] = $one;
                    $curNum++;
                    $num--;
                }
            }//foreach
            $offset += $cutCount;
        }

        $ticket = implode(',', $disTicket);
        $sql = "insert into $this->tableName(user_id, item_id, order_id, `value`) value($uId, $itemId, $originalId, '$ticket')";
        $this->execute($sql);
*/
    }

    public function getRow($id){
        $sql = "select id,user_id,item_id,order_id,ticket_text,is_used from $this->tableName where id = '$id'";
        $result = $this->query($sql);
        return empty($result) ? '' : $result[0];
    }

} 