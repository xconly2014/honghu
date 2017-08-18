<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/9/23
 * Time: 10:04
 */

namespace Admin\Model;


use Utils\ConstantUtils;

class GroupBuyCzTicketModel extends DataMgrBaseModel
{
    private $tableName = "group_buy_cz_ticket";

    public function prepareTicket($itemId, $price){
        $userId = ConstantUtils::$ID_NONE;
        $orderId = ConstantUtils::$ID_NONE;
        $isUsed = 0;
        $randTicket = range(1, $price);
        shuffle($randTicket);

        $sepLine = ConstantUtils::$TICKET_SEP_LINE;
        $sql = "insert into $this->tableName(user_id, item_id, order_id, `ticket_text`, is_used)
                value($userId, $itemId, $orderId, $sepLine, $isUsed)";
        $sepLineId = $this->insert($sql);
        foreach ($randTicket as $ticket) {
            $sql = "insert into $this->tableName(user_id, item_id, order_id, `ticket_text`, is_used)
                    value($userId, $itemId, $orderId, $ticket, $isUsed)";
            $this->insert($sql);
        }

        return $sepLineId;
    }
    
    
    public function get_fake_list(){
        
        $sql = "select id,account,num from fake_list";
        $result = $this->query($sql);
        return $result;
    }
    
    public function fake_insert(){
        
        $account = I('post.account');
        $num = I('post.num');
        $sql = "insert into fake_list (account, num) value ('$account','$num')";
        $result = $this->execute($sql);
        
        return $result;      
    }
    
    public function fake_delete($id){
        
        $sql = "delete from fake_list where id='$id'";
        $result = $this->execute($sql);
        
        return $result;
    }

    public function getRow($id){
        $sql = "select user_id from $this->tableName where id = '$id'";
        $res = $this->query($sql);
        return empty($res) ? '' : $res[0];
    }

}