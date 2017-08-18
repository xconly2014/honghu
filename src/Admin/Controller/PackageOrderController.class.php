<?php

namespace Admin\Controller;

use Admin\Model\PackageOrderMgrModel;

class PackageOrderController extends AuthController{
    private static  $order_function ='order_list';
    
    public function order_list(){
        
        $title = '';
        if(IS_GET){
            $title = I('get.title');
        }
        $packageOrderMgr = new PackageOrderMgrModel();
        $packageOrderList = $packageOrderMgr->getList($title);

        $this->assign('show',$packageOrderList['page']);
        $this->assign('packageOrderList',$packageOrderList['list']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->display();
    }
    
    public function details($id){
        $packageOrderMgr = new PackageOrderMgrModel();
        $orderRes = $packageOrderMgr->getInfo($id);
        
        $this->assign('package',$orderRes['packageInfo']);
        $this->assign('account',$orderRes['accountInfo']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->display();
    }
    
    
} 