<?php


namespace Admin\Controller;
use Admin\Model\ScAndroidOrderMgrModel;

class AndroidScOrderController extends AuthController{
    private static  $order_function ='order_list';

    // 安卓首充号
    public function order_list(){
        $title = '';
        if(IS_GET){
            $title = I('get.title');
        }
        $androidScOrderMgr = new ScAndroidOrderMgrModel();
        $orderRes = $androidScOrderMgr->getList($title);
        
        $this->assign('show',$orderRes['page']);
        $this->assign('orderList',$orderRes['list']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->display();
    }
    
    public function details($id){
        if(IS_GET){
            $androidScOrderMgr = new ScAndroidOrderMgrModel();
            $orderRes = $androidScOrderMgr->getRow($id);
            
            $this->assign('orderRes',$orderRes);
            $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
            $this->display();
        }  
    }
    
    
    public function ajax_edit_state(){
        if(IS_AJAX){
            $state = I('post.state');
            $oid = I('post.id');
            $orderMgr = new ScAndroidOrderMgrModel();
            $result = $orderMgr->updateState($oid, $state);
            $this->ajaxReturn($result);
        }
    }
} 