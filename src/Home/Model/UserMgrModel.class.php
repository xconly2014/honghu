<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-3-30
 * Time: 下午5:48
 */

namespace Home\Model;


use Utils\ConstantUtils;

class UserMgrModel extends DataMgrBaseModel{
    private $tableName = 'user';

    private function genExtraDataIfNeed($uId){
        if($uId && session('from_wx')){
            $from = session('from_wx');
            $sql = "insert into extra_register(user_id, from_place) value($uId, $from)";
            $this->insert($sql);
        }//if

        if($uId){
            $tag = session('operator_tag');

            $key = session($tag.'_time');
            if(session($tag) == md5($key.$tag)){
                $sql = "insert into partner(user_id) value($uId)";
                $this->insert($sql);
                session($tag, null);
                session($tag.'_time', null);
            }

        }
    }

    public function insertUser(){
        $nickname = I('post.nickname');
        $password_hash = create_hash(I('post.password_hash'));
        $email = I('post.email');
        $created_date = date('Y-m-d H:i:s',time());

        if($this->checkEmail($email)){
            return;
        }

        $sql = "insert into $this->tableName (status, nickname,password_hash,email,email_is_check, tel, tel_is_bind, created_date,coins,credit,cz_sum,sign_num) value (1, '$nickname','$password_hash','$email',false, '', false,'$created_date',0,0,0,0)";
        $uId = $this->insert($sql);
        $this->genExtraDataIfNeed($uId, I('get.from'));
        return $uId;
    }

    public function insertTel(){
        $tel = I('post.tel');

        if($this->checkTel($tel)){
            return;
        }
        $password_hash = create_hash(I('post.password_hash'));
        $created_date = date('Y-m-d H:i:s',time());

        $sql = "insert into $this->tableName (status, tel, tel_is_bind, email, email_is_check, pwd_question_answer, password_hash,created_date,coins,credit,cz_sum,sign_num)
        value (1, '$tel', true, '', false, 0, '$password_hash','$created_date',0,0,0,0)";
        $uId = $this->insert($sql);
        $this->genExtraDataIfNeed($uId);
        return $uId;
    }

    /*
     *
     * 用户登录认证
     * @param  string  $account 用户名
     * @param  string  $pwd 用户密码
     * @return integer           登录成功：用户ID，
     *                           密码错误：0，
     * 　　　　　　　　　　　　　　　　被禁用：-1
     *
     */
    public function login($account, $pwd){
        $sql = "select id, password_hash, status from user where tel='$account' or email='$account'";
        $result = $this->query($sql);
        if(is_array($result)){
            if(validate_password($pwd, $result[0]['password_hash'])){
                return $result[0]['id'];
            }
            return 0;
        }
        return -1;
    }

    public function logout(){
        session('user_auth', null);
        session('user_auth_sign', null);
        cookie('username',null);
        cookie('userpwd',null);
    }

    public function updateLogin($uId){
        // 更新数据库
        $lastLoginTime = date('Y-m-d H:i:s', NOW_TIME);
        $lastLoginIp = get_client_ip();
        $sql = "update user set last_login_time='$lastLoginTime', last_login_ip='$lastLoginIp' where id=$uId";
        $this->execute($sql);

        $userInfo = $this->getUserInfo($uId);
        $auth = array(
            'uid'             => $userInfo['id'],
            'username'        => $userInfo['display_name'],
            'tel'             => $userInfo['tel'],
            'last_login_time' => $userInfo['last_login_time'],
            'is_trainer'      => $userInfo['is_trainer'],
        );

        session('user_auth', $auth);
        session('user_auth_sign', data_auth_sign($auth));
        session('from_wx', 0);
        return true;
    }

    public function getUserCredit($uId){
        $result = $this->getUserInfo($uId);
        return $result['credit'];
    }

    public function getUserCoin($uId){
        $result = $this->getUserInfo($uId);
        return $result['coins'];
    }
    
    public function getTel($uId){
        $result = $this->getUserInfo($uId);
        return $result['tel'];
    }

    public function userIsTrainer($uid){
        if($uid){
            $info = $this->getUserInfo($uid);
            return $info['is_trainer'];
        }
        return false;
    }

