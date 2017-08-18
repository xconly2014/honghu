<?php
namespace Home\Controller;


use Home\Model\CZ\CZOptionIOSMgrModel;
use Home\Model\CZ\CZOrderIOSModel;
use Home\Model\GameMgrModel;
use Home\Model\IOSCZPackageModel;
use Utils\ConstantUtils;
use Home\Model\CZ\CZGameAccountIOSModel;

class CZIOSController extends DetectorController{
    public function index(){
        $game = new GameMgrModel();
        $gameList = $game->getGameLetter26(ConstantUtils::$PLATFORM_IOS);
        $this->assign('game_list', $gameList);
        
        
        $suggest_list = $game->getSuggestGameList(28);
        $this->assign('suggest_list',$suggest_list);
        

        $packageObj = new IOSCZPackageModel();
        $czPackageRes = $packageObj->getListLimit(12);
        $this->assign('cz_package',$czPackageRes);

        $this->theme($this->theme)->display();
    }
    
    public function get_discount_time(){
        $nowTime = time();
        $activeTime = strtotime(ConstantUtils::$ACTIVITY_TIME);
        if($activeTime >= $nowTime){
            echo 'true';
        }else{
            echo 'false';
        }
    }
    
    public function chongzhi_info($gameId){
        if(IS_POST){
            if(intval(I('post.cz_number')) < 0){
                return $this->error("充值数量不能为负数");
            }
            if(intval(I('post.cz_option'))<0){
                return $this->error("面额不能为负数");
            }

            $option =new CZOptionIOSMgrModel();
            $price = $option->getPrice($_POST['cz_option']);
            $order = new CZOrderIOSModel();
            $orderId = $order ->orderInsert($gameId, $price);
            if($orderId){
                $this->redirect('chongzhi_verify', array('orderId'=>$orderId));
            }
        }

        $isLogin = get_uid()? true:false;
        $this->assign('is_login', $isLogin);

        $game = new GameMgrModel();
        $info = $game->getInfo($gameId);
        
        $this->assign('is_show',$info['ios_platform']);
        $this->assign('game_id', $info['id']);
        $this->assign('game_name', $info['name']);
        $this->assign('need_qufu', $info['qufu_flag']);
        $this->assign('is_tx', $info['tx_flag']);
        $this->assign('game_pic', $info['pic']);

        $option = new CZOptionIOSMgrModel();
        $option = $option->getOption($gameId, $info['currency']);
        $this-> assign('option', $option);

        $this->assign('double_flag', isDoubleCreditsTime());
        $this->assign('submit_url', U('chongzhi_info?gameId='.$gameId));

        $title = $info['name'] ."充值中心_".$info['name']."充值平台_".$info['name']."苹果ios充值_".$info['name']."怎么充值_"."轰轰虎";
        $seoInfo = array(
            ConstantUtils::$SEO_TITLE_KEY=>$title,
            ConstantUtils::$SEO_KEYWORD_KEY=>"",
        );
        $this->theme($this->theme)->display('', $seoInfo);
    }

    public function chongzhi_again($orderId){
    	if(IS_POST){
            if(intval(I('post.cz_number')) < 0){
                return $this->error("充值数量不能为负数");
            }
            if(intval(I('post.cz_option'))<0){
                return $this->error("面额不能为负数");
            }

    		$order = new CZOrderIOSModel();
    		$orderRes = $order->getInfo($orderId);
    		$gameId = $orderRes['czInfo']['game_id'];
    		
    		$option =new CZOptionIOSMgrModel();
    		$price = $option->getPrice($_POST['cz_option']);


    		$order = new CZOrderIOSModel();
    		$orderId = $order ->orderInsert($gameId, $price);
    		if($orderId){
    			$this->redirect('chongzhi_verify', array('orderId'=>$orderId));
    		}
    	}
    	$order = new CZOrderIOSModel();
    	$orderRes = $order->getInfo($orderId);
        
		$this->assign('order_info',$orderRes);
    	$gameId = $orderRes['czInfo']['game_id'];
    	$game = new GameMgrModel();
    	$info = $game->getInfo($gameId);
    	
    	$this->assign('is_show',$info['ios_platform']);
    	$this->assign('game_id', $info['id']);
    	$this->assign('game_name', $info['name']);
    	$this->assign('game_pic', $info['pic']);
    	$this->assign('need_qufu', $info['qufu_flag']);
    	$this->assign('is_tx', $info['tx_flag']);
    	
    	$options = new CZOptionIOSMgrModel();
    	$option = $options->getOption($gameId, $info['currency']);
    	$this-> assign('option', $option);

        $this->assign('double_flag', isDoubleCreditsTime());
    	$this->assign('submit_url', U('chongzhi_again?orderId='.$orderId));

        $title = $info['name'] ."充值中心_".$info['name']."充值平台_".$info['name']."苹果ios充值_".$info['name']."怎么充值_"."轰轰虎";
        $seoInfo = array(
            ConstantUtils::$SEO_TITLE_KEY=>$title,
            ConstantUtils::$SEO_KEYWORD_KEY=>"",
        );
    	$this->theme($this->theme)->display('', $seoInfo);
    }
    
    public function chongzhi_modify($orderId){
    	if(IS_POST){
    		$order = new CZOrderIOSModel();
            $orderInfo = $order->getInfo($orderId);
    		$accountId = $orderInfo['accountInfo']['id'];
            $order->canModifyUpdate($orderId);

            $account = new CZGameAccountIOSModel();
    		$account ->accountModify($accountId);
            $isForbbiden = $account->isAccountForbbiden(trim(I('post.account')), $orderInfo['czInfo']['game_id']);
            $order->updateForbbidenFlag($orderId, $isForbbiden);

            $idNo = $orderInfo['czInfo']['id_no'];
            BackgroudTask(ConstantUtils::$TASK_CZ_ORDER, "", 1, $idNo);

    		$this->redirect('Home/CZIOS/chongzhi_doing', array('orderId'=>$orderId));
    	}
    	
    	$order = new CZOrderIOSModel();
    	$orderRes = $order->getInfo($orderId);
    	$this->assign('order_info',$orderRes);
    	$this->assign('submit_url', U('chongzhi_modify',array('orderId'=>$orderId)));
    	$this->theme($this->theme)->display();
    }
    

    public function  chongzhi_verify($orderId){
        if(IS_POST){
            return $this->redirect('CZOrderIOS/order_pay', array(orderId => $orderId));
        }

        $model = new CZOrderIOSModel();
        $orderInfo = $model->getInfo($orderId);
        $this->assign("orderInfo", $orderInfo['czInfo']);
        $this->assign("submit_url", U('CZIOS/chongzhi_verify', array('orderId'=>$orderId)));
        $this->theme($this->theme)->display();
    }


    public function chongzhi_doing($orderId){
        $model = new CZOrderIOSModel();
        $orderInfo = $model->getInfo($orderId);
        $this->assign("orderInfo", $orderInfo['czInfo']);
        $this->assign("extra_url", getExtraUrl());
        $this->theme($this->theme)->display();
    }

    public function cz_introduce(){
        if(cookie('looked')== ConstantUtils::$LOOKED){
            $this->redirect('index');
        }
        cookie('looked',ConstantUtils::$LOOKED,7*24*3600);
        $this->theme($this->theme)->display();
    }

} 