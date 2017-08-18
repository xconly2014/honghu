<?php
namespace Admin\Controller;

use Admin\Model\CZOrderIOSModel;
use Admin\Model\ForbbidenAccountMgrModel;
use Admin\Model\GameMgrModel;
use Think\Controller;
use Utils\ConstantUtils;
use Admin\Model\OrderTagMgrModel;
use Admin\Model\TagLinkMgrModel;
use Admin\Model\CardMgrModel;

class CZOrderIOSController extends AuthController {
    private static  $order_function ='order_list';
    private static  $third_function = 'third_order_list';

    private function filterOrderState($orderState){
        $filterResult = $orderState;
        unset($filterResult[ConstantUtils::$CZ_ORDER_STATE_INIT]);
        return $filterResult;
    }

    public function order_list(){
        $oid = ConstantUtils::$ID_NONE;
        if(IS_POST){
            $oid = I('post.orderId');
        }
        
        $tagMgr = new OrderTagMgrModel();
        $tagList = $tagMgr->getList();
        $this->assign('tag_list',$tagList);
        
        $orderMgr = new CZOrderIOSModel();
        $orderList = $orderMgr->getList($oid);


        $cardNameMgr = new CardMgrModel();
        $this->assign('card_names', $cardNameMgr->getList());
        $this->assign('order_list', $orderList['data']);
        $this->assign('show', $orderList['show']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->assign('order_state_text', $this->filterOrderState(ConstantUtils::$CZ_ORDER_STATE));
        $this->assign('title', "ios充值订单");
        $this->display('OrderCenter/cz_order_ios_list');
    }
    
    public function card_list(){
        $cardMgr = new CardMgrModel();
        if(IS_POST){
            $cardRes = $cardMgr->cardInsert();
            if($cardRes){
                $this->success('添加成功',U('Admin/CZOrderIOS/card_list'));
            }else{
                $this->error('添加失败',U('Admin/CZOrderIOS/card_list'));
            }
        }else{
            $cardList = $cardMgr->getList();
            $this->assign('card_list',$cardList);
            $this->assign('cur_page',CONTROLLER_NAME.'/'.self::$order_function);
            $this->display('OrderCenter/card_list');
        }        
    }
    
    public function del_card($id){
        $cardMgr = new CardMgrModel();
        $cardRes = $cardMgr->cardDel($id);
        $this->success('删除成功',U('Admin/CZOrderIOS/card_list'));
    }
    
    public function add_tag_link(){
        if(IS_AJAX){
             $tagLinkMgr = new TagLinkMgrModel();
             $tagLinkRes = $tagLinkMgr->tagLinkInsert();
             if($tagLinkRes){
                 $this->ajaxReturn(array(
                         'state'=>'true',
                         'message'=>'添加标签成功'
                 ));
             }            
        }
    }
    
    public function del_tag_link(){
        if(IS_AJAX){
            $tagLinkMgr = new TagLinkMgrModel();
            $tagLinkRes = $tagLinkMgr->tagLinkDel();
            if($tagLinkRes){
                $this->ajaxReturn(array(
                        'state'=>'true',
                        'message'=>'删除标签成功'
                ));
            }
        }
    }
    
    public function order_cancle($id){
        $orderMgr = new CZOrderIOSModel();
        if(IS_POST){
            $info = $orderMgr->orderCancle($id);
            if($info['status']){
                return $this->success("退款成功！", U('Admin/CZOrderIOS/order_list'));
            }
            else {
                return $this->error($info['msg'], U('Admin/CZOrderIOS/order_list'));
            }
        }

        $info = $orderMgr->canOrderCancle($id);
        if(!$info['can_cancle']){
            return $this->error($info['msg'], U('Admin/CZOrderIOS/order_list'));
        }

        $orderInfo = $orderMgr->getInfo($id);
        $this->assign('title','IOS订单退款');
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->assign('order_info',$orderInfo);
        $this->assign('submit_url', U('Admin/CZOrderIOS/order_cancle', array('id'=>$id)));
        $this->display('OrderCenter/order_cancle');
    }

    public function order_view($id){
        $orderMgr = new CZOrderIOSModel();
        $orderInfo = $orderMgr->getInfo($id);
        
        $cardMgr = new CardMgrModel();
        $cardList = $cardMgr->getList();
        $this->assign('card_list',$cardList);

        $this->assign('order_state_text', $this->filterOrderState(ConstantUtils::$CZ_ORDER_STATE));
        $this->assign('order_info',$orderInfo);
        $this->assign('title','IOS订单查看');
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->display('OrderCenter/ios_order_view');
    }
    
    
    public function ajax_edit_state(){
        if(IS_AJAX){
            $state = I('post.state');
            $oid = I('post.id');
            $orderMgr = new CZOrderIOSModel();
            $info = $orderMgr->canUpdateState($oid);

            if($info['status']){
                $info = $orderMgr->updateState($oid, $state);
                $info['data'] = ConstantUtils::$CZ_ORDER_STATE[$state];
                $info['state'] = $state;
                $info['color'] = $orderMgr->decideColorByState($state);
            }//if
            
            $this->ajaxReturn($info);
        }
    }
    
    public function ajax_star(){
        if(IS_AJAX){
            $id = I('post.oid');
            $orderMgr = new CZOrderIOSModel();
            $res = $orderMgr->updateStar($id);
            $this->ajaxReturn($res);
        }
    }

    public function ajax_edit_card(){
        if(IS_AJAX) {
            $oid = I('post.id');
            $cardId = I('post.card_id');
            $orderMgr = new CZOrderIOSModel();
            $cardNameMgr = new CardMgrModel();
            $cardNameInfo = $cardNameMgr->getRow($cardId);
            $orderMgr->updateCardName($oid, $cardNameInfo['name']);
            $this->ajaxReturn(array('status'=>true, 'data'=>$cardNameInfo['name']));
        }//if
    }

    public function add_forbbiden_account(){
        if(IS_POST){
            $ForbbidenAccount = new ForbbidenAccountMgrModel();
            $ForbbidenAccount->addAccount();
            return $this->success("添加成功！", U('Admin/CZOrderIOS/forbbiden_account_list'));
        }
        $gameMgr = new GameMgrModel();
        $gameRes = $gameMgr->getGameList();
        $this->assign('gameRes', $gameRes['data']);
        $this->display('OrderCenter/add_forbbiden_account');
    }

    public function forbbiden_account_list(){
        $ForbbidenAccount = new ForbbidenAccountMgrModel();
        $recordRes = $ForbbidenAccount->getList('');
        $this->assign('record_list', $recordRes['data']);
        $this->assign('show', $recordRes['show']);
        $this->display('OrderCenter/forbbiden_account_list');
    }

    public function account_del($id){
        $ForbbidenAccount = new ForbbidenAccountMgrModel();
        $result = $ForbbidenAccount->accountDel($id);

        if($result){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
} 