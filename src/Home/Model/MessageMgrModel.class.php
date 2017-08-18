<?php
namespace Home\Model;

use Utils\ConstantUtils;
class MessageMgrModel extends DataMgrBaseModel{
    private $tableName = 'message';
    
    private function messageInsert($user_id,$text){
        
        $is_read = ConstantUtils::$MESSAGE_NO_READ;
        $created_date = date('Y-m-d H:i:s',time());
        $sql = "insert into $this->tableName (created_date,user_id,`text`,is_read) value ('$created_date','$user_id','$text','$is_read')";
        return $this->execute($sql);
    }
    
    public function getMessageList($uid){
        $sql = "select id from $this->tableName where user_id=$uid";
        $res = $this->query($sql);
        $count = count($res);
        
        $Page = new \Think\Page($count,10);
        $show = $Page->show();
        
        $sql = "select id, created_date, `text` from $this->tableName where user_id='$uid' order by id desc limit $Page->firstRow,$Page->listRows";
        $result = $this->query($sql);
        
        $info['show'] = $show;
        $info['data'] = $result;
        
        return $info;
        
    }
    
    public function updateMessageState($uid){
        $is_read = ConstantUtils::$MESSAGE_IS_READ;
        $sql = "update $this->tableName set is_read='$is_read' where user_id='$uid'";
        return $this->execute($sql);
    }
    
    public function messageNoRead($uid){
        $is_read = ConstantUtils::$MESSAGE_NO_READ;
        $sql = "select count(id) num from $this->tableName where is_read='$is_read' and user_id='$uid'";
        $result = $this->query($sql);
        return empty($result)?'':$result[0]['num'];
    }

    public function generateMessage($type, $uid, $extraParam){
        switch ($type){
            case ConstantUtils::$MESSAGE_TYPE_GB_FINISH:
                $url = U('Home/GroupBuyCz/buy',array('id'=>$extraParam['id']));
                $text = '您购买的一元购<a href="'.$url.'">'.$extraParam['option_text'].'</a>已经满员！';
                break;
            case ConstantUtils::$MESSAGE_TYPE_GB_LUCKER:
                $url = U('Home/GroupBuyCz/confirm_info',array('id'=>$extraParam['id']));
                $text = '恭喜您，您是一元购<b>'.$extraParam['option_text'].'</b>的中奖者，请到<a href="'.$url.'">个人中心</a>填写信息，谢谢！';
                break;
            case ConstantUtils::$MESSAGE_TYPE_VIP_CHANGE:
                $url = U('Home/User/grow_record_list');
                $text = '您的vip成长值已发生变化，点击<a href="'.$url.'">这里</a>了解详情！';
                break;
            case ConstantUtils::$MESSAGE_TYPE_MEMBER_LOGOUT;
                $text = '您的堂会成员<b> '.$extraParam['name'].' </b> 离开了堂会';
                break;
            case ConstantUtils::$MESSAGE_TYPE_MEMBER_KICK;
                $text = '您已经被堂主踢出堂会，贡献值已经兑换成虎币到您的账户！';
                break;
            default:
                break;
        }
        
        $this->messageInsert($uid, $text);
    }
}