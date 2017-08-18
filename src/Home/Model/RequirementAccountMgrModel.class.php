<?php
/**
 * 代练需求游戏账号信息表model
 * @author Administrator
 *
 */
namespace Home\Model;


use Utils\ConstantUtils;

class RequirementAccountMgrModel extends DataMgrBaseModel{
	private $tableName = "requirement_game_account";
	
	/**
	 *  添加数据到代练游戏账号信息表
	 * @return string
	 */
	public function addItem(){
		$qufu = I('post.hu_qufu');            		  //游戏区服
		$role = I('post.hu_role');            		  //游戏角色	
		$role_details = I('post.hu_details');          //当前游戏角色
		$result = I('post.hu_result');				  //期望状态
        $platform = I('post.hu_platform');            //游戏平台
		$platform == ConstantUtils::$PLATFORM_IOS ? $operator_id = 0 : $operator_id = intval(I("post.operator")); //客户端
		//整理图片的数据
		formatPicData();
		//获取表中做大的id，用来名图片文件夹的名
		$maxid = $this->getMaxId();
		$num = $maxid + 1;
		$path = ConstantUtils::$UPLOAD_PATH_REQUIREMENT;
		$imgInfo = uploads($num,$path);
		if($imgInfo == "上传文件大小不符！"){
			return $imgInfo;
		}else{
			$image_path = $imgInfo;
		}
		$sql = "insert into $this->tableName (qufu,role,role_details,result,platform,operator_id,image_path)
		value('$qufu','$role','$role_details','$result','$platform','$operator_id','$image_path')";
		return $this->insert($sql);
	}

	
	


	/**
	 *已修改的方式来添加玩家的信息
	 * @param unknown $aid
	 * @return \Think\false
	 */
	public function updateInfo($aid){
		$account = I('post.hu_account');		//游戏账号
		$password = I('post.hu_password');		//游戏密码
		$contact_way = I('post.hu_contact');	//联系方式
		$sql = "update $this->tableName set account = '$account',password = '$password',contact_way = '$contact_way' where id = '$aid'";
		return $this->execute($sql);
	}
	
	
	private function getMaxId(){
		$sql = "select id from $this->tableName order by id desc limit 1";
		$data = $this->query($sql);
		return intval($data[0]['id']);
	}

	/**
	 * 通过id获取字段
	 * @param unknown $nid
	 */
	public function getFieldById($id,$field = '*'){
		$sql = "select ".$field." from $this->tableName where id = '$id'";
		$data = $this->query($sql);
		$in = strpos($field, ',');
		if($field == '*' ||  $in){
			return $data[0];
		}else{
			return $data[0]["$field"];
		}
	}	
	
}
	