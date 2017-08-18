<?php

namespace Admin\Controller;

use Admin\Model\AccountTradeOrderMgrModel;

class AccountTradeOrderController extends AuthController{
    private static  $order_function ='order_list';
    
    public function order_list(){
        
        $title = '';
        if(IS_GET){
            $title = I('get.title');
        }
        $accountTradeMgr = new AccountTradeOrderMgrModel();
        $accountTradeList = $accountTradeMgr->getList($title);
        
        
        $this->assign('show',$accountTradeList['page']);
        $this->assign('accountTradeList',$accountTradeList['list']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->display();
    }
    
    public function details($id){
        $accountTradeMgr = new AccountTradeOrderMgrModel();
        $orderRes = $accountTradeMgr->getInfo($id);
        $this->assign('orderRes',$orderRes);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->display();
    }
} 