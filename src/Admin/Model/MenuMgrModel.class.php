<?php

namespace Admin\Model;
use Think\Auth;
use Utils\ConstantUtils;

class MenuMgrModel extends DataMgrBaseModel{
	private $tableName = "menu_structure";
	
	public function getMenu(){
		
		$auth = new Auth();
		$userid = get_uid();
		$adminUserId= getAdminUserId($userid);
		
		$data = $auth->getGroups($adminUserId);
		$rids = $data[0]['rules'];
		
		$sql = "select A.title,A.r_id,A.parent_id,B.name from $this->tableName  as A
		LEFT JOIN auth_rule as B on A.r_id = B.id
		where A.r_id in($rids) order by A.r_id asc";
		
		$data = $this->query($sql);
		$top = $this->getTopMenu();
		
		$tnum = count($top);
		$dnum = count($data);
		$info = array();
		
		for($j = 0;$j < $dnum;$j++){
			$data[$j]['function'] = str_replace('Admin/','',$data[$j]['name']);
			$data[$j]['name'] = U($data[$j]['name']);
			
			for($i = 0;$i < $tnum;$i++){
				if($top[$i]['id'] == $data[$j]['parent_id']){
				    $info[$i]['img'] = $top[$i]['bg_img'];
				    $info[$i]['title'] = $top[$i]['title'];
					$info[$i]['data'][] = $data[$j];
				}
			}
		}
		return $info;
	}
	
	
	public function getTopMenu(){
		$sql = "select id,title,bg_img,parent_id from $this->tableName where parent_id = 0 order by id asc";
		return $this->query($sql);
	}
	
	
	public function getSubMenu(){
		$sql = "select id,title,r_id,parent_id from $this->tableName where parent_id <> 0 order by parent_id asc";
		return $this->query($sql);
	}
	
	
	public function getRuleUrl($uid){
	    $auth = new Auth();
	    $AdminUserId = getAdminUserId($uid);
	    $rules = $auth->getGroups($AdminUserId);
	    $first = current(explode(',',$rules[0]['rules']));
	    $sql = "select name from auth_rule where id = '$first'";
	    $result = $this->query($sql);
	    
	    return empty($result) ? U('Home/Index/index') : U($result[0]['name']);
	    
	}

    public function getList(){
        $list = array();

        $topMenu = $this->getTopMenu();
        $subMenu = $this->getSubMenu();

        foreach($topMenu as $topKey=>$topList){
            $list[] = $topList;
             foreach($subMenu  as $subKey=>$subList){
                 if($topList ['id'] == $subList['parent_id'] ){
                     $list[] = $subList;
                 }
             }
        }

        return $list;
    }

    public function insertData(){
        $type = I('post.type');
        $pid = ($type == ConstantUtils::$MENU_TOP_MENU)? 0 : I('post.pid');
        $title = I('post.name');
        $sql = "insert into $this->tableName (parent_id,title) value ('$pid','$title')";
        return $this->execute($sql);
    }

    public function getRow($id){
        $sql = "select id,title,parent_id,r_id from $this->tableName where id ='$id'";
        $result = $this->query($sql);

        $type = ConstantUtils::$MENU_SUB_MENU;
        $type_text = ConstantUtils::$MENU_TYPE[$type];

        if($result[0]['parent_id'] == ConstantUtils::$MENU_TOP_MENU_PARENT_ID){
            $type = ConstantUtils::$MENU_TOP_MENU;
            $type_text = ConstantUtils::$MENU_TYPE[$type];
        }

        $result[0]['type'] = $type;
        $result[0]['type_text'] = $type_text;
        return empty($result) ? '' : $result[0];
    }

    public function updateDate($id){
        $pid = I('post.pid');
        $title = I('post.name');
        $sql = "update $this->tableName set parent_id='$pid',title='$title' where id = '$id' ";
        return $this->execute($sql);
    }

    public function getMenuRid($id){
        $sql = "select r_id from $this->tableName where id = '$id'";
        $result = $this->query($sql);
        return empty($result) ? false : $result[0]['r_id'];
    }

    public function updateRid($id,$r_id){
        $sql = "update $this->tableName set r_id = '$r_id' where id = '$id'";
        return $this->execute($sql);
    }


    public function checkAndUpdateRid($id,$rId){
        $menu_rid = $this->getMenuRid($id);
        if(!$menu_rid){
            return $this->updateRid($id,$rId);
        }
        return true;
    }

    public function delData($id){
        $sql = "delete from $this->tableName where id = '$id'";
        $res = $this->execute($sql);
        if($res){
            $ruleMgr = new RuleMgrModel();
            return $ruleMgr->delRuleByMid($id);
        }
        return $res;
    }


} 