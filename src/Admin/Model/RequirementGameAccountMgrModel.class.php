<?php
namespace Admin\Model;

use Utils\ConstantUtils;


class requirementGameAccountMgrModel extends DataMgrBaseModel{
    private $tableName = 'requirement_game_account';
    
    
    public function getRequirementGameAccountInfo($id){
        $sql = "select account,password,qufu,role,role_details,result,contact_way,platform,operator_id from $this->tableName where id = '$id'";
        $result  = $this->query($sql);
        if(!empty($result)){
            $result[0]['platform'] = ConstantUtils::$PLATFORM_STRING[$result[0]['platform']];
            if($result[0]['operator_id']){
                $scAndroidMgr = new ScAndroidOrderMgrModel();
                $result[0]['operator'] = $scAndroidMgr->getOperatorName($result[0]['operator_id']);
            }
            return $result[0];
        }
        return ''; 
    }

} 