    public function getUserInfo($uId){
        $userInfo = array('name'=>"",
            'tel'=>"",
            'coins'=>"",
            'credit'=>"",
            'level'=>"",
            'login_time'=>"");

        $sql = "select id, ali_name, wx_name, nickname, tel,email, coins, credit, cz_sum, sign_num, level, last_login_time, head_image, is_trainer,password_hash from user where id=".$uId;
        $result = $this->query($sql);
        if(is_array($result)){
            $row = $result[0];
            $userInfo['id'] = $row['id'];
            $userInfo['last_login_time'] = $row['last_login_time'];
            $userInfo['password_hash'] = $row['password_hash'];
            $userInfo['nickname'] = $row['nickname'];
            $userInfo['extra_name'] = !empty($row['tel'])? $row['tel']:$row['email'];
            $userInfo['tel'] = $row['tel'];
            if($row['ali_name']){
                $userInfo['display_name']=$row['ali_name'];
            }
            else if($row['wx_name']){
                $userInfo['display_name']=$row['wx_name'];
            }
            else if($row['tel']){
                $userInfo['display_name']=$row['tel'];
            }
            else if($row['email']){
                $userInfo['display_name']=$row['email'];
            }
            else if($row['nickname']){
                $userInfo['display_name']=$row['nickname'];
            }

            $userInfo['coins'] = $row['coins'];
            $userInfo['credit'] = $row['credit'];
            $userInfo['cz_sum'] = $row['cz_sum'];
            $userInfo['sign_num'] = $row['sign_num'];
            $userInfo['sign_score_times'] = $this->getSignScoreTimes($row['sign_num']);
            $userInfo['level'] = get_ulevel($row['level']);
            $userInfo['login_time'] = $row['last_login_time'];
            $userInfo['img_path'] = '/upload/'.ConstantUtils::$UPOLAD_PATH_USER_ACCOUNT_DEST.'/'.$uId.'/';
            $userInfo['head_img'] = empty($row['head_image'])? ConstantUtils::$DEFAULT_HEAD_IMAGE : ($userInfo['img_path'].$row['head_image']);
            $userInfo['thumb_img'] = empty($row['head_image'])? ConstantUtils::$DEFAULT_THUMB_HEAD_IMAGE : ($userInfo['img_path'].'thumb'.$row['head_image']);
            $userInfo['is_trainer'] = $row['is_trainer'];
            $userInfo['short_name'] = (empty($row['email']))?  (substr_replace($row['tel'],'****',3,4)) : (substr_replace($row['email'], '****', 3, 3));
        }//if

        return $userInfo;
    }

    private function getCredit($uid){
        $creditsRecordMgr = new CreditRecordsMgrModel();
        $currentCredits = $creditsRecordMgr->getCurrentCredits($uid);
        
        return $currentCredits;
        
    }

    private function getCoin($uid){
        
        $coinsRecordMgr = new CoinsRecordMgrModel();
        $currentCoins = $coinsRecordMgr->getCurrentCoins($uid);
        
        return $currentCoins;
    }
    
    private function getGrow($uid){
        $growRecordMgr = new GrowRecordMgrModel();
        $currentGrow = $growRecordMgr->getCurrentGrow($uid);
        
        return $currentGrow;
    }
    /****************　注册时检验函数　********************************/
    public function checkTel($tel){
        $sql = "select id from $this->tableName where tel='$tel'";
        return $this->query($sql);
    }

    public function checkNickname($nickname){

        $sql = "select id from $this->tableName where nickname='$nickname'";
        return $this->query($sql);
    }

    public function checkEmail($email){
        $sql = "select id from $this->tableName where email='$email'";
        return $this->query($sql);
    }

    /***************************************/
    public function bindTel($uid, $tel){
        $sql = "update $this->tableName set tel='$tel', tel_is_bind=1 where id='$uid'";
        return $this->execute($sql);
    }

    public function isTelBind($uid){
        $sql = "select tel_is_bind from $this->tableName where id=$uid";
        $result = $this->query($sql);
        return $result[0]['tel_is_bind'];
    }



    /***************邮箱绑定*****************/

    public function getEmail($uid){
        $sql = "select email, email_is_check from $this->tableName where id=$uid";
        $result = $this->query($sql);
        if($result){
            return array(
                'data'=>$result[0]['email'],
                'status'=>$result[0]['email_is_check']);
        }
        return array(
            'data'=>"",
            'status'=>false);
    }

    public  function setEmail($uid, $email){
        $sql = "update $this->tableName set email='$email',email_is_check=1 where id='$uid'";
        return $this->execute($sql);
    }

    public function isEmailCheck($uid){
        $sql = "select email_is_check from $this->tableName where id=$uid";
        $result = $this->query($sql);

        return !empty($result) && $result[0]['email_is_check']? true:false;
    }

    public function updateEmailStatus($uid, $status){
        $sql = "update $this->tableName set email_is_check=$status where id='$uid'";
        return $this->execute($sql);
    }

    /******************  密码修改　　**********************/
    /* public function checkPassword($uid, $password_hash){
        $sql = "select id from $this->tableName where password_hash='$password_hash' and id='$uid'";
        return $this->query($sql);
    } */

    public function updatePassword($uid, $password_hash){
        $sql = "update $this->tableName set password_hash='$password_hash' where id='$uid'";
        return $this->execute($sql);
    }

    /*
     * 用户是否已经设置密保问题
     */
    public function pwdQuestionIsSet($uid){
        $sql = "select pwd_question_answer from $this->tableName where id=$uid";
        $result = $this->query($sql);

        return $result[0]['pwd_question_answer'] == '0'? false:true;
    }

    public function getQuestionAnswer($uid){
        $sql = "select pwd_question_answer from $this->tableName where id='$uid'";
        $result = $this->query($sql);
        return empty($result)?'':$result[0]['pwd_question_answer'];
    }

