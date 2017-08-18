<?php


namespace Home\Controller;


use Home\Model\AccountTradeGameAccountMgrModel;
use Home\Model\AccountTradeMgrModel;
use Home\Model\AccountTradeOrderMgrModel;
use Utils\ConstantUtils;
use Home\Model\CZ\AndroidOperatorModel;
use Home\Model\GameMgrModel;

class AccountTradeController extends DetectorController{

    public function publish($gameId){
        if(IS_POST){
            $tradeAccountMgr = new AccountTradeGameAccountMgrModel();
            $aid = $tradeAccountMgr->addData($gameId);
            if($aid > 0){
                $this->redirect('Home/AccountTrade/add_price',array('id'=>$aid));
            }
        }
        if(IS_GET){
            $operatorObj = new AndroidOperatorModel();
            $data = $operatorObj->getOperatorAll();
            $this->assign('operator',$data);
            
            $game = new GameMgrModel();
            $gameRes = $game->getInfo($gameId);
            $this->assign('game_pic',$gameRes['pic']);
            
            $this->assign('submit_url',U('Home/AccountTrade/publish',array('gameId'=>$gameId)));
            
            $this->theme($this->theme)->display();
        }
    }

    public function add_price($id){
        if(IS_GET){
            $tradeAccountMgr = new AccountTradeGameAccountMgrModel();
            $gameAccountRes = $tradeAccountMgr->getRow($id);
            
            $game = new GameMgrModel();
            $gameRes = $game->getInfo($gameAccountRes['game_id']);
            $this->assign('game_pic',$gameRes['pic']);
            
            $this->assign('url',U('Home/AccountTrade/add_price',array('id'=>$id)));
            $this->theme($this->theme)->display();
        }
        if(IS_POST){
            $tradeMgr = new AccountTradeMgrModel();
            $orderMgr = new AccountTradeOrderMgrModel();
            $itemId = $tradeMgr->delNotFullItemIfNeed($id);
            $type = ConstantUtils::$ACCOUNT_TRADE_ORDER_TYPE['SELLER'];
            if($itemId){
                $orderMgr->delNotPaidOrder($itemId, $type);
            }

            $trade_id = $tradeMgr->addData($id);
            if($trade_id > 0){
                $oid = $orderMgr->addOrder($trade_id, $type);
                if($oid > 0){
                    $this->redirect('Home/AccountTradeOrder/seller_pay',array('orderId'=>$oid));
                }
            }else{
                $this->error($trade_id,U('Home/AccountTrade/add_price',array('id'=>$id)));
            }
        }
    }
    
    public function buy($id){
        if(IS_POST){
            $this->redirect('Home/AccountTrade/buy_verify', array('id'=>$id));
        }

        if(IS_GET){
            $tradeMgr = new AccountTradeMgrModel();
            $data = $tradeMgr->getRow($id);
            $recommendRes = $tradeMgr->getRecommendGoods($id);
            
            $this->assign('can_buy',$data['active']);
            $this->assign('recommendRes',$recommendRes);
            $this->assign('info',$data);
            $this->assign('url',U("Home/AccountTrade/buy",array('id'=>$id)));
            $this->theme($this->theme)->display();
        }
    }

    public function buy_verify($id){
        if(IS_POST){
            $orderMgr = new AccountTradeOrderMgrModel();

            $type = ConstantUtils::$ACCOUNT_TRADE_ORDER_TYPE['BUYER'];;
            $cashOrderId = $orderMgr->addOrder($id,$type, I('post.tel'), I('post.qq_code'));

            if($cashOrderId > 0){
                $this->redirect('Home/AccountTradeOrder/buyer_pay',array('orderId'=>$cashOrderId));
            }
        }

        $tradeMgr = new AccountTradeMgrModel();
        $data = $tradeMgr->getRow($id);

        $this->assign('info',$data);
        $this->assign('submit_url',U("Home/AccountTrade/buy_verify",array('id'=>$id)));
        $this->theme($this->theme)->display();
    }

    public function publish_finish($orderId){
        $orderMgr = new AccountTradeOrderMgrModel();
        $orderInfo = $orderMgr-> getInfo($orderId);
        
        $this->assign('account_order_info',$orderInfo);
        $this->theme($this->theme)->display();
    }

    public function get_finish($orderId){
        $orderMgr = new AccountTradeOrderMgrModel();
        $orderInfo = $orderMgr-> getInfo($orderId);
        
        $this->assign('account_order_info',$orderInfo);
        $this->theme($this->theme)->display();
    }
    

} 