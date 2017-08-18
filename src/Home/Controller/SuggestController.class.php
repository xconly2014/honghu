<?php
namespace Home\Controller;

use Home\Model\SuggestMgrModel;

class SuggestController extends DetectorController{
    
    public function suggest(){
        if(IS_AJAX){
            $suggest = new SuggestMgrModel();
            $suggestRes = $suggest->suggestInsert();
            if($suggestRes){
                echo 'success';
            }
        }else{
            $this->assign('title', "建议反馈");
            $this->theme($this->theme)->display();
        }       
    }
    
    
}