    public function updatePwdQuestionAnswer($uid, $question_answer_id){
        $sql = "update $this->tableName set pwd_question_answer='$question_answer_id' where id='$uid'";
        return $this-> execute($sql);
    }
    
    
    //修改密码（找回密码）
    public function updatePass($username,$newpass){
        if($username){
            $modified_date = date('Y-m-d H:i:s',time());
            $sql = "update $this->tableName set modified_date = '$modified_date',password_hash = '$newpass' where email = '$username' or tel = '$username'";
            return $this->execute($sql);
        }
	}
	
	//更新虎币数量
	public function addCoins($uid,$coinsNum){
        $sql = "update $this->tableName set coins = coins + $coinsNum where id='$uid'";
        return $this->execute($sql);
	}

    public function minusCoins($uid, $coinsNum){
        $sql = "update $this->tableName set coins = coins - $coinsNum where id='$uid'";
        return $this->execute($sql);
    }

    public function addCredits($uid, $credits){
        $sql = "update $this->tableName set credit = credit + $credits where id='$uid'";
        return $this->execute($sql);
    }

    public function minusCredits($uid, $credits){
        $sql = "update $this->tableName set credit = credit - $credits where id='$uid'";
        return $this->execute($sql);
    }

    public function addGrowUnit($uid, $unit){
        $sql = "update $this->tableName set cz_sum = cz_sum + $unit where id='$uid'";
        return $this->execute($sql);
    }
    
    public function uploadImg($uid){
        formatPicData();
        $num = $uid;
        $path = ConstantUtils::$UPOLAD_PATH_USER_ACCOUNT_SRC;
        $type = 'headImg';
        $imgInfo = uploads($num,$path,$size='3072000',$type);
        if(!is_array($imgInfo)){        //上传失败就返回 错误信息

            $message = $imgInfo == '上传文件大小不符！' ? '图片大小不能超过3M!' : $imgInfo;
            $data['result'] = false;
            $data['info'] = $message;
            return $data;
        }
        $sql = "update $this->tableName set head_image = '$imgInfo[0]' where id = '$uid'";
        
        $result  = $this->execute($sql);
        
        if($result > 0){
            $path = './Public/upload/'.ConstantUtils::$UPOLAD_PATH_USER_ACCOUNT_DEST.'/'.$uid;
            mkdir($path,0777);
            $result = uploadPicture($imgInfo[0],$uid,150,150,60,60);
            
            if(is_object($result)){
                $data['result'] = true; 
                return $data;
            }
        }
    }
    
    
    public function getHeadImg($uid){
        $sql = "select head_image from $this->tableName where id = '$uid'";
        $result = $this->query($sql);
        
        $img = empty($result)?'':$result[0]['head_image'];
        
        if($img){
            return '/upload/'.ConstantUtils::$UPOLAD_PATH_USER_ACCOUNT_DEST.'/'.$uid.'/'.$img;
        }else{
            return '/img/header.png';
        }
        
    }

    public function isThirdNameIn($type, $name){
        switch($type){
            case ConstantUtils::$THIRD_LOGIN_WX:
                $sql = "select id from $this->tableName where wx_name='$name'";
                break;
            case ConstantUtils::$THIRD_LOGIN_ALI:
                $sql = "select id from $this->tableName where ali_name='$name'";
                break;
        }//switch
        $result = $this->query($sql);
        return !empty($result) && $result[0]['id']? $result[0]['id']:ConstantUtils::$ID_NONE;
    }

    public function createThirdName($type, $name){
        $created_date = date('Y-m-d H:i:s');

        switch($type){
            case ConstantUtils::$THIRD_LOGIN_WX:
                $sql = "INSERT INTO $this->tableName (wx_name, STATUS, nickname,password_hash,email,email_is_check, tel, tel_is_bind, pwd_question_answer,created_date,coins,credit)
                       VALUES ('$name', 1, '','','',FALSE, '', TRUE, 0,'$created_date',0,0)";
                break;
            case ConstantUtils::$THIRD_LOGIN_ALI:
                $sql = "insert into $this->tableName (ali_name, status, nickname,password_hash,email,email_is_check, tel, tel_is_bind, pwd_question_answer,created_date,coins,credit)
                       values ('$name', 1, '','','',false, '', true, 0,'$created_date',0,0)";
                break;
        }//switch
        return $this->insert($sql);
    }
    
    public function addSignNum($uid){
        
        $sql = "update $this->tableName set sign_num=sign_num+1 where id='$uid'";
        return $this->execute($sql);
    }
    
    public function resetSignNum($uid){
        $sql = "update $this->tableName set sign_num=1 where id='$uid'";
        return $this->execute($sql);
    }
    
    private function getSignScoreTimes($sign_num){
        $times = 1;
        if($sign_num < 7){
            $times = 1;
        }
        if(7 <= $sign_num && $sign_num < 14){
            $times = 2;
        }
        if($sign_num >= 14){
            $times = 4;
        }
        return $times;
    }

} 