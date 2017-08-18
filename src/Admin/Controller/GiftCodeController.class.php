<?php
namespace Admin\Controller;
use Admin\Model\GiftCodeMgrModel;
use Admin\Model\GameMgrModel;

class GiftCodeController extends AuthController{
    private static  $code_function ='code_list';
	
	public function code_list(){
		$name = "";
		if(IS_GET){
			$name = I('get.name');
		}

        $giftMgr = new GiftCodeMgrModel();
		$giftList = $giftMgr->getList($name);

		$this->assign('gift_list',$giftList['data']);
		$this->assign('show',$giftList['show']);
		
		$this->assign('title','礼包码列表');
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$code_function);
		$this->display();
	}
	
	public function add_code(){
		if(IS_POST){
			$giftMgr = new GiftCodeMgrModel();
			$insert_res = $giftMgr->addDate();
			if($insert_res){
				return $this->success('添加成功',U('Admin/GiftCode/code_list'));
			}else{
				$this->error('添加失败',U('Admin/GiftCode/add_news'));
			}
		}
        $gameMgr = new GameMgrModel();
        $gameData = $gameMgr->getGameList();
        $this->assign('game_list',$gameData['data']);

		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$code_function);
		$this->assign('title',"添加礼包码");
		$this->display();
	}

	public function del_code($id){
        $giftMgr = new GiftCodeMgrModel();
        $giftMgr->deleteCode($id);
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$code_function);
		$this->success('删除成功',U('Admin/GiftCode/code_list'));
	}
}