<?php
namespace Home\Controller;

use Home\Model\GroupBuyCzOrderMgrModel;
use Home\Model\GroupBuyCzMgrModel;
use Home\Model\GameMgrModel;
use Home\Model\GroupBuyCzTicketMgrModel;
use Home\Model\GroupBuyCzLuckerMgrModel;
use Utils\ConstantUtils;

class GroupBuyCzController extends DetectorController{

    public function buy($id){
        if(IS_GET){
            $gbczMgr = new GroupBuyCzMgrModel();
            $gbczRes = $gbczMgr->getRow($id);

            $gameMgr = new GameMgrModel();
            $gamePic = $gameMgr->getInfo($gbczRes['game_id']);
            $this->assign('game_pic', $gamePic['pic']);

            $gbczOrderMgr = new GroupBuyCzOrderMgrModel();
            $groupBuyRes = $gbczMgr->getListLimit(8);

            $ticketMgr = new GroupBuyCzTicketMgrModel();
            $currentGbRecord = $ticketMgr->getCurrentGbRecord($id);
            
            $myGbRecord = "";
            $userPaidNum = 0;
            $isLogin = false;
            if(get_uid()){
                $userPaidNum = $gbczOrderMgr->getCustomerPaidNum($id,get_uid());
                $myGbRecord = $gbczOrderMgr->getMyGbRecord(get_uid());
                $isLogin = true;
            }
            $this->assign('my_record',$myGbRecord);
            $this->assign('is_login', $isLogin);
            $this->assign('all_record',$currentGbRecord);
                        
            $this->assign('new_group_buy',$groupBuyRes);
            $seoInfo = array(
                ConstantUtils::$SEO_TITLE_KEY=>$gbczRes['option_text']."_".ConstantUtils::$SITE_KEYWORD,
                ConstantUtils::$SEO_KEYWORD_KEY=>$gbczRes['option_text']."_".ConstantUtils::$SITE_KEYWORD
            );

            if($gbczRes['state'] != ConstantUtils::$GROUP_BUY_STATE_FINISH){   //state = 0 | 1
                $paidNum = $gbczOrderMgr->getItemPaidNum($id);
  
                $resNum = $gbczMgr->getMaxBoughtNum($paidNum,$userPaidNum,$id);

                if($gbczRes['active'] == ConstantUtils::$FULL){
                    $releaseTime = (strtotime($gbczRes['release_time'])) * 1000;
                    $this->assign('release_time',$releaseTime);
                    $this->assign('nowTime',time()*1000);
                }
                
                $this->assign('max_num',$resNum['max']);
                $this->assign('active',$gbczRes['active']);
                $this->assign('bg_width',$resNum['bgwidth']);
                $this->assign('paidNum',$paidNum);
                $this->assign('end',$resNum['end']);
                $this->assign('bgczRes', $gbczRes);
                $this->assign('submit_url', U('Home/GroupBuyCzOrder/addOrder',array('id'=>$id)));

                $this->theme($this->theme)->display('', $seoInfo);
            }else{    //state = 2
                $hundredsData = $gbczOrderMgr->getLastHundred($id);
                $luckyManInfo = $gbczMgr->getLuckCodeInfo($gbczRes['lucky_ticket_id']);
                $endTime = $gbczOrderMgr->getLastPaytime($id);
                $this->assign('endTime',$endTime);
                $this->assign('gbData',$hundredsData);
                $this->assign('luckyManInfo',$luckyManInfo);
                $this->assign('bgczRes', $gbczRes);
                
                $this->theme($this->theme)->display('results', $seoInfo);
            }
        }
    }
    
    
    public function buy_finish($orderId){
        $gbczOrderMgr = new GroupBuyCzOrderMgrModel();
        $rowOrder = $gbczOrderMgr->getRowOrder($orderId);
        
        $this->assign('rowOrder',$rowOrder);
        $this->theme($this->theme)->display();
    }

    public function ajax_get_lucky_code(){
        if(IS_AJAX){
            $groupBuyCzId  = I('post.id');
            $gbczMgr = new GroupBuyCzMgrModel();
            $result = $gbczMgr->updateState($groupBuyCzId, ConstantUtils::$GROUP_BUY_STATE_FINISH);
            if(is_int($result)){
                $gbczRes = $gbczMgr->getRow($groupBuyCzId);
                echo $gbczRes['lucky_code'];
                //BackgroudTask(ConstantUtils::$TASK_GROUP_BUY_CZ_FINISH, '', '', $gbczRes['id']);
            } 
        }   
    }

    public function confirm_info($itemId){
        if(IS_GET){
            $gbczMgr = new GroupBuyCzMgrModel();
            $rowRes = $gbczMgr->getRow($itemId);

            if(!$gbczMgr->hasLuckerAnnounced($itemId)){
                return $this->error('此一元购未开奖');
            }//if
            $gbczTicketMgr =  new GroupBuyCzTicketMgrModel();
            $luckerInfo = $gbczTicketMgr->getLuckyInfo($rowRes['lucky_ticket_id']);
            if($luckerInfo && $luckerInfo['user_id'] != get_uid()){
                return $this->error('您不是此一元购的中奖者');
            }//if

            $gameMgr = new GameMgrModel();
            $game_info = $gameMgr->getInfo($rowRes['game_id']);

            $this->assign('title',$rowRes['option_text']);
            $this->assign('game',$game_info);

            $this->assign('submit_ur',U('Home/GroupBuyCz/confirm_info',array('itemId'=>$itemId)));
            $this->theme($this->theme)->display();
        }
        if(IS_POST){
            $luckerMgr = new GroupBuyCzLuckerMgrModel();
            $insertId = $luckerMgr->addLuckerInfo($itemId);
            if(is_int($insertId)){
                BackgroudTask(ConstantUtils::$TASK_GROUP_BUY_CZ_CONFIRM, "", "", $itemId);
                return $this->redirect('chongzhi_doing',array('itemId'=>$itemId));
            }
        }
    }

    public function chongzhi_doing($itemId){

        $gbczMgr = new GroupBuyCzMgrModel();
        $rowRes = $gbczMgr->getRow($itemId);

        $TicketMgr = new GroupBuyCzTicketMgrModel();
        $TicketInfo = $TicketMgr->getRow($rowRes['lucky_ticket_id']);

        $gbczOrderMgr = new GroupBuyCzOrderMgrModel();
        $rowOrder = $gbczOrderMgr->getRowOrder($TicketInfo['order_id']);

        $this->assign('orderRes',$rowOrder);
        $this->theme($this->theme)->display();
    }
} 