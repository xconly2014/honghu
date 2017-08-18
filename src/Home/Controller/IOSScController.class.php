<?php
namespace Home\Controller;

use Home\Model\SC\IOSScOrderMgrModel;
use Home\Model\SC\IOSScMgrModel;
use Home\Model\GameMgrModel;
use Utils\ConstantUtils;

class IOSScController extends DetectorController{

    public function buy($id){
        if(IS_POST){
            return $this->redirect('addGameAccount', array('sc_id'=> $id));
        }

        $scIos = new IOSScMgrModel();
        $scIosRes = $scIos->getInfo($id);

        $this->assign('scObj', $scIosRes);
        $this->assign('submit_url', U('Home/IOSSc/buy?id='.$id));

        $this->theme($this->theme)->display();
    }

    public function addGameAccount($sc_id){
        if(IS_POST){
            $scOrder = new IOSScOrderMgrModel();
            $scOrderId = $scOrder->scOrderInsert($sc_id);

            if($scOrderId){
                $this->redirect("IOSScOrder/scOrder" ,array('id'=>$scOrderId));
            }
        }
        else{
            $scIos = new IOSScMgrModel();
            $scIosRes = $scIos->getIosOne($sc_id);
            $realPayment = floor($scIosRes['price']*$scIosRes['discount']);
            $game = new GameMgrModel();
            $gameRes = $game->getInfo($scIosRes['game_id']);
            
            $this->assign('platform',ConstantUtils::$PLATFORM_IOS_STRING);
            $this->assign('realPayment',$realPayment);
            $this->assign('gameName',$gameRes['name']);
            $this->assign('game_pic',$gameRes['pic']);
            $this->assign('scRes',$scIosRes);
            $this->assign('submit_url', U('addGameAccount?sc_id='.$sc_id));

            $seoInfo = array(
                ConstantUtils::$SEO_TITLE_KEY=>$scIosRes['details']."_".ConstantUtils::$SITE_KEYWORD,
                ConstantUtils::$SEO_KEYWORD_KEY=>""
            );
            $this->theme($this->theme)->display('IOSSc/addGameAccount', $seoInfo);
        }
    }

    public function get_finish($orderId){
        $scIosOrder = new IOSScOrderMgrModel();
        $scIosOrderInfo = $scIosOrder->getInfo($orderId);
        $this->assign('sc_order_info',$scIosOrderInfo);
        $this->theme($this->theme)->display();
    }

} 