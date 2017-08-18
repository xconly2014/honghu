<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-1-24
 * Time: 下午3:25
 */

namespace Home\Controller;
use Home\Model\CoinsRecordMgrModel;
use Home\Model\CreditRecordsMgrModel;
use Home\Model\EmailAuthKeyMgrModel;
use Home\Model\GameMgrModel;
use Home\Model\GroupBuyCzOrderMgrModel;
use Home\Model\IOSCZPackageOrderModel;
use Home\Model\MessageMgrModel;
use Home\Model\OrganizationLogoMgrModel;
use Home\Model\OrganizationMgrModel;
use Home\Model\PackageMgrModel;
use Home\Model\QuestionAnswerMgrModel;
use Home\Model\RequirementMgrModel;
use Home\Model\SignRecordsMgrModel;
use Home\Model\UserMgrModel;
use Home\Model\PwdAuthKeyMgrModel;
use Utils\ConstantUtils;
use Home\Model\CZ\CZOrderIOSModel;
use Home\Model\IdentifyMgrModel;
use Home\Model\GoodsOrderMgrModel;
use Home\Model\AccountTradeMgrModel;
use Home\Model\SC\IOSScOrderMgrModel;
use Home\Model\SC\AndroidScOrderMgrModel;
use Home\Model\CollectPraiseMgrModel;
use Home\Model\VipLevelMgrModel;
use Home\Model\GrowRecordMgrModel;
use Home\Model\ContributionRecordMgrModel;


class UserController extends  DetectorController{
    public function authentication(){
        if(IS_POST){
            $identify = new IdentifyMgrModel();
            $identifyRes = $identify->insertIdentify();
            if($identifyRes){
                return $this->success('提交成功，等待审核');
            }else{
                return $this->error('提交失败，请重新填写提交');
            }
        }
        $this->assign('cur_page', "authentication");
        $this->theme($this->theme)->display('User/seller/authentication');
    }
    
    public function photo_face(){
        $savename = 'photo_face';
        $this->upload_photo($savename, get_uid());
    }
    
    public function photo_back(){
        $savename = 'photo_back';
        $this->upload_photo($savename, get_uid());
    }
    
    public function photo_body(){
        $savename = 'photo_body';
        $this->upload_photo($savename, get_uid());
    }
    
    private function upload_photo($savename, $uId){
        if (!empty($_FILES)) {
            //图片上传设置
            $config = array(
                    'maxSize'    =>    3145728,
                    'rootPath'	 =>    '/data/uploads/',
                    'savePath'   =>    '/user_idc/',
                    'saveName'   =>    "$savename",
                    'replace'    =>    true,
                    'thumbRemoveOrigin'  =>  true,
                    'exts'       =>    array('jpg', 'gif', 'png'),
                    'autoSub'    =>    true,
                    'subName'    =>    strval($uId)
            );
            $upload = new \Think\Upload($config);// 实例化上传类
            $images = $upload->upload();

            //判断是否有图
            if($images){
                $sessName = session_name();
                cookie('PHPSESSID',I('post.'.$sessName));//有些浏览器里面ajax方式是不传递session的，这种方式间接传递，否则下面这句session会丢失
                session($this->uploadify_name,$images['Filedata']['savename']);//这个地方有些浏览器中会丢失

                $info['savepath']=$images['Filedata']['savepath'];
                $info['savename'] = $images['Filedata']['savename'];
                $this->ajaxReturn($info);//返回文件地址和名给JS作回调用
            }
            else{
                $this->error($upload->getError());//获取失败信息
            }
        }
    }
    
    private function showNumbers($logoList){
        if($this->theme == "mb"){
            $logoList = array_chunk($logoList, 4);
        }
        return $logoList;
        
    }
    
    private function getVipLevel($uid){
        $userMgr = new UserMgrModel();
        $info = $userMgr->getUserInfo($uid);
        
        $vipMgr = new VipLevelMgrModel();
        $vipRes = $vipMgr->getVipInfo($info['cz_sum']);
        $vipLevel = $vipRes['level'];
        
        return empty($vipRes)?'':$vipLevel;
    }
    
