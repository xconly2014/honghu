<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-3-20
 * Time: 下午6:02
 */

namespace Home\Model\CZ;



use Home\Model\DataMgrBaseModel;
use Think\Log;

class CZGameAccountIOSModel extends DataMgrBaseModel{
    private $tableName = 'cz_game_account_ios';

    private $fieldSet = null;

    /*
    public function __construct(){
        $this->fieldSet = array(
            'account'=>'游戏账号',
            'role'=>'游戏角色',
            'qufu'=>'区服',
        );
    }
    */

    public function accountInsert(){
        $role = trim($_POST['cz_role']);
        $contact_way = trim($_POST['cz_contact_way']);
        $account = trim($_POST['cz_account']);
        $password = str_replace("'", "''", trim($_POST['cz_password']));
        $qufu = trim($_POST['cz_qufu']);
        $qufu_type = trim($_POST['cz_login_way']);
        $sql = "insert into $this->tableName(role, contact_way, qufu, qufu_type, account,password)
        value('$role', '$contact_way', '$qufu', '$qufu_type', '$account', '$password')";
        return $this -> insert($sql);
    }

    public function isAccountForbbiden($account, $gameId){
        $sql = "select id from account_forbbiden where account='$account' and game_id=$gameId";
        $result = $this->query($sql);
        return !empty($result)&&$result[0]? 1:0;
    }

    public function accountModify($id){
    	$role = I('post.role');
    	$qufu = I('post.qufu');
    	$account = I('post.account');
    	$password = I('post.password');
    	
    	$sql = "update $this->tableName set role='$role',qufu='$qufu',account='$account',password='$password' where id='$id'";
		return $this->execute($sql);
    }

    public function getInfo($id){
        $sql = "select id, account, password, qufu, qufu_type, role, contact_way, occupation from $this->tableName where id=".$id;
        $result = $this->query($sql);
        return empty($result)? "":$result[0];
    }

    /*
    public function __str__($id){
        $sql = "select * from $this->tableName where id=".$id;

        $result = $this->query($sql);
        if(empty($result)){
            return "";
        }

        $row = $result[0];
        $rowInfo = array();
        foreach($row as $key => $value){
            if(!array_key_exists($key, $this->fieldSet)){
                continue;
            }

            $rowInfo[$this->fieldSet[$key]] = $value;
        }
        return $rowInfo;
    }
    */
} 