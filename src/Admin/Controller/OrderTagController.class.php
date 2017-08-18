<?php
namespace Admin\Controller;

use Admin\Model\OrderTagMgrModel;

class OrderTagController extends AuthController{
    
    public function tag_list(){
        $tagMgr = new OrderTagMgrModel();
        if(IS_POST){
            $tagRes = $tagMgr->tagInsert();
            if($tagRes){
                $this->success('添加成功',U('Admin/OrderTag/tag_list'));
            }else{
                $this->error('添加失败',U('Admin/OrderTag/tag_list'));
            }
        }else{
            
            $tagList = $tagMgr->getList();
            $this->assign('tag_list',$tagList);
        
            $this->display();
        }        
    }
    
    public function del_tag($id){
        $tagMgr = new OrderTagMgrModel();
        $tagRes = $tagMgr->tagDel($id);
        $this->success('删除成功',U('Admin/OrderTag/tag_list'));
    }
    
}