    public function family_create(){
        $logoMgr = new OrganizationLogoMgrModel();
        $organizationMgr = new OrganizationMgrModel();
        
        if(IS_AJAX){
            $level = $this->getVipLevel(get_uid());
            if($level != ConstantUtils::$FAMILY_CREATE_VIP_LEVEL){
               
                $this->ajaxReturn(array(
                        'state'=>'false',
                        'message'=>'只有Vip等级为王者的用户才可创建堂会！'
                ));
            }
            
            $isMember = $organizationMgr->isUserJoinOrganization(get_uid());
            if($isMember){
                $this->ajaxReturn(array(
                        'state'=>'false',
                        'message' =>'你已是堂会成员'
                ));
            }
            $organizationId = $organizationMgr->add();
            if($organizationId){
                $familyLogoUsed = $logoMgr->updateLogoState(I('post.family_logo_id'));
                $familyMemberRes = $organizationMgr->memberInsert($organizationId);
                if($familyMemberRes){
                    $this->ajaxReturn(array(
                            'state'=>'true',
                            'message'=>'创建成功'
                    ));
                }
            }
        }   
        
        $familyLogoRes = $logoMgr->getList();
        
        $logoList = $this->showNumbers($familyLogoRes);
        
        $this->assign('family_logo',$logoList);
        $this->theme($this->theme)->display();
    }
    
    public function coins_list(){
        $this->assign('cur_page', "coins_list");

        $coinsRecord = new CoinsRecordMgrModel();
        $coinsRecordList = $coinsRecord->getList(get_uid());

        $user = new UserMgrModel();
        $userRes = $user->getUserInfo(get_uid());
        $coinsTotal = $userRes['coins'];//获取总虎币数

        $this->assign('coins_total',$coinsTotal);
        $this->assign('coins_record_list',$coinsRecordList['data']);
        $this->assign('pager',$coinsRecordList['pager']);
        $this->theme($this->theme)->display();
    }
    
    public function grow_record_list(){
        
        $this->assign('cur_page',"grow_record_list");
        
        $user = new UserMgrModel();
        $userInfo = $user->getuserInfo(get_uid());
        $growTotal = $userInfo['cz_sum'];     
        
        $growRecordMgr = new GrowRecordMgrModel();
        $growRecordRes = $growRecordMgr->getList(get_uid());
        
        $this->assign('grow_total',$growTotal);
        $this->assign('grow_record_list',$growRecordRes['data']);
        $this->assign('show',$growRecordRes['show']);
        $this->theme($this->theme)->display();
    }


    /*************** 忘记密码   *****************************************************/
    public function forget_password_index(){
        if(IS_POST){
            $email = I('email');
            $this->assign("email",$email);
            $this->display('User/forget_pwd/forget_password_email_auth');
        }else{
            $this->theme($this->theme)->display('User/forget_pwd/forget_password_index');
        }
    }

    public function ajax_send_code(){
        if(IS_AJAX){
            $ticket = I('post.ticket');
            $type = I('post.type');           
            if($type == 'email'){
                $vcode = GetfourStr(4);
                $pakObj = new PwdAuthKeyMgrModel();
                $insert_id = $pakObj->insertKey($ticket,strtolower($vcode));
                if($insert_id){
                    session('pass_auth_id',$insert_id);
                    $title = '获取邮箱验证码';
                    $content = '您此次的邮箱验证码为：'.$vcode;
                    BackgroudTask(ConstantUtils::$TASK_EMAIL_CODE, $ticket,$title,$content);
                    $data =array('status'=>'true','data'=>'邮件验证码已发送');
                }                
            }                
            if($type == "tel"){
                $type=ConstantUtils::$MSG_TYPE_FORGET_PWD;
                send_msg($ticket,$type);
                $data =array('status'=>'true','data'=>'短信验证码已经发送');
            }
         
            $this->ajaxReturn($data);
        }
    }


    //检验用户填写的邮箱是否存在数据里
    public function ajax_check_email(){
        if(IS_AJAX){
            $email = I("post.email");
            $userMgr = new UserMgrModel();
            $result = $userMgr->checkEmail($email);
            if($result[0]['id'] > 0){
                echo 'true';
            }else{
                echo 'false';
            }
        }
    }
    
