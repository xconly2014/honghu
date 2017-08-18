<?php
namespace Home\Controller;
use Home\Model\SC\AndroidScOrderMgrModel;
use Home\Model\SC\AndroidScMgrModel;
use Home\Model\GameMgrModel;
use Utils\ConstantUtils;
use Admin\Controller\AndroidScOrderController;

class AndroidScController extends DetectorController{
    
    public function buy($id){
        if(IS_POST){
            return $this->redirect('addGameAccount', array('sc_id'=> $id));
        }
        $scAndroid = new AndroidScMgrModel();
        $scAndroidRes = $scAndroid->getInfo($id);
    
        $this->assign('scObj', $scAndroidRes);
        
        $this->assign('submit_url', U('Home/AndroidSc/buy', array('id'=>$id)));
   
        $this->theme($this->theme)->display('IOSSc/buy');
    }
    
    
    
    
    public function addGameAccount($sc_id){
        if(IS_POST){
            $scOrder = new AndroidScOrderMgrModel();
            $scOrderId = $scOrder->scOrderInsert($sc_id);
    
            if($scOrderId){
                $this->redirect("AndroidScOrder/scOrder?id=$scOrderId");
            }
        }
        else{
            $scAndroid = new AndroidScMgrModel();
            $scAndroidRes = $scAndroid->getAndroidOne($sc_id);
            
            $realPayment = floor($scAndroidRes['price']*$scAndroidRes['discount']);
            $game = new GameMgrModel();
            $gameRes = $game->getInfo($scAndroidRes['game_id']);
            
            $this->assign('platform',ConstantUtils::$PLATFORM_ANDROID_STRING);
            $this->assign('realPayment',$realPayment);
            $this->assign('gameName',$gameRes['name']);
            $this->assign('game_pic',$gameRes['pic']);
            $this->assign('scRes',$scAndroidRes);
            $this->assign('submit_url', U('addGameAccount?sc_id='.$sc_id));
            $this->theme($this->theme)->display('IOSSc/addGameAccount');
        }
    }
    
    public function get_finish($orderId){
        $scOrder = new AndroidScOrderMgrModel();
        $scOrderInfo = $scOrder->getInfo($orderId);
        $this->assign('sc_order_info',$scOrderInfo);
        $this->theme($this->theme)->display('IOSSc/get_finish');

    }

} 