<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-5-16
 * Time: 下午3:55
 */

namespace Home\Controller;


use Home\Model\RequirementMgrModel;
use Home\Model\RequirementOrderMgrModel;
use Think\Controller;
use Utils\ConstantUtils;

class RequirementOrderController extends OrderBaseController{
    private $type = "requirement_order";

    /**
     * 玩家付价格金
     */
    public function pay_price($orderId){
        if(IS_POST){
            $payway = I('post.pay_way');
            $callbackUrl = "Requirement/publish_finish";

            $info = $this->prePay($payway, $callbackUrl, $orderId);
            return $this->pay($payway, $this->type, $info['id_no'], $info['payment']);
        }
        if(IS_GET){
            $orderObj = new RequirementOrderMgrModel();
            $r_id = $orderObj->getRequirement($orderId);
            $requirementObj = new RequirementMgrModel();
            $price = $requirementObj->getPrice($r_id);

            $this->assign('pay_title',"需求价格");
            $this->assign('pay_price',$price);
            $this->assign('result_url', U('Home/RequirementOrder/customer_paid_finish', array('orderId'=>$orderId)));
            $this->assign('result_finish_url', U('Home/RequirementOrder/paid_finish', array('orderId'=>$orderId)));
            $this->assign('submit_url', U('Home/RequirementOrder/pay_price', array('orderId'=>$orderId)));
            
            $this->theme($this->theme)->display('requirement_publish_pay');
        }
    }

    /**
     * 玩家付保证金
     */
    public function pay_security($orderId){
        if(IS_POST){
            $payway = I('post.pay_way');
            $callbackUrl = "Requirement/get_finish";

            $info = $this->prePay($payway, $callbackUrl, $orderId);
            return $this->pay($payway, $this->type, $info['id_no'], $info['payment']);
        }

        $orderObj = new RequirementOrderMgrModel();
        $r_id = $orderObj->getRequirement($orderId);
        $requirementObj = new RequirementMgrModel();
        $price = $requirementObj->getSecurityPrice($r_id);

        $this->assign('pay_title', "需求保证金");
        $this->assign('pay_price', $price);
        $this->assign('result_url', U('Home/RequirementOrder/customer_paid_finish', array('orderId'=>$orderId)));
        $this->assign('result_finish_url', U('Home/RequirementOrder/paid_finish', array('orderId'=>$orderId)));
        $this->assign('submit_url', U('Home/RequirementOrder/pay_security', array('orderId'=>$orderId)));
        //$this->display('requirement_buy_pay');
        $this->theme($this->theme)->display('requirement_buy_pay');
    }

    public function paid_finish($orderId){
        $orderMgr = new RequirementOrderMgrModel();
        $status = $orderMgr->orderIsPaid($orderId);
        if(!$status){
            return $this->redirect('Home/RequirementOrder/order_pay', array('orderId'=>$orderId));
        }

        $type = $orderMgr->getOrderType($orderId);
        if($type == ConstantUtils::$ORDER_TYPE_DEPOSIT_TRAINER){
            return $this->redirect('Home/Requirement/get_finish', array('orderId'=>$orderId));
        }

        else if($type == ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER){
            return $this->redirect('Home/Requirement/publish_finish', array('orderId'=>$orderId));
        }
    }

    public function customer_paid_finish($orderId){
        $orderMgr = new RequirementOrderMgrModel();
        $status = $orderMgr->orderIsPaid($orderId);
        $this->ajaxReturn(array('status'=>$status));
    }

    public function order_hb_pay($idNo, $payment){
        parent::order_hb_pay($idNo, $payment, ConstantUtils::$HB_RECORD_TYPE_REQUIREMENT);
    }
} 