    //用户邮箱验证邮箱是否存在，存在返回错误
    public function ajax_check_email_auth(){
        if(IS_AJAX){
            $email = I("post.email");
            $userMgr = new UserMgrModel();
            $result = $userMgr->checkEmail($email);
            if($result[0]['id'] > 0){
                echo 'false';
            }else{
                echo 'true';
            }
        }
    }


    //检验用户填写的手机是否存在数据库里
    public function ajax_check_tel(){
        if(IS_AJAX){
            $tel = I("post.tel");
            $userMgr = new UserMgrModel();
            $result = $userMgr->checkTel($tel);
            if($result[0]['id'] > 0){
                echo 'true';
            }else{
                echo 'false';
            }
        }
    }

    public function ajax_check_telephone(){
        $user = new UserMgrModel();
        $find = $user->checkTel(I('post.tel'));
        if($find){
            echo 'false';
        }else{
            echo 'true';
        }
    }
    
    //验证身份->邮箱
    public function forget_password_auth(){
        if(IS_POST){
            $id  = session('pass_auth_id');
            session('pass_auth_id',null);
            $pakObj = new PwdAuthKeyMgrModel();
            $result = $pakObj->updateAuthActive($id);
            if(is_int($result)){
                //验证成功
                $this->redirect('Home/User/update_pass',array('id'=>$id));
            }
        }
    }

    //验证身份手机界面
    public function forget_password_tel(){
        if(IS_POST){
            $tel = I('post.tel');
            $this->assign('tel',$tel);
            $this->theme($this->theme)->display('User/forget_pwd/forget_password_tel_auth');
        }
    }

    //重置密码
    function update_pass($id){
        if(IS_GET){
            $pakObj = new PwdAuthKeyMgrModel();
            $ticket = $pakObj->getTicket($id);
            if(!$ticket){
                //TODO:非法或者过期请求！！！
            }
            $this->assign('name', $ticket);
            $this->assign('url',U('Home/User/update_pass',array('id'=>$id)));
            $this->theme($this->theme)->display('User/forget_pwd/forget_password_update_pass');
        }
        if(IS_POST){
            $pakObj = new PwdAuthKeyMgrModel();
            $ticket = $pakObj->getTicket($id);
            if($ticket){
                $newpass = create_hash(I("post.newpass"));
                $userMgr = new UserMgrModel();
                $result = $userMgr->updatePass($ticket,$newpass);
                if(is_int($result)){
                    $pakObj->unvalidTicket($id);
                    $this->redirect('Home/User/forget_password_finish');
                }
            }
        }
    }

    //完成
    public function forget_password_finish(){
        $this->assign('login_url', U('Home/Login/index'));
        $this->theme($this->theme)->display('User/forget_pwd/forget_password_finish');
    }


    /*************** 忘记密码   *****************************************************/



    /***************　 订单中心　***************/
    function chongzhi_list(){
        $iosOrder = new CZOrderIOSModel();
        $czList = $iosOrder->getMyOrder(get_uid());
        $this->assign('cz_list',$czList['data']);
        $this->assign('show',$czList['show']);
        $this->assign('cur_page', "chongzhi_list");
        $this->theme($this->theme)->display('User/buyer/chongzhi_list');
    }

    public function cz_package_order(){
        $this->assign('cur_page', "cz_package_order");
        $CzPackageMgr = new IOSCZPackageOrderModel();
        $orderList = $CzPackageMgr->getMyOrder();
        $this->assign('order_list', $orderList);

        $this->theme($this->theme)->display('User/buyer/cz_package_order');
    }

    public function group_buy_order(){
        $groupBuyOrder = new GroupBuyCzOrderMgrModel();
        $orderList = $groupBuyOrder->getList();
        
        $this->assign('order_list',$orderList['list']);
        $this->assign('show',$orderList['page']);
        $this->assign('cur_page', "group_buy_order");
        
        $this->theme($this->theme)->display('User/buyer/group_buy_order');
    }

