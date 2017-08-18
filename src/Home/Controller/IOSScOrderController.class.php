<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-5-6
 * Time: 下午6:04
 */

namespace Home\Controller;


use Home\Model\GameMgrModel;
use Home\Model\SC\IOSScGameAccountMgrModel;
use Home\Model\SC\IOSScMgrModel;
use Home\Model\SC\IOSScOrderMgrModel;
use Utils\ConstantUtils;

class IOSScOrderController extends OrderBaseController {
    private $type = "ios_sc_order";

    public function scOrder($id){
        if(IS_GET){
            $scOrder = new IOSScOrderMgrModel();
            $scOrderRes = $scOrder->getScOrder($_GET['id']);

            $game_id = $scOrderRes['game_id'];

            $game = new GameMgrModel();
            $gameName = $game->getGameName($game_id);

            $scIos = new IOSScMgrModel();
            $scIosRes = $scIos->getIosOne($scOrderRes['sc_account_id']);

            $scGameAccount = new IOSScGameAccountMgrModel();
            $accountInfo = $scGameAccount->getGameAccount($scOrderRes['game_account_id']);

            $this->assign('accountInfo',$accountInfo);
            $this->assign("url",U('Home/IOSScOrder/scOrder',array('id'=>$id)));
            $this->assign('gameName',$gameName);
            $this->assign('platform',ConstantUtils::$PLATFORM_IOS_STRING);
            $this->assign('details',$scIosRes['details']);
            $this->assign('scOrderRes',$scOrderRes);
            $this->theme($this->theme)->display('IOSScOrder/scOrder');
        }
        if(IS_POST){
            return $this->redirect('IOSScOrder/order_pay', array('orderId' => $id));
        }
    }


    public function order_pay($orderId){
        if(IS_POST){
            $payway = I('post.pay_way');
            $callbackUrl = "IOSSc/get_finish";

            $info = $this->prePay($payway, $callbackUrl, $orderId);
            return $this->pay($payway, $this->type, $info['id_no'], $info['payment']);
        }
        if(IS_GET){
            $scOrder = new IOSScOrderMgrModel();
            $payment = $scOrder->getPayment($orderId);

            $this->assign('pay_title', "首充号");
            $this->assign('pay_price', $payment);
            $this->assign('result_url', U('Home/IOSScOrder/customer_paid_finish', array('orderId'=>$orderId)));
            $this->assign('result_finish_url', U('Home/IOSScOrder/paid_finish', array('orderId'=>$orderId)));
            $this->assign('submit_url', U('Home/IOSScOrder/order_pay', array('orderId'=>$orderId)));
            $this->theme($this->theme)->display();
        }
    }

    public function paid_finish($orderId){
        $orderMgr = new IOSScOrderMgrModel();
        $status = $orderMgr->orderIsPaid($orderId);
        if(!$status){
            return $this->redirect('Home/IOSScOrder/order_pay', array('orderId'=>$orderId));
        }
        return $this->redirect('Home/IOSSc/get_finish', array('orderId'=>$orderId));
    }

    public function customer_paid_finish($orderId){
        $orderMgr = new IOSScOrderMgrModel();
        $status = $orderMgr->orderIsPaid($orderId);
        $this->ajaxReturn(array('status'=>$status));
    }

    public function order_hb_pay($idNo, $payment){
        parent::order_hb_pay($idNo, $payment, ConstantUtils::$HB_RECORD_TYPE_IOS_SC);
    }
} 