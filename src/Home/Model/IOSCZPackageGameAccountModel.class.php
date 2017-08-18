<?php


namespace Home\Model;


use Home\Model\DataMgrBaseModel;

class IOSCZPackageGameAccountModel extends DataMgrBaseModel{
    private $table_name = "cz_package_game_account";

    /**
     *  添加数据到代练游戏账号信息表
     * @return string
     */
    public function addData(){
        $account = I('post.cz_account');            	//游戏账号
        $password = I('post.cz_password');            		//游戏密码
        $qufu = I('post.cz_qufu');          				//游戏区服
        $role = I('post.cz_role');				 		//游戏角色
        $contact_way = I('post.cz_contact_way');				//联系方式

        $sql = "insert into $this->table_name (account,password,qufu,role,contact_way)
		value('$account','$password','$qufu','$role','$contact_way')";
        return $this->insert($sql);
    }

} 