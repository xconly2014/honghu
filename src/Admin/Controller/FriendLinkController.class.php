<?php
namespace Admin\Controller;
use Think\Controller;
use Admin\Model\FriendLinkMgrModel;

class FriendLinkController extends Controller{
	public function friend_link_list(){
		
		$name = '';
		if(IS_POST){
			$name = I('post.name');
		}
		$FriendLink = new FriendLinkMgrModel();
		$friendLinkList = $FriendLink->getList($name);
		
		$this->assign('friend_link_list',$friendLinkList['data']);
		$this->assign('show',$friendLinkList['show']);
		
		$this->assign('title','友链列表');
		$this->assign('cur_page',CONTROLLER_NAME.'/'.ACTION_NAME);
		$this->display();
		
	}
	
	public function write_friend_link(){
		if(IS_POST){
			$friendLink = new FriendLinkMgrModel();
			$friendLinkRes = $friendLink->addFriendLink();
			if($friendLinkRes){
				$this->success('添加成功',U('Admin/FriendLink/friend_link_list'));
			}else{
				$this->error('添加失败',U('FriendLink/write_friend_link'));
			}
		}
		if(IS_GET){
		    $this->assign('title','友链添加');
		    $this->display();
		}
		
	}
	
	public function del_friend_link($id){
		$FriendLink = new FriendLinkMgrModel();
		$FriendLink->delFriendLink($id);
		$this->success('删除成功',U('Admin/FriendLink/friend_link_list'));
	}
}