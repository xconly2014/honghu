<?php


namespace Home\Controller;


use Think\Controller;
use Home\Model\UserMgrModel;

class AuthController extends Controller{

    public function _initialize() {
        if(actionSpecial(ACTION_NAME)){
            return;
        }

        //记住密码，自动登录
        $userMgr = new UserMgrModel();
        
        if(!empty($_COOKIE['username']) && !empty($_COOKIE['userpwd'])){
            $userName = cookie('username');
            $userPwd = cookie('userpwd');
            $uId = $userMgr->login($userName, $userPwd);
            if($uId){
                $userMgr->updateLogin($uId);
                return;
            }
        }
        
        $controllerName = CONTROLLER_NAME;
        $actionName = ACTION_NAME;

        if(actionNeedAuth($controllerName, $actionName)){
           
            $uId = is_login();

            if(!$uId){
                /*if(I('get')){
                    $getParams = I('get');
                    foreach($getParams as $getKey => $getValue){

                    }//foreach
                }*/
                $_SESSION['next_url'] = /*U(CONTROLLER_NAME.'/'.ACTION_NAME,I('get'));*/$_SERVER['REQUEST_URI'];
                return $this->redirect('Home/Login/index');
            }
        }

        $modelInfo = actionNeedCheck($controllerName, $actionName);

        if($modelInfo){
            $model = $modelInfo['model'];
            $field = $modelInfo['field'];
            $param = $modelInfo['param'];
            $expect = $modelInfo['expect'];

            if(checkAction($model, $field, $param, $expect)){
                return $this->error($modelInfo['msg'], U('Index/index'));
            }
        }
    }

} 