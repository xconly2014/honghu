<?php
namespace Admin\Controller;
use Admin\Model\CollectPraiseMgrModel;
use Utils\ConstantUtils;

class CollectPraiseController extends AuthController{
    private static  $cp_function ='cp_list';
	
	public function cp_list(){
		$word = "";
		if(IS_GET){
			$keyword = I('get.keyword');
		}
        $collectMgr = new CollectPraiseMgrModel();
		$list = $collectMgr->getList($keyword);
		$this->assign('nm_list',$list['data']);
		$this->assign('show',$list['show']);
		
		$this->assign('title','集赞列表');
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$cp_function);
		$this->display();
	}

    public function check($id){
        $collectMgr = new CollectPraiseMgrModel();
        if(IS_POST){
            $collectMgr = new CollectPraiseMgrModel();
            $resId = $collectMgr->updateActive($id);
            if($resId > 0){
                return $this->success('修改成功',U('Admin/CollectPraise/cp_list'));
            }
        }
        $row = $collectMgr->getRow($id);

        $this->assign('info',$row);
        $this->assign('state_no',ConstantUtils::$COLLECT_PRAISE_NOT_THROUGH);
        $this->assign('state_ok',ConstantUtils::$COLLECT_PRAISE_THROUGH);

        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$cp_function);
        $this->assign('url',U('Admin/CollectPraise/check',array('id'=>$id)));
        $this->display();
    }

	
}