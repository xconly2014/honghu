<?php
namespace Home\Controller;


use Home\Model\CZ\AndroidOperatorModel;
use Home\Model\GameMgrModel;
use Home\Model\PackageAccountMgrModel;
use Home\Model\PackageMgrModel;
use Home\Model\PackageOrderModel;
use Home\Model\SecurityMgrModel;
use Think\Controller;
use Utils\ConstantUtils;
use Home\Model\UserMgrModel;

class PackageController extends DetectorController{

    public function index(){
        $package = new PackageMgrModel();
        $packageRes = $package->getList();
        $this->assign('package',array_slice($packageRes,0,8));
        
        $this->theme($this->theme)->display();
    }

    public function buy($id){
        if(IS_POST){
            $this->redirect('Home/Package/game_account', array('id'=>$id));
        }
        $package = new PackageMgrModel();
        $packageRes = $package->getPackageInfo($id);
        
        $flag = 0;
        if($packageRes['state'] > 2 && $packageRes['active'] == 0){
            $flag = 1;
        }
        $this->assign('flag',$flag);
        $this->assign('package_info',$packageRes);
        $this->assign('submit_url', U('Home/Package/buy', array('id'=>$id)));
        $this->theme($this->theme)->display('info');
    }

    public function game_account($id){
        $packageOrder = new PackageOrderModel();

        if(IS_POST){
            $packageAccount = new PackageAccountMgrModel();
            $game_account_id = $packageAccount->insertAccount();

            $packageMgr = new PackageMgrModel();
            $packageInfo = $packageMgr->getPackageInfo($id);

            //生成买家订单，获取买家订单id
            $packageOrderId = $packageOrder->insertOrder(ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER, $id, $packageInfo['price'], $game_account_id);

            $this->redirect("PackageOrder/pay_price?orderId=$packageOrderId");
        }else{
            $operator = new AndroidOperatorModel();
            $operatorRes = $operator->getOperatorAll();

            $url = U('Home/Package/game_account', array('id'=>$id));
            $this->assign('url',$url);
            $this->assign('operatorRes',$operatorRes);
            $this->theme($this->theme)->display();
        }
    }

    public function publish($gameId){
        if(IS_POST){
            $package = new PackageMgrModel();
            $package_id = $package->insertPackage($gameId);

            $securityPrice = I('post.security_price');
            $packageOrder = new PackageOrderModel();
            $orderId = $packageOrder->insertOrder(ConstantUtils::$ORDER_TYPE_DEPOSIT_TRAINER, $package_id, $securityPrice, ConstantUtils::$ID_NONE);

            $this->redirect("PackageOrder/pay_security", array('orderId'=>$orderId));
        }
        else{
            $userMgr = new UserMgrModel();
            if(!$userMgr->userIsTrainer(get_uid())){
                $this->redirect('Home/User/authentication');
            }
            
            $operator = new AndroidOperatorModel();
            $operatorRes = $operator->getOperatorAll();
            $this->assign('operatorRes',$operatorRes);
            
            $game = new GameMgrModel();
            $gameRes = $game->getInfo($gameId);
            $this->assign('game_pic',$gameRes['pic']);
            $this->assign('game_id', $gameId);
            $this->theme($this->theme)->display();
        }
    }

    public function publish_finish($orderId){
        $packageOrder = new PackageOrderModel();
        $packageOrderInfo = $packageOrder->getInfo($orderId);

        $this->assign('package_order_info',$packageOrderInfo);
        $this->theme($this->theme)->display();
    }

    public function get_finish($orderId){
        $packageOrder = new PackageOrderModel();
        $packageOrderInfo = $packageOrder->getInfo($orderId);

        $this->assign('package_order_info',$packageOrderInfo);
        $this->theme($this->theme)->display();
    }
} 