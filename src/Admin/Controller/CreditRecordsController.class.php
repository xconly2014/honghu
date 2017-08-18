<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/10/23
 * Time: 14:39
 */

namespace Admin\Controller;


use Admin\Model\CreditRecordsMgrModel;
use Think\Controller;
use Utils\ConstantUtils;

class CreditRecordsController extends AuthController
{
    private static $order_function = "record_list";

    public function record_list(){
        $creditsRecordMgr = new CreditRecordsMgrModel();
        $allRecord = $creditsRecordMgr->getAllRecordList();

        $this->assign('cur_page',CONTROLLER_NAME.'/'.self::$order_function);
        $this->assign('record_list',$allRecord['data']);
        $this->assign('pager', $allRecord['show']);
        $this->display();
    }

    public function user_record_list($uid){
        $creditsRecordMgr = new CreditRecordsMgrModel();
        $creditsRecordList = $creditsRecordMgr->getUserRecordList($uid);
        $creditsInfo = $creditsRecordMgr->user_credit_info($uid);
        $this->assign('add_credits',$creditsInfo['add']);
        $this->assign('minus_credits',$creditsInfo['minus']);
        $this->assign('current_credits',$creditsInfo['current']);

        $this->assign('cur_page',CONTROLLER_NAME.'/'.self::$order_function);
        $this->assign('user_record',$creditsRecordList['data']);
        $this->assign('pager',$creditsRecordList['show']);
        $this->display();
    }
}