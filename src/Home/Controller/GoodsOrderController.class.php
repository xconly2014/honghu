<?php
namespace Home\Controller;
use Home\Model\GoodsOrderMgrModel;
use Home\Model\CreditRecordsMgrModel;
use Home\Model\UserMgrModel;
use Home\Model\SignRecordsMgrModel;
use Utils\ConstantUtils;

class GoodsOrderController extends  DetectorController{
	
    public function information($oid){
    	if(IS_GET){
    	    $userMgr = new UserMgrModel();
    	    $userInfo = $userMgr->getUserInfo(get_uid());
    	    $this->assign('userInfo',$userInfo);
    	    $signMgr = new SignRecordsMgrModel();
    	    $isSign = $signMgr->hasSign(get_uid());
    	    $this->assign('is_sign', $isSign);
    	    
    		$orderObj = new GoodsOrderMgrModel();
    		$data = $orderObj->getRow($oid);
    		
    		
    		$this->assign('data',$data);
    		$this->assign('orderId',$oid);
    		$this->assign('url',U('Home/GoodsOrder/information',array('oid'=>$oid)));
			$seoInfo = array(
				ConstantUtils::$SEO_TITLE_KEY=>$data['name']."_".ConstantUtils::$SITE_KEYWORD,
				ConstantUtils::$SEO_KEYWORD_KEY=>$data['name']."_".ConstantUtils::$SITE_KEYWORD
			);
    		$this->theme($this->theme)->display('', $seoInfo);
    	}
    	if(IS_POST){
    		$orderObj = new GoodsOrderMgrModel();
    		$orderInfo = $orderObj->getOrder($oid);
    		
    		$state = ConstantUtils::$GOODS_ORDER_STATE_IS_PAID;
    		if($orderInfo['state'] == $state){
    		    return $this->redirect('Home/GoodsOrder/finish', array('oid'=>$oid));
    		}
    		
    		$creditObj = new CreditRecordsMgrModel();
    		$cid = $creditObj->generateGoodsExchangeRecord(get_uid(),$oid,$orderInfo['credits']);
    		
    		if($cid > 0){
    			$orderObj = new GoodsOrderMgrModel();
    			$result = $orderObj->updateInfo($oid,$cid);
    			if(is_int($result)){
    			    $userMgr = new UserMgrModel();
    			    $userMgr->minusCredits(get_uid(), $orderInfo['credits']);
    				$this->redirect('Home/GoodsOrder/finish', array('oid'=>$oid));
    			}
    		}
    	}
    } 
    
    public function finish($oid){
        $userMgr = new UserMgrModel();
        $userInfo = $userMgr->getUserInfo(get_uid());
        $this->assign('userInfo',$userInfo);
        $signMgr = new SignRecordsMgrModel();
        $isSign = $signMgr->hasSign(get_uid());
        $this->assign('is_sign', $isSign);
        
        $orderObj = new GoodsOrderMgrModel();
        $data = $orderObj->getRow($oid);
        
        $this->assign('data',$data);
        $this->assign('orderId',$oid);
        
        //TODO:群哥 林总说 这里也要发邮件通知客服 你有空就接一下代码
    	$this->theme($this->theme)->display();
    }
} 