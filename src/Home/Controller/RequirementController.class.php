<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-5-16
 * Time: 下午3:02
 */

namespace Home\Controller;


use Home\Model\CZ\AndroidOperatorModel;
use Home\Model\RequirementMgrModel;
use Home\Model\RequirementOrderMgrModel;
use Home\Model\UserMgrModel;
use Think\Controller;
use Utils\ConstantUtils;
use Home\Model\GameMgrModel;

class RequirementController extends DetectorController{


    /**
     * 代练需求信息填写界面和添加
     */
    public function publish($gameId){
        //添加数据
        if(IS_POST){
            //添加数据
            $RequirementObj = new RequirementMgrModel();
            $rid = $RequirementObj->addInfo($gameId);
            //如果添加成功，显示填写玩家信息的界面
            if($rid > 0){
                $this->redirect('Requirement/game_account',array('rid'=>$rid));
            }else{
                $this->error($rid,U('Home/Requirement/publish/',array('gameId'=>$gameId)));
            }
        }
        if(IS_GET){
            //显示玩家发布代练需求界面
            $operatorObj = new AndroidOperatorModel();
            $data = $operatorObj->getOperatorAll();
            
            $game = new GameMgrModel();
            $gameRes = $game->getInfo($gameId);
            $this->assign('game_pic',$gameRes['pic']);
            $this->assign('game_name',$gameRes['name']);
            
            $this->assign('submit_url', U('Home/Requirement/publish', array('gameId'=>$gameId)));
            $this->assign('operator',$data);
            $this->theme($this->theme)->display();
        }
    }

    /**
     * 玩家填写账号信息
     */
    public function game_account($rid){
        if(IS_POST){
            //修改
            $RequirementObj = new RequirementMgrModel();
            $info = $RequirementObj->updateInfo($rid);

            if(is_int($info)){
                //生成属于玩家的订单
                $orderObj = new RequirementOrderMgrModel();
                $orderObj->delNotPaidOrderIfNeed($rid);
                $oid = $orderObj->addOrder(ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER, $rid, "");
                if($oid > 0){
                    return $this->redirect('Home/RequirementOrder/pay_price',array('orderId'=>$oid));
                }
            }
        }
        if(IS_GET){
            $RequirementObj = new RequirementMgrModel();
            $RequirementObjRes = $RequirementObj->getInfo($rid);
            $gameId = $RequirementObjRes['game_id'];
            
            $game = new GameMgrModel();
            $gameRes = $game->getInfo($gameId);
            $this->assign('game_pic',$gameRes['pic']);
            $this->assign('submit_url', U('Home/Requirement/game_account', array('rid'=>$rid)));
            $this->theme($this->theme)->display();
        }
    }

    /**
     * 需求详情
     */
    public function receive($id){
        if(IS_POST){
            $userMgr = new UserMgrModel();
            if(!$userMgr->userIsTrainer(get_uid())){
                return $this->redirect('Home/User/authentication');
            }
            $this->redirect('Home/Requirement/verify_requirement', array('id'=>$id));
        }
        $requiremtObj = new RequirementMgrModel();
        if(!$requiremtObj->isStateCorrect($id, ConstantUtils::$REQUIREMENT_STATE_MAP[ACTION_NAME])){
            return $this->error('查看套餐信息出错', U('TradeCenter/index'));
        }
        $data = $requiremtObj->getDataById($id);

        $this->assign('can_buy',$data['hu_active']);
        $this->assign('data',$data);
        $this->assign('url',U('Home/Requirement/receive',array('id'=>$id)));

        $seoInfo = array(
            ConstantUtils::$SEO_TITLE_KEY=>$data['hu_title']."_轰轰虎",
            ConstantUtils::$SEO_KEYWORD_KEY=>"",
        );
        $this->theme($this->theme)->display('info', $seoInfo);
    }

    /**
     * 需求确认，代练师填写联系方式
     */
    public function verify_requirement($id){
        $rObj = new RequirementMgrModel();
        $orderObj = new RequirementOrderMgrModel();
        if(!$rObj->isStateCorrect($id, ConstantUtils::$REQUIREMENT_STATE_MAP[ACTION_NAME])){
            return $this->error('购买套餐信息出错', U('TradeCenter/index'));
        }

        if(IS_POST){
            $cashOrderId = $orderObj->addOrder(ConstantUtils::$ORDER_TYPE_DEPOSIT_TRAINER, $id, I('post.contact'));	//生成代练师的订单
            if($cashOrderId > 0){
                $this->redirect('Home/RequirementOrder/pay_security',array('orderId'=>$cashOrderId));
            }
        }
        else{
            $this->assign('data',$rObj->getInfo($id));
            $this->assign('url',U('Home/Requirement/verify_requirement',array('id'=>$id)));
            
            $this->theme($this->theme)->display();
        }


    }

    public function publish_finish($orderId){
        $requirementOrder = new RequirementOrderMgrModel();
        $requirementOrderInfo = $requirementOrder->getInfo($orderId);
        
        $this->assign('requirement_order_info',$requirementOrderInfo);
        
        $this->theme($this->theme)->display();
    }

    public function get_finish($orderId){
        $requirementOrder = new RequirementOrderMgrModel();
        $requirementOrderInfo = $requirementOrder->getInfo($orderId);
        
        $this->assign('requirement_order_info',$requirementOrderInfo);
        
        $this->theme($this->theme)->display();
    }
} 