<?php
namespace Admin\Model;

use Utils\ConstantUtils;
class FamilyMgrModel extends DataMgrBaseModel{
    private $tableName = 'organization';
    private $memberTableName = 'member';
    
    public function getFamilyList(){
        
        $sql = "select id, logo_id, member_count, created_date, max_count, sum, recommand from $this->tableName order by sum desc";
        $result = $this->query($sql);
        
        $retValue = $result; 
        $familyLogo = new FamilyLogoMgrModel();
        $star_class = ConstantUtils::$STAR_CLASS_NAME;
        
        foreach($result as $k=>$v){
            $familyLogoInfo = $familyLogo->getRow($v['logo_id']);
            $retValue[$k]['name'] = $familyLogoInfo['name'];
            $retValue[$k]['pic_name'] = $familyLogoInfo['pic_name'];
            $retValue[$k]['star_class'] = $v['recommand'] ? $star_class : '';
        }
        return $retValue;
    }
    
    public function getMemberList($organization_id){
        
        $sql = "select id, user_id, nick_name, created_date,contribt_sum from $this->memberTableName where organization_id=$organization_id";
        $result = $this->query($sql);
        return empty($result)?'':$result;
    }
    
    public function updateRecommand($id){
        $old_recommand = $this->getRecommandById($id);
        $new_recommand = $old_recommand ? 0 : 1;
        
        $sql = "update $this->tableName set recommand='$new_recommand' where id=$id";
        if($this->execute($sql)){
            $res = array('state'=>'true','data'=>$new_recommand);
        }
        return $res;
    }
    
    private function getRecommandById($id){
        $sql = "select id,recommand from $this->tableName where id=$id";
        $info = $this->query($sql);
        
        return $info[0]['recommand'];
    }
}