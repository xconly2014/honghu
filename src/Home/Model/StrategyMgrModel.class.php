<?php
namespace Home\Model;

class StrategyMgrModel extends EvoluationStrategyMgrModel{
	protected  $tableName = 'game_strategy';

	public function fillUrl(&$rowData, $id){
		$rowData['url'] = U('Home/Strategy/index',array('strategyId'=>$id));
	}
}