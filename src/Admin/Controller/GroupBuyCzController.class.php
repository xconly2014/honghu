<?php
namespace Admin\Controller;
use Admin\Model\GameMgrModel;
use Admin\Model\GroupBuyCzMgrModel;
use Admin\Model\GroupBuyCzTicketModel;
use Utils\ConstantUtils;

class GroupBuyCzController extends AuthController{
    private static  $group_buy_cz_function ='index';

    public function index(){
        
        if(IS_GET){
            $keywords = trim($_GET['keywords'],' ');
        }
        
        $groupMgr = new GroupBuyCzMgrModel();
        $GroupBuyCzList = $groupMgr->getList($keywords);
        
        $this->assign('GroupBuyCzList',$GroupBuyCzList['data']);
        $this->assign('show',$GroupBuyCzList['show']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$group_buy_cz_function);
        $this->assign('keyword', $keywords);
        $this->display();
    }

     public function gb_insert(){
        if(IS_POST){
            $groupMgr = new GroupBuyCzMgrModel();
            $GroupBuyCzId = $groupMgr->insertData();
            if($GroupBuyCzId){
                $itemInfo = $groupMgr->getGroupBuyCzRow($GroupBuyCzId);
                $groupBuyTicketMgr = new GroupBuyCzTicketModel();
                $sepLineId = $groupBuyTicketMgr->prepareTicket($GroupBuyCzId, $itemInfo['price']);
                $groupMgr->updateTicketIndex($GroupBuyCzId, $sepLineId);

              //  BackgroudTask(ConstantUtils::$TASK_GENERATE_QUEUE, "", "", $GroupBuyCzId);
                $this->success("添加成功！",U('Admin/GroupBuyCz/index'));
            }else{
                $this->error('添加失败');
            }
        }
        if(IS_GET){
            $game = new GameMgrModel();
            $gameRes = $game->getGameList();
            $this->assign('gameRes',$gameRes['data']);
            $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$group_buy_cz_function);
            $this->display();
        }
    }


     public function gb_del(){
        $groupMgr = new GroupBuyCzMgrModel();
        $GroupBuyCzRes = $groupMgr->del();
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$group_buy_cz_function);
        if($GroupBuyCzRes){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    
    public function fake_list(){
        
        $groupBuyTicket = new GroupBuyCzTicketModel();
        $fake_list = $groupBuyTicket->get_fake_list();
        
        $this->assign('fake_list',$fake_list);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$group_buy_cz_function);
        $this->display();
    }
    
    public function add_fake(){
        if(IS_POST){
            $groupBuyTicket = new GroupBuyCzTicketModel();
            $fakeRes = $groupBuyTicket ->fake_insert();
            if($fakeRes){
                return $this->success('添加成功',U('Admin/GroupBuyCz/fake_list'));
            }else{
                return $this->error('添加失败');
            }
        }   
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$group_buy_cz_function);
        $this->display();
    }
    
    public function del_fake($id){
        $groupBuyTicket = new GroupBuyCzTicketModel();
        $fakeRes = $groupBuyTicket ->fake_delete($id);
        
        if($fakeRes){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }


    public function details($id){
        $groupMgr = new GroupBuyCzMgrModel();
        $row = $groupMgr->getDetails($id);
        $this->assign('itemInfo',$row['itemInfo']);
        $this->assign('luckerInfo',$row['luckerInfo']);
        $this->display();


    }

} 