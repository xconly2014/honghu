<?php

namespace Admin\Controller;

use Admin\Model\RequirementOrderMgrModel;

class RequirementOrderController extends AuthController{
    private static  $order_function ='order_list';
    
    public function order_list(){
        
        $title = '';
        if(IS_GET){
            $title = I('get.title');
        }
        $requirementOrderMgr = new RequirementOrderMgrModel();
        $requirementOrderList = $requirementOrderMgr->getList($title);
        
        
        $this->assign('show',$requirementOrderList['page']);
        $this->assign('requirementOrderList',$requirementOrderList['list']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->display();
    }
    
    public function details($id){
        $requirementOrderMgr = new RequirementOrderMgrModel();
        $orderRes = $requirementOrderMgr->getInfo($id);
        $this->assign('orderRes',$orderRes);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->display();
    }
} 