    public function goods_order(){
        $goodsOrder = new GoodsOrderMgrModel();
        $goodsList = $goodsOrder->getList();
        $this->assign('order_list',$goodsList);
        $this->assign('cur_page', "goods_order");
        
        $this->theme($this->theme)->display('User/buyer/goods_order');
    }
    
    public function sc_order_list(){
        $IOSScOrder = new IOSScOrderMgrModel();
        $IOSScOrderList = $IOSScOrder->getList();
        $this->assign('ios_sc_sist',$IOSScOrderList);
        
        $AndroidScOrder = new AndroidScOrderMgrModel();
        $AndroidScOrderList = $AndroidScOrder->getList();
        $this->assign('android_sc_sist',$AndroidScOrderList);
        
        $this->assign('cur_page', "sc_order_list");
        $this->theme($this->theme)->display('User/buyer/sc_order_list');
    }

    public function my_account_trade(){
        $atoMgr = new AccountTradeMgrModel();
        $atList = $atoMgr->getMyAccount();
        $this->assign('account_trade_list', $atList);
        
        $this->assign('cur_page',"my_account_trade");
        $this->theme($this->theme)->display('User/seller/my_account_trade');
    }

    public function my_package(){
        $this->assign('cur_page', "my_package");
        $packageMgr = new PackageMgrModel();
        $packageList  = $packageMgr->getMyPackage();

        $this->assign('package_list', $packageList);
        
        $this->theme($this->theme)->display('User/seller/my_package');
    }

    public function my_requirement(){
        
        $this->assign('cur_page', "my_requirement");
        $requirementMgr = new RequirementMgrModel();
        $packageList = $requirementMgr->getMyRequirement();
        $this->assign('requirement_list', $packageList);

        $this->theme($this->theme)->display('User/seller/my_requirement');
    }

    /***************　账号中心　***************/
    function info(){
        $this->assign('cur_page', "info");
        $uid = get_uid();
        
        $signMgr = new SignRecordsMgrModel();
        $isSign = $signMgr->hasSign($uid);
        $this->assign('is_sign', $isSign);

        $curTime = array(
            'year' => date('Y', time()),
            'month'=>date('m', time()),
            'date' =>date('d', time())
        );
        $this->assign("cur_time", $curTime);

        $userMgr = new UserMgrModel();
        $info = $userMgr->getUserInfo($uid);
        $this->assign('cz_sum',$info['cz_sum']);
        $this->assign('img_path',$info['img_path']);
        $this->assign('img',$info['head_img']);
        $this->assign('thumb_img',$info['thumb_img']);
        $this->assign('user_name', $info['display_name']);
        $this->assign('login_time', $info['login_time']);
        $this->assign('credit', $info['credit']);
        $this->assign('is_bind_phone', $info['tel'] || false);
        $this->assign('credits', $info['credit']);
        $this->assign('coins', $info['coins']);

        $vipMgr = new VipLevelMgrModel();
        $vipRes = $vipMgr->getVipInfo($info['cz_sum']);
        $this->assign('vip_level', $vipMgr->getVipLevel());
        $this->assign('vip_info',$vipRes);
        $this->assign('vip_start', ConstantUtils::$VIP_START);
        $this->theme($this->theme)->display();
    }

    /***　安全中心　***/
    function security_center(){
        $this->assign('cur_page', "security_center");
        $this->assign('cur_tab', 'password_modify');
        $this->display('User/security_center/password_modify');
    }

    function password_modify(){
        if(IS_POST){
            $userMgr = new UserMgrModel();
            $uid = get_uid();
            $pwd_hash = create_hash(I('post.password_hash'));
            
            $userRes = $userMgr->updatePassword($uid, $pwd_hash);
            if($userRes){
                $userMgr->logout();
                $this->redirect('Home/User/password_modify_finish');
            }
        }else{
            $this->assign('cur_page', "security_center");
            $this->assign('cur_tab', 'password_modify');
            $this->theme($this->theme)->display('User/security_center/password_modify');
        }
    }

    function password_modify_finish(){
        $this->assign('cur_page', "security_center");
        $this->assign('cur_tab', 'password_modify');
        
        $this->theme($this->theme)->display('User/security_center/password_modify_finish');
    }

