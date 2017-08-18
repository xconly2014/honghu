<?php
namespace Admin\Controller;
use Admin\Model\AuthGroupMgrModel;
use Admin\Model\UserMgrModel;
use Admin\Model\AuthRuleMgrModel;
use Admin\Model\MenuMgrModel;

class UserController extends AuthController{
    private static  $user_function ='user_list';
    private static  $group_function ='group_list';
    private static  $admin_function ='admin_list';

    public function user_list(){
    	$name = I('get.name');
        $userMgr = new UserMgrModel();
        $userinfo = $userMgr->getList($name);
        $this->assign('user_list', $userinfo['data']);
        $this->assign('show', $userinfo['show']);
       	$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$user_function);
        $this->display();
    }

    public function group_list(){
        $groupMgr = new AuthGroupMgrModel();
        $groupList = $groupMgr->getAll();
        $this->assign('group_list', $groupList);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$group_function);
        $this->assign('title', "用户组列表");
        $this->display();
    }

    public function add_group(){
        if(IS_POST){
            $groupObj = new AuthGroupMgrModel();
            $result = $groupObj->addData();
            if($result > 0){
                $this->success('添加成功', U('Admin/User/group_list'));
            }else{
                $this->error('添加失败', U('Admin/User/group_list'));
            }
        }else{
            //获取大菜单
            $menuObj = new MenuMgrModel();
            $menu = $menuObj->getSubMenu();
            
            $ruleObj = new AuthRuleMgrModel();
            $rules = $ruleObj->getAllRule();

            $topMenu = $menuObj->getTopMenu();
            unset($topMenu[0]);
            	
            $this->assign('topMenu',$topMenu);
            $this->assign('menus',$menu);
            $this->assign('rules',$rules);
            $this->assign('cur_page', "group_list");
            $this->assign('title', "用户组添加");
            $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$group_function);
            $this->display();
        }
    }

    public function update_group_access($id){
        if(IS_GET){
            $menuObj = new MenuMgrModel();
            $menu = $menuObj->getSubMenu();
			
            $ruleObj = new AuthRuleMgrModel();
            $rules = $ruleObj->getAllRule();
			
            $groupObj = new AuthGroupMgrModel();
            $info = $groupObj->getRuleById($id);
            
            $topMenu = $menuObj->getTopMenu();
            unset($topMenu[0]);
			
            $this->assign('topMenu',$topMenu);
            $this->assign('submit_url', U('Admin/User/update_group_access',array('id'=>$id)));
            $this->assign('info',$info);
            $this->assign('menus',$menu);
            $this->assign('rules',$rules);

            $this->assign('title', "组权限编辑");
            $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$group_function);
            $this->display();
        }
        if(IS_POST){
            $groupObj = new AuthGroupMgrModel();
            $result = $groupObj->updateData($id);
            if(is_int($result)){
                $this->success('修改成功',U('Admin/User/group_list'));
            }
        }
    }
    
    
    
    
   /*管理员*/
    public function admin_list(){
    	if(IS_GET){
    		$groupMgr = new AuthGroupMgrModel();
    		$group_info =$groupMgr->getAll();
    		
    		
    		$userMgr = new UserMgrModel();
    		$data = $userMgr->admin_list();
    		$this->assign('admin_list',$data);
    		$this->assign('title', "管理管理员");
    		$this->assign("group_list",$group_info);
    		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$admin_function);
    		$this->display();    		
    	}
    	if(IS_POST){
    		$userMgr = new UserMgrModel();
    		$admin_user_id = $userMgr->add_admin_user();
    		if($admin_user_id > 0){
    			$userMgr->add_auth_group_access($admin_user_id);
    			$this->redirect('Admin/User/admin_list');
    		}
    	}

    }
    
    
    public function edit_admin($id){
    	if(IS_GET){
    		$userMgr = new UserMgrModel();
    		$row = $userMgr->get_group_access_info($id);
    		
    		$groupMgr = new AuthGroupMgrModel();
    		$group_info =$groupMgr->getAll();
    		
    		$this->assign('url',U('Admin/User/edit_admin',array('id'=>$id)));
    		$this->assign('row_info',$row);
    		$this->assign("group_list",$group_info);
    		$this->assign('title', "编辑管理员");
    		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$admin_function);
    		$this->display();
    	}
    	if(IS_POST){
    		$userMgr = new UserMgrModel();
    		$result = $userMgr->update_admin($id);
    		if(is_int($result)){
    			$this->success('修改成功',U('admin_list'));
    		}
    	}
    }
    
    
    
    public function admin_del($id){
    	$userMgr = new UserMgrModel();
    	$result = $userMgr->del($id);
    	if(is_int($result)){
    		$this->success('',U('admin_list'));
    	}
    }
    
    

} 