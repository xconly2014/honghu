<?php
namespace Admin\Controller;

use Admin\Model\GroupBuyCzOrderMgrModel;

class GroupBuyCzOrderController extends AuthController{
   private static  $order_function ='order_list';
    
   public function order_list(){
       if(IS_GET){
           $keywords = I('get.keywords');
       }
       
       $groupOrderMgr = new GroupBuyCzOrderMgrModel();
       $orderRes = $groupOrderMgr->getList($keywords);
       
       $this->assign('orderRes',$orderRes['data']);
       $this->assign('show',$orderRes['show']);
       $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
       $this->assign('keyword', $keywords);
       $this->display();
   }
   
   
   public function details($id){
       
       $groupOrderMgr = new GroupBuyCzOrderMgrModel();
       $orderRes = $groupOrderMgr->getRow($id);
       
       $this->assign('orderRes',$orderRes);
       $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
       $this->display();
       
       
   }
} 