    //手机绑定入口
    function mobile(){
        $userMgr = new UserMgrModel();
        $bind = $userMgr->isTelBind(get_uid());
        if($bind){
            $this->redirect('Home/User/mobile_bind_modify');
        }
        else{
            /*
             * 用户名注册类型账号：手机账号为空，未绑定，引导用户绑定手机，分为三步：
             * 　引导页:mobile_bind_index
             * 1.　验证身份(使用邮箱) : mobile_bind_auth
             * 2. 填写验证码 : mobile_bind_vcode
             * 3. 完成 : mobile_bind_finish
             */
            $this->redirect('Home/User/mobile_bind_index');
        }
    }

    /*
     *  引导页
     */
    function mobile_bind_index(){
        if(IS_POST){
            $this->redirect('Home/User/mobile_bind_auth');
        }
        $this->assign('cur_page', "security_center");
        $this->assign('cur_tab', 'mobile');
        $this->theme($this->theme)->display('User/security_center/mobile_bind/mobile_bind_index');
    }

    function mobile_bind_auth(){
        if(IS_POST){
            $this->redirect('Home/User/mobile_bind_vcode');
        }

        /*
         * 对于用户名注册的用户，注册时填写“邮箱”，
         * 必须保证邮箱的有效性
         */
        $userMgr = new UserMgrModel();
        if(!$userMgr->isEmailCheck(get_uid())){
            $this->redirect('Home/User/mobile_bind_check_email');
        }

        $emailInfo = $userMgr->getEmail(get_uid());

        $this->assign('email', $emailInfo['data']);
        $this->assign('cur_page', "security_center");
        $this->assign('cur_tab', 'mobile');
        $this->assign('submit_url', U('Home/User/mobile_bind_auth'));
        $this->theme($this->theme)->display('User/security_center/mobile_bind/mobile_bind_auth');
    }

    function mobile_bind_check_email(){
        if(IS_POST){
            $this->redirect('Home/User/email_auth_wait');
        }

        $this->theme($this->theme)->display('User/security_center/mobile_bind/mobile_bind_check_email');
    }

    function mobile_bind_vcode(){
        if(IS_POST){
            $userMgr = new UserMgrModel();
            $userMgr->bindTel(get_uid(), I('post.tel'));
            $this->redirect('Home/User/mobile_bind_finish');
        }

        $this->assign('vcode', ConstantUtils::$MSG_TYPE_MOBILE_BIND);
        $this->assign('cur_page', "security_center");
        $this->assign('cur_tab', 'mobile');
        $this->theme($this->theme)->display('User/security_center/mobile_bind/mobile_bind_vcode');
    }

    function mobile_bind_finish(){
        $this->assign('cur_page', "security_center");
        $this->assign('cur_tab', 'mobile');
        $this->theme($this->theme)->display('User/security_center/mobile_bind/mobile_bind_finish');
    }

    function mobile_bind_modify(){
        if(IS_POST){
            //TODO:修改逻辑

        }

        $this->assign('submit_url', U('Home/User/mobile_bind_modify'));
        $this->assign('cur_page', "security_center");
        $this->assign('cur_tab', 'mobile');
        $this->theme($this->theme)->display('User/security_center/mobile_bind/mobile_bind_modify');

    }

    //邮箱验证入口
    function email(){
        $userMgr = new UserMgrModel();
        $emailInfo = $userMgr->getEmail(get_uid());

        if($emailInfo['data'] == ""){
            //手机注册用户，邮箱账号为空，引导用户填写邮箱,将分为三步：
            // 1. 身份验证　tel_email_valid
            // 2. 邮箱填写 tel_email_set
            // 3. 完成 email_finish
            $this->redirect('Home/User/tel_email_valid');
        }
        else {
            //用户名注册用户，邮箱账号已填写
            //　１.未验证　email_auth
            //　2.已验证，可修改 email_modify

            if($emailInfo['status'] == false){
                //未验证
                $this->redirect('Home/User/email_auth');
            }
            else{
                //已验证，可修改
                $this->redirect('Home/User/email_modify');
            }
        }
    }

