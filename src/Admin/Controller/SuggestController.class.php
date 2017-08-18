<?php
namespace Admin\Controller;


use Admin\Model\SuggestMgrModel;
class SuggestController extends AuthController{
    private static  $suggest_function ='suggest_list';
    
    public function suggest_list(){
        $suggest = new SuggestMgrModel();
        $suggestList = $suggest->getList();
        
        $this->assign('suggest_list',$suggestList);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$suggest_function);
        $this->display();
    }
    
    public function del_suggest($id){
        $suggest = new SuggestMgrModel();
        $suggest->deleteSuggest($id);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$suggest_function);
        $this->success('删除成功',U('Admin/Suggest/suggest_list'));
    }
}