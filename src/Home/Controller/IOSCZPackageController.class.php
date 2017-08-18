<?php


namespace Home\Controller;


use Home\Model\IOSCZPackageModel;
use Home\Model\IOSCZPackageOrderModel;
use Home\Model\IOSCZPackageGameAccountModel;
use Think\Controller;
use Utils\ConstantUtils;

class IOSCZPackageController extends DetectorController {
    
    public function index(){
        $packageObj = new IOSCZPackageModel();
        $packageRes = $packageObj->getListPager();
        $this->assign('cz_package', $packageRes['data']);
        $this->assign('show',$packageRes['show']);
        
        $this->theme($this->theme)->display();
    }
    
    public function buy($id){

        $packageObj = new IOSCZPackageModel();
        $data = $packageObj->getRow($id);

        if(IS_POST){
            if($packageObj->isNumAllow($data['result'], intval(I('post.number')))){
                $orderObj = new IOSCZPackageOrderModel();
                $oid= $orderObj->addOrder($id);
                $this->redirect('Home/IOSCZPackage/game_account',array('oid'=>$oid));
            }
            return $this->error('您的操作有误',U('Home/GroupBuy/cz_package_all'));

        }

        $this->assign('progress',$data['percentage']);
        $this->assign('submit_url',U('Home/IOSCZPackage/buy',array('id'=>$id)));
        $this->assign('data',$data);

        $seoInfo = array(
            ConstantUtils::$SEO_TITLE_KEY=>$data['game']."充值团购平台_".$data['game']."团购网站购买",
            ConstantUtils::$SEO_KEYWORD_KEY=>"",
        );
        $this->theme($this->theme)->display('', $seoInfo);
    }

    public function game_account($oid){
        if(IS_POST){
            $accountObj = new IOSCZPackageGameAccountModel();
            $aid = $accountObj->addData();
            if($aid > 0){
                $oderObj = new IOSCZPackageOrderModel();
                $result = $oderObj->insertGameAccount($oid,$aid);
                if($result > 0){
                    $this->redirect('Home/IOSCZPackageOrder/order_pay',array('orderId'=>$oid));
                }
            }
        }

        $orderObj = new IOSCZPackageOrderModel();
        $orderInfo = $orderObj->getOrderById($oid);
        
        $this->assign('order_info', $orderInfo);
        $this->assign('is_tx',$orderInfo['is_tx']);
        $this->assign('url',U('Home/IOSCZPackage/game_account',array('oid'=>$oid)));
        $this->theme($this->theme)->display();
    }

    public function cz_package_doing($orderId){
        $orderMgr = new IOSCZPackageOrderModel();
        $data = $orderMgr->getOrderById($orderId);
        $this->assign('order_data', $data);
        $this->theme($this->theme)->display();
    }

} 