    function tel_email_valid(){
        if(IS_POST){
            $this->redirect('Home/User/tel_email_set');
        }
        $userMgr =  new UserMgrModel();
        $this->assign('tel', $userMgr->getTel(get_uid()));

        $this->assign('submit_url', U('Home/User/tel_email_valid'));
        $this->assign('vcode', ConstantUtils::$MSG_TYPE_SECURITY_EMAIL_AUTH);
        $this->assign('cur_page', "security_center");
        $this->assign('cur_tab', 'email');
        $this->theme($this->theme)->display('User/security_center/email/tel_email_valid');
    }

    function tel_email_set(){
        if(IS_POST){
            $user = new UserMgrModel();
            $user->setEmail(get_uid(), I('post.email'));
            $this->redirect('Home/User/tel_email_finish');
        }else{
            $this->assign('submit_url', U('Home/User/tel_email_set'));
            $this->assign('cur_page', "security_center");
            $this->assign('cur_tab', 'email_valid');
            $this->theme($this->theme)->display('User/security_center/email/tel_email_set');
        }
    }

    function tel_email_finish(){
        $this->assign('cur_page', "security_center");
        $this->assign('cur_tab', 'email');
        $this->assign('submit_url', U('Home/User/pwd_question_modify'));
        $this->theme($this->theme)->display('User/security_center/email/tel_email_finish');
    }


    /**
     * 用户名注册类型账号
     * 注册时已填写邮箱账号，邮箱的存在性未验证
     *
     * 引导用户验证邮箱
     */
    function email_auth(){
        if(IS_POST){
            $this->redirect('Home/User/email_auth_wait');
        }

        $this->assign('cur_page', "security_center");
        $this->assign('cur_tab', 'email');
        $this->assign('submit_url', U('Home/User/email_auth'));
        $this->theme($this->theme)->display('User/security_center/email/email_auth_index');
    }

    /**
     * 验证邮箱:
     * 第二步：发送链接到邮箱
     */
    function email_auth_wait(){
        $user = new UserMgrModel();
        $emailInfo = $user->getEmail(get_uid());
        $this->assign('email',$emailInfo['data']);
        $this->assign('cur_page', "security_center");
        $this->assign('cur_tab', 'email');
        $this->theme($this->theme)->display('User/security_center/email/email_auth_wait');
    }

    /*
     *　异步发送验证链接到邮箱
     */
    function ajax_email_auth_url(){
        if(IS_AJAX){
            $rand_num = mt_rand(1000, 9999);
            $uid = get_uid();
            
            $user = new UserMgrModel();
            $emailInfo = $user->getEmail($uid);
            $email = $emailInfo['data'];
            
            $key = md5($rand_num.$uid.$email);
            
            $url = $_SERVER['HTTP_HOST'].U('Home/User/email_auth_imp').'?key='.$key;
            
            $title = '邮箱验证链接及key';
            $content = '您的邮箱激活链接为：'.$url;
            
            $emailAuthKey = new EmailAuthKeyMgrModel();
            $findEmailKey = $emailAuthKey->checkEmailKey($uid);
            
            if($findEmailKey){
                $emailAuthKey->updateEmailKey($uid,$rand_num,$key);
            }else{
                $emailAuthKey->insertEmailKey($uid,$rand_num,$key);
            }
            
            BackgroudTask(ConstantUtils::$TASK_EMAIL_CODE, $email,$title,$content);
            echo 'success';
        }
    }

    /*
     * 验证邮箱：
     * 第二步：从邮箱点击链接进入
     */
    function email_auth_imp(){
        
            $uid = get_uid();
            $emailAuthKey = new EmailAuthKeyMgrModel();
            $checkedRes = $emailAuthKey->checkEmailKey($uid);

            if($checkedRes['key'] == I('get.key') && time() - strtotime($checkedRes['created_date']) < 600){
                $user = new UserMgrModel();
                $user->updateEmailStatus($uid, true);

                $active = $emailAuthKey->getKeyActive($uid);
                if($active){
                    $emailAuthKey->updateKeyActive($uid);
                    $this->redirect('Home/User/auth_email_finish');
                }else{
                    $this->error('邮箱已验证',U('Home/User/auth_email_finish'),1);
                }
            }else{
                $this->error('验证链接已过期，请重新发送获取','email_auth',1);
            }
       
    }

