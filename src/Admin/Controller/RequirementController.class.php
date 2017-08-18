<?php
namespace Admin\Controller;

use Admin\Model\GameMgrModel;
use Admin\Model\RequirementMgrModel;

class RequirementController extends AuthController{
    private static  $requirement_function ='get_list';
    
	public function get_list(){
		$title = '';
		if(IS_POST){
			$title = I('post.title');
		}
		$requirement = new RequirementMgrModel();
		$requirementList = $requirement->getRequirementList($title);
		
		$this->assign('requirement_list',$requirementList['data']);
		$this->assign('show',$requirementList['show']);
		$this->assign('title','代练需求');
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$requirement_function);
		$this->display();
	}
	
/* 	public function requirement_edit($id){
		$requirement = new RequirementMgrModel();
		if(IS_POST){
			$requirementRes = $requirement->updateRequirement($id);
			if($requirementRes){
				return $this->success('审核成功');
			}else{
				return $this->error('审核失败');
			}	
		}
		$requirementInfo = $requirement->getRequirementInfo($id);
		
		$game = new GameMgrModel();
		$gameInfo = $game->getInfo($requirementInfo['game_id']);
		
		$this->assign('game_name',$gameInfo['name']);
		$this->assign('requirement_info',$requirementInfo);
		$this->display();
	} */
	
	public function details($id){
	    $requirement = new RequirementMgrModel();
	    $rowInfo = $requirement->getInfo($id);
	    $this->assign('row',$rowInfo);
	    $this->display();   
	}
}