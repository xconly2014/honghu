<?php
namespace Home\Model;

class EvoluationMgrModel extends EvoluationStrategyMgrModel{
	protected $tableName = 'game_evaluation';

	public function fillUrl(&$rowData, $id){
		$rowData['url'] = U('Home/Evoluation/index',array('evoluationId'=>$id));
	}
}