    public function auth_email_finish(){
        $this->assign('cur_page', "security_center");
        $this->assign('cur_tab', 'email');
        $this->assign('submit_url', U('Home/User/pwd_question_modify'));
        $this->theme($this->theme)->display('User/security_center/email/auth_email_finish');
    }


    /**
     * 修改邮箱
     */
    function email_modify(){
        if(IS_POST){
            //TODO:
        }

        $this->assign('cur_page', "security_center");
        $this->assign('cur_tab', 'email');
        $this->assign('submit_url', U('Home/User/email_modify'));
        $this->theme($this->theme)->display('User/security_center/email/email_modify');
    }


    ///////////////////////////////////////////////////////////////


    function credits(){
        $this->assign('cur_page', "credits");
        
        $creditMgr = new CreditRecordsMgrModel();
        $creditRecordList = $creditMgr->getList(get_uid());
        $this->assign('credit_record_list',$creditRecordList['data']);
        $this->assign('pager',$creditRecordList['pager']);

        $user = new UserMgrModel();
        $credits = $user->getUserCredit(get_uid());
        $this->assign('credits_total', $credits);
        $this->theme($this->theme)->display();
    }

    function invite_friend(){
        $this->assign('cur_page', "invite_friend");
        $this->display();
    }

    function sign(){
        $userMgr = new UserMgrModel();
        $uid = get_uid();
        $signRecordMgr = new SignRecordsMgrModel();
        $signFlag = $signRecordMgr->hasSign($uid);
        if(!$signFlag){
            $shouldUpdate = $signRecordMgr->isSignContinuous($uid);
            if($shouldUpdate){
                $userMgr->addSignNum($uid);
            }else{
                $userMgr->resetSignNum($uid);
            }
            
            $userInfo = $userMgr->getUserInfo($uid);
            $srId = $signRecordMgr->generateSignRecords();
            
            $vipLevelMgr = new VipLevelMgrModel();
            $score= $vipLevelMgr -> getVipSignScore($userInfo['cz_sum']) * $userInfo['sign_score_times'];
            
            $creditMgr = new CreditRecordsMgrModel();
            $creditMgr->generateSignRecord($srId, $uid,$score);
            $userMgr->addCredits($uid,$score);

            $data['result'] = 0;
            $data['score'] = $score;
            $data['sign_num'] = $userInfo['sign_num'];
        }
        else{
            $userInfo = $userMgr->getUserInfo($uid);
            $vipLevelMgr = new VipLevelMgrModel();
            $score= $vipLevelMgr -> getVipSignScore($userInfo['cz_sum']) * $userInfo['sign_score_times'];

            $data['score'] = $score;
            $data['sign_num'] = $userInfo['sign_num'];
            $data['result'] = 1;
        }

        $this->ajaxReturn($data);
    }

    // 点击切换验证码
    public function vcode(){
        $config = array(
            'length'   =>4,
        );
        $Verify = new \Think\Verify($config);
        $Verify->codeSet = 'abcdefghjkmnpqrstvwxyABCDEFGHJKMNOPQRSTVWXY123456789';
        $Verify->entry();
    }



    ############################################################
    //判断验证码 $code为用户输入的验证码
    public function check_vcode($code, $id = ''){
        $vcode = new \Think\Verify();
        //返回布尔值
        return $vcode->check($code, $id);
    }

    public function ajax_check_vcode(){
        if(IS_AJAX){
            $vcode = I('post.vcode');
            if($this->check_vcode($vcode)){
                echo 'true';
            }else{
                echo 'false';
            }
        }
    }

    public function ajax_check_password(){
        if(IS_AJAX){
            $uid = get_uid();
            $old_pwd_hash = I('post.old_password_hash');
            
            $user = new UserMgrModel();
            $userInfo = $user->getUserInfo($uid);
            $result = validate_password($old_pwd_hash,$userInfo['password_hash']);
            if($result){
                echo 'true';
            }else{
                echo 'false';
            }
        }   
    }

