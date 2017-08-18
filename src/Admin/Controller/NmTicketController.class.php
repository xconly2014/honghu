<?php
namespace Admin\Controller;
use Admin\Model\NmTicketMgrModel;

class NmTicketController extends AuthController{
    private static  $nm_function ='nm_list';
	
	public function nm_list(){
		$word = "";
		if(IS_GET){
			$keyword = I('get.keyword');
		}
        $nmMgr = new NmTicketMgrModel();
		$list = $nmMgr->getList($keyword);
		$this->assign('nm_list',$list['data']);
		$this->assign('show',$list['show']);
		
		$this->assign('title','糯米券列表');
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$nm_function);
		$this->display();
	}

    public function add_nm(){
        if(IS_POST){
            $nmMgr = new NmTicketMgrModel();
            $insertId = $nmMgr->insertData();
            if($insertId > 0){
                return $this->success('添加成功',U('Admin/NmTicket/nm_list'));
            }
        }
        $this->display();
    }

    public function del_nm($id){
        $nmMgr = new NmTicketMgrModel();
        $resultId = $nmMgr->delDate($id);
        if($resultId){
            return $this->success('删除成功',U('Admin/NmTicket/nm_list'));
        }
    }
	
}