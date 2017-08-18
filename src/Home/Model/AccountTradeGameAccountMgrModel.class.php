<?php
namespace Home\Model;
use Utils\ConstantUtils;

class AccountTradeGameAccountMgrModel extends DataMgrBaseModel{
	private $tableName = "account_trade_game_account";

    public function addData($gid){
        $game_id = $gid;
        $account = I('post.game_account');
        $password = I('post.password');
        $qufu = I('post.game_qufu');
        $role = I('post.juese');
        $contact_way = I('post.contact');
        $occupation = I('post.zhiye');
        $level = I('post.level');
        $comment = I('post.comment');
        $platform = I('post.platform');
        $platform == ConstantUtils::$PLATFORM_IOS ? $operator_id = 0 : $operator_id = intval(I("post.operator")); //客户端
        
        $sql = "insert into $this->tableName (game_id,account,password,qufu,role,contact_way,occupation,level,comment,platform,operator_id)
        value ('$game_id','$account','$password','$qufu','$role','$contact_way','$occupation','$level','$comment','$platform','$operator_id')";
        
        return $this->insert($sql);
    }
    
    public function getRow($id){
        $sql = "select qufu,role,occupation,comment,level,platform,operator_id,game_id from $this->tableName where id = '$id'";
        $result = $this->query($sql);
        return empty($result)?'':$result[0];
    }

} 