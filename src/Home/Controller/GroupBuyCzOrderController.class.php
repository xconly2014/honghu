<?php
namespace Home\Controller;

use Home\Model\GroupBuyCzOrderMgrModel;
use Utils\ConstantUtils;

class GroupBuyCzOrderController extends OrderBaseController{
    private $type = "group_buy_cz_order";

    public function addOrder($id){
        $gbczOrderMgr = new GroupBuyCzOrderMgrModel();
        $insert_id = $gbczOrderMgr->gb_insert($id);
        if($insert_id){
            return $this->redirect('Home/GroupBuyCzOrder/verify', array('orderId'=> $insert_id));
        }
    }

    public function verify($orderId){
        $gbczOrderMgr = new GroupBuyCzOrderMgrModel();



        if(IS_POST){
            $res = $gbczOrderMgr->updateTel($orderId,I('post.contact_way'));
            if($res){
                $this->redirect('order_pay',array('orderId' => $orderId));
            }

        }
        if(IS_GET){
            $rowOrder = $gbczOrderMgr->getRowOrder($orderId);
            
            $this->assign('submit_url',U('Home/GroupBuyCzOrder/verify',array('orderId' => $orderId)));
            $this->assign('rowOrder',$rowOrder);
            $seoInfo = array(
                ConstantUtils::$SEO_TITLE_KEY=>$rowOrder['option_text']."_".ConstantUtils::$SITE_KEYWORD,
                ConstantUtils::$SEO_KEYWORD_KEY=>$rowOrder['option_text']."_".ConstantUtils::$SITE_KEYWORD
            );
            $this->theme($this->theme)->display('', $seoInfo);
        }
    }
    
    public function order_pay($orderId){
       if(IS_POST){
            $payway = I('post.pay_way');
            $callbackUrl = "GroupBuyCz/buy_finish";
    
            $info = $this->prePay($payway, $callbackUrl, $orderId);
            return $this->pay($payway, $this->type, $info['id_no'], $info['payment']);
        }
        if(IS_GET){
            $gbczOrderMgr = new GroupBuyCzOrderMgrModel();
            $orderFields = $gbczOrderMgr->getFields($orderId);
    
            $this->assign('pay_title', "一元云购");
            $this->assign('pay_price', $orderFields['real_payment']);
            $this->assign('result_url', U('Home/GroupBuyCzOrder/customer_paid_finish', array('orderId'=>$orderId)));
            $this->assign('result_finish_url', U('Home/GroupBuyCzOrder/paid_finish', array('orderId'=>$orderId)));
            $this->assign('submit_url', U('Home/GroupBuyCzOrder/order_pay', array('orderId'=>$orderId)));
            $seoInfo = array(
                ConstantUtils::$SEO_TITLE_KEY=>ConstantUtils::$PAY_CASH_DESK,
                ConstantUtils::$SEO_KEYWORD_KEY=>ConstantUtils::$PAY_CASH_DESK
            );
            $this->theme($this->theme)->display('', $seoInfo);
       }
    }
    
    public function paid_finish($orderId){
        $gbczOrderMgr = new GroupBuyCzOrderMgrModel();
        $status = $gbczOrderMgr->orderIsPaid($orderId);
        if(!$status){
            return $this->redirect('Home/GroupBuyCzOrder/order_pay', array('orderId'=>$orderId));
        }
        return $this->redirect('Home/GroupBuyCz/buy_finish', array('orderId'=>$orderId));
    }

    public function customer_paid_finish($orderId){
        $gbczOrderMgr = new GroupBuyCzOrderMgrModel();
        $status = $gbczOrderMgr->orderIsPaid($orderId);
        $this->ajaxReturn(array('status'=>$status));
    }

    public function order_hb_pay($idNo, $payment){
        parent::order_hb_pay($idNo, $payment, ConstantUtils::$HB_RECORD_TYPE_GROUP_BUY);
    }

} 