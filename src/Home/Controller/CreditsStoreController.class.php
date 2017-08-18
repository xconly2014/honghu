<?php


namespace Home\Controller;

use Home\Model\GoodsMgrModel;
use Home\Model\GoodsOrderMgrModel;
use Home\Model\UserMgrModel;
use Home\Model\SignRecordsMgrModel;
use Utils\ConstantUtils;
use Think\Controller;

class CreditsStoreController extends DetectorController{

    public function index(){
    	$uid = get_uid();
    	if($uid){
    		$userMgr = new UserMgrModel();
    		$userInfo = $userMgr->getUserInfo($uid);
    		$this->assign('userInfo',$userInfo);
    		
    		$signMgr = new SignRecordsMgrModel();
    		$isSign = $signMgr->hasSign($uid);
    		$this->assign('is_sign', $isSign);
    	}
    	
    	$goodsObj = new GoodsMgrModel();
    	$list = $goodsObj->getGoodsList(12,true);
    	
    	
    	$this->assign('activity_time',isActivityTime());
    	$this->assign('goodsList',$list['data']);
    	$this->assign('page',$list['page']);
        $this->theme($this->theme)->display();
    }
    
    public function goods_info($id){
        $userMgr = new UserMgrModel();
    	if(IS_POST){
			if(!get_uid()){
				return $this->error('请先登录系统',U('Home/CreditsStore/index'));
			}
    	    $userCredit = intval($userMgr->getUserCredit(get_uid()));
            $goodsObj = new GoodsMgrModel();
            $data = $goodsObj->getRow($id);

    	    if($userCredit==intval($data['credits'])||$userCredit>intval($data['credits'])){
				$orderObj = new GoodsOrderMgrModel();
				$oid = $orderObj->AddData($id);
				if($oid > 0){
					$this->redirect('Home/GoodsOrder/information',array('oid'=>$oid));
				}
    	    }
			else {
				return $this->error('您的积分不够兑换',U('Home/CreditsStore/index'));
			}
    	}
    	if(IS_GET){
    	    $userInfo = $userMgr->getUserInfo(get_uid());
			$signMgr = new SignRecordsMgrModel();
			$isSign = $signMgr->hasSign(get_uid());
			$this->assign('is_sign', $isSign);

			$goodsObj = new GoodsMgrModel();
    		$data = $goodsObj->getRow($id);
    		
    		$this->assign('url',U('Home/CreditsStore/goods_info',array('id'=>$id)));
    		$this->assign('data',$data);
    		
    		$this->assign('activity_time',isActivityTime());
    		$this->assign('userInfo',$userInfo);
			$seoInfo = array(
				ConstantUtils::$SEO_TITLE_KEY=>$data['name']."_".ConstantUtils::$SITE_KEYWORD,
				ConstantUtils::$SEO_KEYWORD_KEY=>$data['name']."_".ConstantUtils::$SITE_KEYWORD
			);
    		$this->theme($this->theme)->display('', $seoInfo);
    	}
    }



} 