<?php
namespace Home\Controller;

use Home\Model\GameMgrModel;
use Home\Model\SC\AndroidScGameAccountMgrModel;
use Home\Model\SC\AndroidScMgrModel;
use Home\Model\SC\AndroidScOrderMgrModel;
use Utils\ConstantUtils;

class AndroidScOrderController extends OrderBaseController {
    private $type = "sc_order_android";

    public function scOrder($id){
        if(IS_GET){
            $scOrder = new AndroidScOrderMgrModel();
            $scOrderRes = $scOrder->getScOrder($_GET['id']);

            $game_id = $scOrderRes['game_id'];

            $game = new GameMgrModel();
            $gameName = $game->getGameName($game_id);

            $scAndroid = new AndroidScMgrModel();
            $scAndroidRes = $scAndroid->getAndroidOne($scOrderRes['sc_account_id']);

            $scGameAccount = new AndroidScGameAccountMgrModel();
            $accountInfo = $scGameAccount->getGameAccount($scOrderRes['game_account_id']);

            $this->assign('accountInfo',$accountInfo);
            $this->assign("url",U('Home/AndroidScOrder/scOrder',array('id'=>$id)));
            $this->assign('gameName',$gameName);
            $this->assign('operator',$scAndroidRes['operator']);
            $this->assign('platform',ConstantUtils::$PLATFORM_ANDROID_STRING);
            $this->assign('details',$scAndroidRes['details']);
            $this->assign('scOrderRes',$scOrderRes);
            $this->theme($this->theme)->display('IOSScOrder/scOrder');
        }
        if(IS_POST){
            return $this->redirect('AndroidScOrder/order_pay', array(orderId => $id));
        }
    }

    public function order_pay($orderId){
        if(IS_POST){
            $payway = I('post.pay_way');
            $callbackUrl = "AndroidSc/get_finish";

            $info = $this->prePay($payway, $callbackUrl, $orderId);
            return $this->pay($payway, $this->type, $info['id_no'], $info['payment']);
        }
        if(IS_GET){
            $scOrder = new AndroidScOrderMgrModel();
            $payment = $scOrder->getPayment($orderId);

            $this->assign('pay_title', "首充号");
            $this->assign('pay_price', $payment);
            $this->assign('result_url', U('Home/AndroidScOrder/customer_paid_finish', array('orderId'=>$orderId)));
            $this->assign('result_finish_url', U('Home/AndroidScOrder/paid_finish', array('orderId'=>$orderId)));
            $this->assign('submit_url', U('Home/AndroidScOrder/order_pay', array('orderId'=>$orderId)));
            $this->theme($this->theme)->display('IOSScOrder/order_pay');
        }
    }

    public function paid_finish($orderId){
        $orderMgr = new AndroidScOrderMgrModel();
        $status = $orderMgr->orderIsPaid($orderId);
        if(!$status){
            return $this->redirect('Home/AndroidScOrder/order_pay', array('orderId'=>$orderId));
        }
        return $this->redirect('Home/AndroidSc/get_finish', array('orderId'=>$orderId));
    }

    public function customer_paid_finish($orderId){
        $orderMgr = new AndroidScOrderMgrModel();
        $status = $orderMgr->orderIsPaid($orderId);
        $this->ajaxReturn(array('status'=>$status));
    }

    public function order_hb_pay($idNo, $payment){
        parent::order_hb_pay($idNo, $payment, ConstantUtils::$HB_RECORD_TYPE_ANDROID_SC);
    }
} 