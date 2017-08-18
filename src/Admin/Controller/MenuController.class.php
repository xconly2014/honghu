<?php
namespace Admin\Controller;
use Admin\Model\MenuMgrModel;
use Utils\ConstantUtils;

class MenuController extends AuthController{
    private static  $menu_function ='menu_list';
	
	public function menu_list(){
        $menuMgr = new MenuMgrModel();
		$list = $menuMgr->getList();

		$this->assign('menu_list',$list);
		$this->assign('title','导航列表');
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$menu_function);
		$this->display();
	}


    public function add_menu(){
        $menuMgr = new MenuMgrModel();
        if(IS_POST){
            $insertId = $menuMgr->insertData();
            if($insertId > 0){
                return $this->success('添加成功',U('Admin/Menu/menu_list'));
            }
        }

        $topList = $menuMgr->getTopMenu();
        $this->assign('top_list',$topList);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$menu_function);
        $this->display();
    }


    public function edit_menu($id){
        $menuMgr = new MenuMgrModel();
        if(IS_POST){
            $res_id =$menuMgr->updateDate($id);
            if($res_id){
                return $this->success('修改成功',U('Admin/Menu/menu_list'));
            }
        }
        $row = $menuMgr->getRow($id);
        $this->assign('row',$row);

        $topList = $menuMgr->getTopMenu();
        $this->assign('top_list',$topList);
        $this->assign('url',U('Admin/Menu/edit_menu',array('id'=>$id)));
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$menu_function);

        $this->display();
    }


    public function del_menu($id){
        $menuMgr = new MenuMgrModel();
        $res = $menuMgr->delData($id);
        if($res){
           return  $this->success('删除成功',U('Admin/Menu/menu_list'));
        }
    }


}