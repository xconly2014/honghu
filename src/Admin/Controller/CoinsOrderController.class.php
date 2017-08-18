<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/9/25
 * Time: 20:35
 */

namespace Admin\Controller;

use Admin\Model\CoinsOrderModel;
use Admin\Model\CoinsRecordMgrModel;
use Admin\Model\UserMgrModel;
use Utils\ConstantUtils;

class CoinsOrderController extends AuthController
{
    private static $coins_function = 'order_list';
    
    public function order_list(){
        $coinsOrderMgr = new CoinsOrderModel();
        $orderList = $coinsOrderMgr->getList(I('post.name'));
        $this->assign('order_list', $orderList['data']);
        $this->assign('title','虎币列表');
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$coins_function);
        $this->assign('show', $orderList['show']);

        $this->display();
    }
    
    public function record_list($uid){
        $coinsRecord = new CoinsRecordMgrModel();
        $coinsRecordList = $coinsRecord->getList($uid);
        
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$coins_function);
        $this->assign('coins_record_list',$coinsRecordList);
        $this->display();
    }

    public function record_details($id){
        $coinsRecord = new CoinsRecordMgrModel();
        $recordInfo = $coinsRecord->getInfo($id);

        if($recordInfo && $recordInfo['type'] == ConstantUtils::$HB_RECORD_TYPE_BUY){
            $coinsOrderMgr = new CoinsOrderModel();
            $orderInfo = $coinsOrderMgr->getInfo($id);
            $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$coins_function);
            $this->assign('order_info',$orderInfo);
            $this->display();
        }
    }


    public function send_coins(){
        if(IS_POST){
            $username = I('post.name');
            $userMgr = new UserMgrModel();
            $uid = $userMgr->checkUser($username);
            if($uid){
                $coinsRecordMgr = new CoinsRecordMgrModel();
                $resultId = $coinsRecordMgr->addSendCoins($uid);
                $userMgr->addCoins($uid, I('post.num'));
                if($resultId > 0){
                    return $this->success('添加成功');
                }
            }
            $this->error('用户账号不存在');
        }
        $this->display();
    }

    public function ajax_check_user(){
        if (IS_AJAX) {
            $username = I('post.name');
            $userMgr = new UserMgrModel();
            $uid = $userMgr->checkUser($username);
            $result = 'false';
            if ($uid > 0) {
                $result = 'true';
            }
            echo $result;
        }
    }

}