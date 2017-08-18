<?php

namespace Home\Controller;

use Home\Model\GameMgrModel;
use Home\Model\SC\IOSScMgrModel;
use Home\Model\SC\AndroidScMgrModel;
use Home\Model\GiftCodeMgrModel;
use Utils\ConstantUtils;

class SCHController extends DetectorController{
    
    public function index(){
        
        $iosScMgr = new IOSScMgrModel();
        $iosScList = $iosScMgr->getSCIosGameList();
        
        //$androidscMgr = new AndroidScMgrModel();
        //$androidScList = $androidscMgr->getSCIosGameList();

        $isLogin = get_uid()? true:false;
        $this->assign('is_login', $isLogin);
        $this->assign('iosScGameList',$iosScList);
        //$this->assign('androidScGameList',$androidScList);
        $this->theme($this->theme)->display();
    }
    
    public function account_ios($gameId){
        if(IS_GET){
            $gameMgr = new GameMgrModel();
            $gameInfo = $gameMgr->getInfo($gameId);
            $downloadUrl = $gameInfo['ios_url'];
            
            $iosScMgr = new IOSScMgrModel();
            $scList = $iosScMgr->getList($gameId);
            
            $this->assign('download_url',$downloadUrl);
            $this->assign('type','ios首充号');
            $this->assign('gameInfo',$gameInfo);
            $this->assign('sclist',$scList);

            $seoInfo = array(
                ConstantUtils::$SEO_TITLE_KEY=>$gameInfo['name']."首充号购买_".$gameInfo['name']."首充号交易平台_"."轰轰虎",
                ConstantUtils::$SEO_KEYWORD_KEY=>"",
            );
            $this->theme($this->theme)->display('account', $seoInfo);
        }
        
    }
    
    public function account_android($gameId){
        if(IS_GET){
            $gameMgr = new GameMgrModel();
            $gameInfo = $gameMgr->getInfo($gameId);
            $downloadUrl = $gameInfo['android_url'];
    
            $androidScMgr = new AndroidScMgrModel();
            $scList = $androidScMgr->getList($gameId);
            
            $this->assign('download_url',$downloadUrl);
            $this->assign('type','安卓首充号');
            $this->assign('gameInfo',$gameInfo);
            $this->assign('sclist',$scList);
            $seoInfo = array(
                ConstantUtils::$SEO_TITLE_KEY=>$gameInfo['name']."首充号购买_".$gameInfo['name']."首充号交易平台_"."轰轰虎",
                ConstantUtils::$SEO_KEYWORD_KEY=>"",
            );
            $this->theme($this->theme)->display('account', $seoInfo);
        }
    
    }

    public function introduce_sch(){
        $this->theme($this->theme)->display();
    }

    public function ajax_get_gift(){
        if(IS_AJAX){

            $uid = get_uid();

            $result = array('state'=>false,'data'=>'请您先登录');
            if($uid){
                $game_id = I('post.game');
                $giftMgr = new GiftCodeMgrModel();
                $result = $giftMgr->getCode($game_id,$uid);
            }
            $this->ajaxReturn($result);

        }
    }

   
} 