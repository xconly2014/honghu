<?php


namespace Home\Controller;
use Home\Model\OrganizationMgrModel;
use Home\Model\ContributionRecordMgrModel;
use Utils\ConstantUtils;
use Home\Model\MessageMgrModel;


class FamilyController extends DetectorController{
    public function family_index(){
        if(IS_GET){
            //获取登陆者堂会信息
            $organizationMgr = new OrganizationMgrModel();
            $organizationRes = $organizationMgr->getUserOrganizationInfo(get_uid());
            $this->assign('family_info',$organizationRes);
            $this->assign('is_member',$organizationRes);
            
            $ranking_list = $organizationMgr->getOrganizationList(ConstantUtils::$SORT_BY_SUM);
            $this->assign('ranking_list',$ranking_list);

            $RecordMgr =new ContributionRecordMgrModel();
            $dynamic_list = $RecordMgr->getListByCz();
            $this->assign('dynamic_list',$dynamic_list);

            $recommendRes = $organizationMgr->getRecommandList();
            $this->assign('recommend_list',$recommendRes);
            $this->theme($this->theme)->display();
        }
    }

    public function family_info($id){
        if(IS_GET){
            $organizationMgr = new OrganizationMgrModel();
            $organizationInfo = $organizationMgr->getOrganizationRow($id);
            $this->assign('current_family',$organizationInfo);

            $this->assign('add_show', $organizationMgr->canUserJoin(get_uid(), $id));
            $this->assign('quit_show', $organizationMgr->canUserLogout(get_uid(), $id));

            $RecordMgr =new ContributionRecordMgrModel();
            $this->assign('dynamic_list',$RecordMgr->getListByCz($id));

            $member_list = $organizationMgr->getMemberList($id,get_uid());
            $this->assign('members',$member_list['data']);
            $this->assign('page',$member_list['page']);
            
            $isLogin = get_uid()? true:false;
            $this->assign('is_login', $isLogin);

            $this->theme($this->theme)->display();
        }
    }

    public function family_all(){
        $organizationMgr = new OrganizationMgrModel();
        $first_info = $organizationMgr->getFirstRow();
        $this->assign('first',$first_info);

        $all_data = $organizationMgr->getOrganizationList(ConstantUtils::$SORT_BY_TIME);
        $this->assign('all_list',$all_data);

        $this->display();
    }
    
    public function family_logout($id){
        if(IS_AJAX) {
            if (!get_uid()) {
                $this->ajaxReturn(array(
                    'state' => 'true',
                    'message' => '请先登录后再进行操作'
                ));
            }

            $uId = get_uid();
            $organizationMgr = new OrganizationMgrModel();
            $isMgr = $organizationMgr->isUserOrganizationMgr($uId, $id);
            if ($isMgr) {
                $this->ajaxReturn(array(
                    'state' => 'true',
                    'message' => '本堂堂主不可退出堂会！'
                ));
            }//if
            $retVal = array('status'=>false, 'msg'=>"操作失败");
            $organizationMgr = new OrganizationMgrModel();
            $result = $organizationMgr->memberLogout($uId);
            if($result){
                $retVal['state'] = true;
                $retVal['message'] = "已退出该堂会";
            }//if
            $this->ajaxReturn($retVal);
        }
    }
    
    public function add_member(){
        if(IS_AJAX){
            if(!is_login()){
                $this->ajaxReturn(array(
                        'state'=>'false',
                        'message'=>'请先登录'
                ));
            }

            $organizationMgr = new OrganizationMgrModel();
            $isMember = $organizationMgr->isUserJoinOrganization(get_uid());
            if($isMember){
                $this->ajaxReturn(array(
                        'state'=>'false',
                        'message'=>'你已是堂会成员了'
                ));
            }
            
            $organizationId = I('post.id');
            $isLimited = $organizationMgr->isMemberCountLimit($organizationId);
            if($isLimited){
                $this->ajaxReturn(array(
                        'state'=>'false',
                        'message'=>'该堂会成员数已达到上限'
                ));
            }
            
            $familyMemberRes = $organizationMgr->memberInsert($organizationId);
            if($familyMemberRes){
                $organizationMgr->addOrganizationMember($organizationId);
                $this->ajaxReturn(array(
                        'state'=>'true',
                        'message'=>'加入堂会成功，您已是该堂会的一员了！'
                ));
            }
        }
    }
}