    public function ajax_check_answer(){
        if(IS_AJAX){
            $userMgr = new UserMgrModel();
            $qaId = $userMgr->getQuestionAnswer(get_uid());
            
            $answer = I('post.check_answer');
            $questionAnswer = new QuestionAnswerMgrModel();
            $find = $questionAnswer->checkAnswer($qaId, $answer);
            if($find){
                echo 'true';
            }else{
                echo 'false';
            }  
        }
    }    
    
    public function uploadImg(){
        $usermgr = new UserMgrModel();
        $uid = get_uid();
        $data = $usermgr->uploadImg($uid);
        
        if($data['result']){
            
            $this->success("头像上传成功", U('Home/User/info'));
        }else{
            $this->error($data['info'],U('Home/User/info'));
        }
    }

    //“安全中心”短信验证码：发送
    public function ajax_send_msg(){
        if(IS_AJAX){
            $tel = I('post.tel');
            $type= I('post.type');
            echo send_msg($tel,$type);
        }
    }

    //“安全中心”短信验证码：验证
    public function ajax_check_tel_code(){
        if(IS_AJAX){
            echo check_msg_code();
        }
    
    }
    
    public function getSignList(){
        
        
        $signRecordMgr = new SignRecordsMgrModel();
        $recordList = $signRecordMgr->getList(get_uid());
        $this->ajaxReturn(array('signList'=>$recordList));
    }


    public function collect(){
        $collectMgr = new CollectPraiseMgrModel();
        if(IS_POST){
            $uid = get_uid();
            $result = $collectMgr->addData($uid);
            if($result['status']){
                $this->redirect('collect_finish');
            }
            return $this->error($result['msg'], U('Home/User/collect'));
        }

        $is_activity = $collectMgr->collectActivity();
        $gameMgr = new GameMgrModel();
        $result = $gameMgr->getAllGame();

        $this->assign('game_list',$result);
        $this->assign('url',U('Home/User/collect'));
        $this->assign('cur_page', "collect");
        $this->assign('is_activity',$is_activity);

        return $this->theme($this->theme)->display();

    }


    public function collect_finish(){
        $this->assign('cur_page', "collect");
        $this->theme($this->theme)->display();
    }

    function message(){        
        $message = new MessageMgrModel();
        $messageList = $message->getMessageList(get_uid());
        $message->updateMessageState(get_uid());

        $this->assign('message_list',$messageList['data']);
        $this->assign('show',$messageList['show']);
        $this->assign('cur_page', "message");
        $this->theme($this->theme)->display();
    }

    public function contribution_list(){
        $user_id = get_uid();
        $organizationMgr = new OrganizationMgrModel();
        if($organizationMgr->isUserInOrganizationEver($user_id)){
            $memberInfo = $organizationMgr->getMemberRow($user_id);

            $this->assign('total_sum', $memberInfo['contribt_sum']);

            $RecordMgr = new ContributionRecordMgrModel();
            $res = $RecordMgr->getMyList($user_id);

            $this->assign('record_list', $res['data']);
            $this->assign('show', $res['page']);
            $this->assign('cur_page', "contribution_list");
            return $this->theme($this->theme)->display();
    }
    }

    public function members_manage(){
        $user_id = get_uid();
        if(checkIdentity($user_id) == ConstantUtils::$IDENTITY_MANAGER){
            $organizationMgr = new OrganizationMgrModel();
            $res = $organizationMgr->getMyMembers($user_id);

            $this->assign('members',$res['data']);
            $this->assign('page',$res['page']);
            return $this->theme($this->theme)->display();
        }
        $this->error('您不是堂主',U('Home/User/info'));
    }

    public function family_kick(){
        if(IS_AJAX){
            $retVal = array('status'=>false, 'msg'=>"操作失败");
            $uId = I('post.uid');
            $organizationMgr = new OrganizationMgrModel();
            $res = $organizationMgr->kickMember($uId);
            if($res){
                $retVal['status'] = true;
                $retVal['msg'] = "堂员已经被踢除";
            }//if

            $this->ajaxReturn($retVal);
        }//if
    }

} 