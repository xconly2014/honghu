<?php


namespace Home\Model;


class GroupBuyCzLuckerMgrModel extends DataMgrBaseModel{
    private $tableName = 'group_buy_cz_lucker';

    public function addLuckerInfo($item_id){
        $contact_way = I('post.cz_contact_way');
        $account = I('post.cz_account');
        $password = I('post.cz_password');
        $qufu = I('post.cz_qufu');
        $qufu_type = I('post.cz_login_way');
        $role = I('post.cz_role');

        $sql = "insert into $this->tableName (item_id,contact_way,account,password,qufu,qufu_type,role)
                values ('$item_id','$contact_way','$account','$password','$qufu','$qufu_type','$role')";
        return $this->execute($sql);
    }
}