<?php
namespace Admin\Controller;

use Admin\Model\IdentifyMgrModel;
use Admin\Model\UserMgrModel;
use Utils\ConstantUtils;
class IdentifyController extends AuthController{
    private static $identify_function = 'identify_list';
    public function identify_list(){
        $name = '';
        if(IS_POST){
            $name = I('post.name');
        }
        
        $identify = new IdentifyMgrModel();
        $identifyList = $identify->getList($name);
        $this->assign('identify_list',$identifyList['data']);
        $this->assign('show',$identifyList['show']);
        
        $this->assign('state_ok',ConstantUtils::$AUTH_STATE_OK);
        $this->assign('state_no',ConstantUtils::$AUTH_STATE_NO);
        
        $this->assign('title','身份认证信息列表');
        $this->assign('cur_page',CONTROLLER_NAME.'/'.self::$identify_function);
        $this->display();
    }
    
    public function identify_edit($id){
        $identify = new IdentifyMgrModel();
        if(IS_POST){
            $identifyRes = $identify->updateIdentify($id);
            
            $identifyInfo = $identify->getIdentifyInfo($id);
            $uid = $identifyInfo['uid'];//获取用户id
            $state = $identifyInfo['state'];
            
            $user = new UserMgrModel();
            if($identifyRes && $state == ConstantUtils::$AUTH_STATE_OK){     
                $user->updateTrainer($uid,$id);
                return $this->success('完成审核操作（通过）',U('Admin/Identify/identify_list'));
            }else{
               $user->updateTrainer($uid,'');
               return $this->success('完成审核操作（未通过）',U('Admin/Identify/identify_list'));
            }
        }
        
        $identifyInfo = $identify->getIdentifyInfo($id);
        $this->assign('state_ok',ConstantUtils::$AUTH_STATE_OK);
        $this->assign('state_no',ConstantUtils::$AUTH_STATE_NO);
        $this->assign('title','身份认证信息审核');
        $this->assign('cur_page',CONTROLLER_NAME.'/'.self::$identify_function);
        $this->assign('identify_info',$identifyInfo);
        $this->display();
    }
}