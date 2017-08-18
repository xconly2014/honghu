<?php
namespace Admin\Model;

use Utils\ConstantUtils;

class UserMgrModel extends DataMgrBaseModel{
    private $tableName = 'user';

    public function updateTrainer($uid,$id){
        $sql = "update $this->tableName set is_trainer='$id' where id='$uid'";
        return $this->execute($sql);
    }

    public function register_tel($tel, $pwd){
        $curTime = date('Y-m-d H:i:s',time());
        $sql = "insert into $this->tableName(created_date, password_hash, admin, tel, deposit, active, credit, week_credit, `level`)
                values('$curTime', '$pwd', 0, '$tel', 0, 1, 0, 0, 0)";

        $this->execute($sql);
    }

    /*
     *
     * 用户登录认证
     * @param  string  $account 用户名
     * @param  string  $pwd 用户密码
     * @return integer           登录成功：用户ID，
     *                           密码错误：0，
     * 　　　　　　　　　　　　　　　　被禁用：-1
     *						不是管理员-2
     */
    public function login($account, $pwd){
        $sql = "select id, password_hash, status from user where tel='$account' or email='$account'";
        $result = $this->query($sql);
        
        if(is_array($result)){
            if(!validate_password($pwd, $result[0]['password_hash'])){
                return ConstantUtils::$LOGIN_STATE_PWD_ERROR;
            }
            
            $uid = getAdminUserId($result[0]['id']);
            
            if(!$uid){
            	return ConstantUtils::$LOGIN_STATE_USER_NOT_ADMIN;
            }
            
            return $result[0]['id'];
        }
        
        return ConstantUtils::$LOGIN_STATE_USER_NOT_EXIST;

    }

    public function logout(){
        session('user_auth', null);
        session('user_auth_sign', null);
        session('next_url', null);
        cookie('username',null);
        cookie('userpwd',null);
    }

    public function updateLogin($uId){
        // 更新数据库
        $lastLoginTime = date('Y-m-d H:i:s', NOW_TIME);
        $lastLoginIp = get_client_ip();
        $sql = "update user set last_login_time='$lastLoginTime', last_login_ip='$lastLoginIp' where id=$uId";
        $this->execute($sql);

        // 存储到session
        $sql =  "select id, nickname, last_login_time,tel from user where id=".$uId;
        $rows = $this->query($sql);
        $user = $rows[0];
        $auth = array(
            'uid'             => $user['id'],
            'username'        => $user['nickname'],
            'tel'        => $user['tel'],
            'last_login_time' => $lastLoginTime,
        );
        session('user_auth', $auth);
        session('user_auth_sign', data_auth_sign($auth));
        return true;
    }

    public function getUserInfo($uId){
        $userInfo = "";
        $sql = "select nickname, credit, level from user where id='$uId'";
        $result = $this->query($sql);
        if(is_array($result)){
            $row = $result[0];
            $userInfo['name'] = $row['nickname'];
            $userInfo['credit'] = $row['credit'];
            $userInfo['level'] = getUserLevel($row['level']);
        }//if

        return $userInfo;
    }

    
    
    public function getList($name=""){
    	$sql = "select id from $this->tableName where tel like '%$name%' or email like '%$name%'";
    	$res = $this->query($sql);
    	$count = count($res);
    	$Page = new \Think\Page($count,30);
        $sql = "select id, nickname, email, tel, last_login_time, created_date from $this->tableName where tel like '%$name%' or email like '%$name%' limit $Page->firstRow,$Page->listRows";
        $data = $this->query($sql);

        $show = $Page->show();
        $result['show'] = $show;
        $result['data'] = $data;
        return $result;
    }

    public function getUserNickName($uid){
        $name = "";
        $sql = "select nickname from $this->tableName where id = '$uid'";
        $result  = $this->query($sql);
        if(!empty($result)){
            $name = $result[0]['nickname'];
        }
        return $name;
    }

    public function getUserName($uid){
         $sql = "select nickname,tel,email,wx_name, ali_name from $this->tableName where id = '$uid'";
         $result  = $this->query($sql);
         
         if(!empty($result)){
             if($result[0]['tel']){
                 return $result[0]['tel'];
             }
             else if($result[0]['email']){
                 return $result[0]['email'];
             }
             else if($result[0]['nickname']){
                 return $result[0]['nickname'];
             }
             else if($result[0]['wx_name']){
                 return $result[0]['wx_name'];
             }
             else if($result[0]['ali_name']){
                 return $result[0]['ali_name'];
             }
         }
         return '';
    }
    

    
    public function add_admin_user(){
    	$uid = I('post.user_id');
    	$sql = "insert into admin_user (uid) value ('$uid')";
    	return $this->insert($sql);
    }
    
    
    public function add_auth_group_access($admin_user_id){
    	$group = I('post.group_id');
    	$sql = "insert into auth_group_access (uid,group_id) value ('$admin_user_id','$group')";
    	return $this->insert($sql);
    }
    
    
    
    public function admin_list(){
    	$sql = "select A.id,A.uid,C.id as access_id,D.title from admin_user as A
    	LEFT JOIN auth_group_access as C ON C.uid = A.id
    	LEFT JOIN auth_group as D ON C.group_id = D.id ";
    	$data = $this->query($sql);
    	
    	foreach($data as $key=>$list){
    	    $data[$key]['username'] = $this->getUserName($list['uid']);
    	}
    	return empty($data) ? '' : $data;
    	
    }
    
    
    public function get_group_access_info($id){
    	$sql = "select B.uid,A.group_id from auth_group_access as A 
    	LEFT JOIN admin_user as B ON B.id = A.uid 
    	where A.id = '$id'";
    	$result = $this->query($sql);
    	return empty($result) ? '' : $result[0];
    }
    
    
    
    public function update_admin($id){
    	$group_id = I('post.group_id');
    	$sql = "update auth_group_access set group_id = '$group_id' where id = '$id'";
    	return $this->execute($sql);
    }
    
    public function del($id){
    	
    	$sql = "delete from admin_user where id = '$id'";
    	$result = $this->execute($sql);
    	
    	if($result){
    		$sql = "delete from auth_group_access where uid = '$id'";
    		return $this->execute($sql);
    	}
    	
    }

    public function checkUser($username){
        $sql = "select id from $this->tableName where email='$username' or tel = '$username' ";
        $result = $this->query($sql);
        return empty($result) ? 0 : $result[0]['id'];
    }

    public function addCoins($uid,$coinsNum){
        $sql = "update $this->tableName set coins = coins + $coinsNum where id='$uid'";
        return $this->execute($sql);
    }

    public function updateCredits($uid, $credit){
        $sql = "update $this->tableName set credit=$credit where id=$uid";

        $this->execute($sql);
    }

    public function updateUnit($uid, $unit){
        $sql = "update $this->tableName set cz_sum=$unit where id=$uid";

        $this->execute($sql);
    }

    public function getThirdList($name){

        $sql = "select P.id from partner as P
        left join $this->tableName as U on P.user_id = U.id
        where U.tel like '%$name%' or U.email like '%$name%'";
        $res = $this->query($sql);
        $count = count($res);

        $Page = new \Think\Page($count,30);
        $sql = "select P.id,U.email,U.tel,U.created_date,U.last_login_time,U.cz_sum as pay_sum from partner as P
        left join $this->tableName as U on P.user_id = U.id
        where tel like '%$name%' or email like '%$name%' limit $Page->firstRow,$Page->listRows";
        $data = $this->query($sql);

        $show = $Page->show();
        $result['show'] = $show;
        $result['data'] = $data;
        return $result;
    }
} 