<?php


namespace Admin\Controller;
use Admin\Model\ScIosOrderMgrModel;

class IOSScOrderController extends AuthController{
    private static  $order_function ='order_list';

    // 苹果IOS首充号
    public function order_list(){
        $title = '';
        if(IS_GET){
            $title = I('get.title');
        }
        $iosScOrderMgr = new ScIosOrderMgrModel();
        $orderRes = $iosScOrderMgr->getList($title);
        
        $this->assign('show',$orderRes['page']);
        $this->assign('orderList',$orderRes['list']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->display();
    }
    
    public function details($id){
        if(IS_GET){
            $iosScOrderMgr = new ScIosOrderMgrModel();
            $orderRes = $iosScOrderMgr->getRow($id);
            $this->assign('orderRes',$orderRes);
            $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
            $this->display();
        }
        
    }
    
    public function ajax_edit_state(){
        if(IS_AJAX){
            $state = I('post.state');
            $oid = I('post.id');
            $orderMgr = new ScIosOrderMgrModel();
            $result = $orderMgr->updateState($oid, $state);
            $this->ajaxReturn($result);
        }
    }
} 