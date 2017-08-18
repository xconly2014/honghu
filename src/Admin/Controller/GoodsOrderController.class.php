<?php


namespace Admin\Controller;


use Admin\Model\GoodsOrderMgrModel;
use Admin\Model\CreditRecordsMgrModel;
class GoodsOrderController extends AuthController{
    private static  $order_function ='order_list';

    public function order_list(){
        if(IS_GET){
            $keywords = I('get.keywords');
        }
        
        $GoodsOrderMgr = new GoodsOrderMgrModel();
        $orderRes = $GoodsOrderMgr->getList($keywords);
        
        $this->assign('orderRes',$orderRes['data']);
        $this->assign('show',$orderRes['page']);
    	$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->display();
    }
    
    public function details($id){
        $GoodsOrderMgr = new GoodsOrderMgrModel();
        $orderRes = $GoodsOrderMgr->getRow($id);
        $this->assign('orderRes',$orderRes);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->display();     
    }
    
    public function ajax_edit_state(){
        if(IS_AJAX){
            $state = I('post.state');
            $oid = I('post.id');
            $orderMgr = new GoodsOrderMgrModel();
            $result = $orderMgr->updateState($oid, $state);
            $this->ajaxReturn($result);
        }
    }
    
} 