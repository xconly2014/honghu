<?php
namespace Admin\Controller;
use Admin\Model\RuleMgrModel;
use Admin\Model\MenuMgrModel;
use Utils\ConstantUtils;

class RuleController extends AuthController{
    private static  $rule_function ='rule_list';
	
	public function rule_list(){
        $ruleMgr = new RuleMgrModel();
		$list = $ruleMgr->getList();

		$this->assign('rule_list',$list['data']);
        $this->assign('page',$list['show']);
		$this->assign('title','权限列表');
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$rule_function);
		$this->display();
	}

    public function add_rule(){
        if(IS_POST){
            $ruleMgr = new RuleMgrModel();
            $insertRes = $ruleMgr->addRule();
            if($insertRes){
                return $this->success('添加成功',U('Admin/Rule/rule_list'));
            }
        }
        $menuMgr = new MenuMgrModel();
        $subMenu = $menuMgr->getSubMenu();

        $this->assign('sub_list',$subMenu);
        $this->display();
    }

    public function edit_rule($id){
        $ruleMgr = new RuleMgrModel();

        if(IS_POST){
            $res = $ruleMgr->updateDate($id);
            if($res){
               return $this->success('修改成功',U('Admin/Rule/rule_list'));
            }
        }

        $menuMgr = new MenuMgrModel();
        $subMenu = $menuMgr->getSubMenu();
        $this->assign('sub_list',$subMenu);

        $row = $ruleMgr->getRow($id);
        $this->assign('row',$row);
        $this->assign('url',U('Admin/Rule/edit_rule',array('id'=>$id)));
        $this->display();

    }

    public function del_rule($id){
        $ruleMgr = new RuleMgrModel();
        $delRes = $ruleMgr->delDate($id);
        if($delRes){
            $this->success('删除成功',U('Admin/Rule/rule_list'));
        }


    }

}