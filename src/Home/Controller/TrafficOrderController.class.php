<?php
namespace Home\Controller;

use Home\Model\TrafficMgrModel;
use Home\Model\TrafficOrderMgrModel;
use Home\Model\UserMgrModel;
use Utils\ConstantUtils;

class TrafficOrderController extends OrderBaseController{
    private $type = "traffic_order";

    public function mb_flow_index(){
        if(IS_POST){
            $payway = I('post.pay_way');

            $trafficOrder = new TrafficOrderMgrModel();
            $orderId = $trafficOrder->insertOrder();
            $callbackUrl = 'TrafficOrder/buy_finish';

            $info = $this->prePay($payway, $callbackUrl, $orderId);
            return $this->pay($payway, $this->type, $info['id_no'], $info['payment']);
        }

        $traffic = new TrafficMgrModel();
        $trafficList = $traffic ->getList(1);
        
        //获取用户当前虎币数量
        $userMgr = new UserMgrModel();
        $userCoins = $userMgr->getUserCoin(get_uid());
        $this->assign('userCoins',$userCoins);
        
        $this->assign('traffic_list',$trafficList);
        $this->theme($this->theme)->display();
    }

    public function buy_finish(){
        //TODO:
    }

    public function paid_finish($orderId){
        //TODO:
    }

    public function customer_paid_finish($orderId){

    }

    public function get_traffic_option(){
        if(IS_AJAX){
            $mobile = I('post.mobile');
            $mobileInfo = getMobileInfo($mobile);

            $type_flag = false;
            if($mobileInfo['yys_type'] == ConstantUtils::$YYS_YD){
                $type_flag = true;
            }
            $traffic = new TrafficMgrModel();
            $trafficList = $traffic ->getList($mobileInfo['yys_type']);
            $infoDetails = $traffic->getMobileInfo($mobileInfo);
            $this->ajaxReturn(array('status'=>true,
                                    'mobile_info'=>$infoDetails['p_name'].$infoDetails['yys_name'],
                                    'data'=>$trafficList,
                                    'type_flag' => $type_flag
                            ));
        }
    }

    public function order_hb_pay($idNo, $payment){
        parent::order_hb_pay($idNo, $payment, ConstantUtils::$HB_RECORD_TYPE_TRAFFIC);
    }
}
