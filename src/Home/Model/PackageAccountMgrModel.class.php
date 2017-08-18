<?php
namespace Home\Model;

use Utils\ConstantUtils;

class PackageAccountMgrModel extends DataMgrBaseModel{
	
	private $tableName = 'package_game_account';
	
	public function insertAccount(){
        $platform = I('post.platform');            //游戏平台
        ($platform == ConstantUtils::$PLATFORM_IOS) ? $operator_id = 0 : $operator_id = intval(I("post.operator_id")); //客户端
		$account = I('post.account');
		$password = I('post.password');
		$qufu = I('post.qufu');
		$role = I('post.role');
		$role_details = I('post.role_details');
		$role_result = I('post.role_result');
		$contact_way = I('post.contact_way');
		formatPicData();
		$maxid = $this->getMaxId();
		$num = $maxid + 1;
		$path = $path = ConstantUtils::$UPLOAD_PATH_PACKAGE;
		$imgInfo = uploads($num,$path);
		if($imgInfo == "没有文件被上传！"){
			$image_path = "null";
		}else{
			$image_path = $imgInfo;
		}
		
		$sql = "insert into $this->tableName (platform,operator_id,account,password,qufu,role,role_details,role_result,contact_way,image_path) value ('$platform','$operator_id','$account','$password','$qufu','$role','$role_details','$role_result','$contact_way','$image_path')";
		return $this->insert($sql);
	}
	
	private function getMaxId(){
		$sql = "select id from $this->tableName order by id desc limit 1";
		$data = $this->query($sql);
		return intval($data[0]['id']);
	}
}