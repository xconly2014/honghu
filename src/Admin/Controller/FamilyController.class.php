<?php
namespace Admin\Controller;

use Admin\Model\FamilyMgrModel;
class FamilyController extends AuthController{
    private static $family_function = 'family_list';
    
    public function family_list(){
        $familyMgr = new FamilyMgrModel();
        $familyList = $familyMgr->getFamilyList();
        $this->assign('family_list',$familyList);
        
        $this->assign('cur_page',CONTROLLER_NAME.'/'.self::$family_function);
        $this->display();
    }
    
    public function contribute_list($organization_id){
        $familyMgr = new FamilyMgrModel();
        $memberList = $familyMgr->getMemberList($organization_id);
        
        $this->assign('member_list',$memberList);
        $this->assign('cur_page',CONTROLLER_NAME.'/'.self::$family_function);
        $this->display();
    }
    
    public function ajax_recommand(){
        if(IS_AJAX){
            $id = I('post.oid');
            $familyMgr = new FamilyMgrModel();
            $recommandRes = $familyMgr->updateRecommand($id);
            $this->ajaxReturn($recommandRes);
        }
    }
}
