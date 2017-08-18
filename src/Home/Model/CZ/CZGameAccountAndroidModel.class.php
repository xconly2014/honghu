<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-3-20
 * Time: 下午6:28
 */

namespace Home\Model\CZ;


use Home\Model\DataMgrBaseModel;

class CZGameAccountAndroidModel extends DataMgrBaseModel{
    private $tableName = 'cz_game_account_android';

    public function accountInsert(){
        $role = trim($_POST['role']);
        $contact_way = trim($_POST['contact_way']);
        $account = trim($_POST['account']);
        $password = trim($_POST['password']);
        $sql = "insert into $this->tableName(role,contact_way,account,password)value('$role','$contact_way','$account','$password')";
        return $this -> insert($sql);
    }

    public function getInfo($id){
        $sql = "select * from $this->tableName where id=".$id;
        $result = $this->query($sql);
        if(empty($result) || !is_array($result)){
            return "";
        }

        return array('ga_account'=> $result[0]['account'],
                     'ga_password'=> $result[0]['password'],
                     'ga_qufu'=> $result[0]['qufu'],
                     'ga_role'=> $result[0]['role'],
                     'ga_contactway' => $result[0]['contact_way']
        );

    }
} 