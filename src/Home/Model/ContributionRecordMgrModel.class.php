<?php
namespace Home\Model;


use Utils\ConstantUtils;

class ContributionRecordMgrModel extends DataMgrBaseModel{
    protected $tableName = "contribution_record";

    public function generateRecord($uid, $originalId,$contribution,$type,$organization_id){
        $operation = $this->getOperationByType($type);
        $created_date = date('Y-m-d H:i:s',time());
        $is_valid = ConstantUtils::$IS_VALID['yes'];

        $sql = "insert into $this->tableName (original_id,type,is_valid,created_date,unit,operation,user_id,organization_id)
                values('$originalId','$type','$is_valid','$created_date','$contribution','$operation','$uid',$organization_id)";
        return $this->insert($sql);
    }

    private function getOperationByType($type){
        $operation = "";
        switch($type){
            case ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MEMBER_CZ:
                $operation = ConstantUtils::$OPERATION_ADD;
                break;
            case ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MEMBER_SEND:
                $operation = ConstantUtils::$OPERATION_ADD;
                break;
            case ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MGR_CZ:
                $operation = ConstantUtils::$OPERATION_ADD;
                break;
            case ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MGR_SEND:
                $operation = ConstantUtils::$OPERATION_ADD;
                break;
            case ConstantUtils::$CONTRIBUTION_RECORD_TYPE_CONVERT:
                $operation = ConstantUtils::$OPERATION_MINUS;
                break;
            case ConstantUtils::$CONTRIBUTION_RECORD_TYPE_SYSTEM_CLEAR:
                $operation = ConstantUtils::$OPERATION_MINUS;
                break;
            case ConstantUtils::$CONTRIBUTION_RECORD_TYPE_KICK_MEMBER:
                $operation = ConstantUtils::$OPERATION_MINUS;
                break;
        }
        return $operation;
    }

    public function getMyList($uid){
        $sql = "select id from $this->tableName where user_id = '$uid'";
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count, 12);
        $show = $Page->show();

        $sql = "select id,type,created_date,unit,operation from $this->tableName where user_id = '$uid' order by id desc limit $Page->firstRow,$Page->listRows";
        $data = $this->query($sql);
        if($data){
            foreach($data as $key=>$list){
                $data[$key]['type'] = ConstantUtils::$CONTRIBUTION_RECORD_TYPE_TEXT[$list['type']];
            }
        }

        $list['data'] = $data;
        $list['page'] = $show;

        return $list;
    }

    public function getListByCz($organization_id = ''){
        $operation = ConstantUtils::$OPERATION_ADD;
        $type_member = ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MEMBER_CZ;
        $type_master = ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MGR_CZ;
        $sql = "select id,unit,user_id from $this->tableName where operation = '$operation' and type in($type_member,$type_master) and is_valid = ".ConstantUtils::$IS_VALID['yes'];
        if($organization_id){
            $sql = $sql." and organization_id = '$organization_id'";
        }
        $data = $this->query($sql.' order by id desc');
        $organizationMgr = new OrganizationMgrModel();
        foreach($data as $key=>$list){
            $memberInfo = $organizationMgr->getMemberRow($list['user_id']);
            $data[$key]['nick_name'] = $memberInfo['nick_name'];
        }
        return $data;

    }





    public function unValidRecord($uid){
        $select_sql = "select max(id) as max_id from $this->tableName where user_id = '$uid' and is_valid = ".ConstantUtils::$IS_VALID['yes'] ;
        $maxInfo = $this->query($select_sql);

        $update_sql = "update $this->tableName set is_valid =".ConstantUtils::$IS_VALID['no']." where user_id = '$uid' and is_valid = ".ConstantUtils::$IS_VALID['yes'];
        $this->execute($update_sql);
        return $maxInfo[0]['max_id'];
    }

    public function processAfterLogout($uId, $sum, $organizationId){
        $this->unValidRecord($uId);
        $contribution_type = ConstantUtils::$CONTRIBUTION_RECORD_TYPE_SYSTEM_CLEAR;
        $this->generateRecord($uId, 0,$sum,$contribution_type,$organizationId);
    }

    private function contributionExchangeHB($uId, $sum, $originalId, $organizationId){
        $proportion = ConstantUtils::$EXCHANGE_HB_PROPORTION;
        if(intval($sum) >= $proportion){
            $coins_number = floor($sum/$proportion);
            $coinsRecordMgr = new CoinsRecordMgrModel();
            $coins_type = ConstantUtils::$HB_RECORD_TYPE_CONTRIBUTION_VALUE;
            $coinsRecordMgr->generateRecord($originalId, $coins_number, $uId, $coins_type);
            $type = ConstantUtils::$CONTRIBUTION_RECORD_TYPE_CONVERT;
            $this->generateRecord($uId, 0, $sum, $type, $organizationId);
        }//if
    }

    /*
     * 堂主踢除成员之后，
     *   成员贡献值记录（无效化）兑换成虎币
     *   减少堂主因成员充值所得贡献值，并返回其总和
     */
    public function processAfterKick($uId, $sum, $organizationId){
        $sendUnitSum = $this->unValidMgrFromKickUser($organizationId,$uId);
        $max_id = $this->unValidRecord($uId);
        $this->contributionExchangeHB($uId, $sum, $max_id, $organizationId);
        return $sendUnitSum;
    }



    public function unValidMgrFromKickUser($organizationId,$kick_user_id){
        $is_valid = ConstantUtils::$IS_VALID['yes'];
        $type = ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MEMBER_CZ;
        $whereCondition = " where is_valid = '$is_valid' and organization_id = '$organizationId' and type = '$type' and user_id = '$kick_user_id'";
        $sql = "select original_id from $this->tableName".$whereCondition;
        $data = $this->query($sql);
        $originalIds = array();
        foreach($data as $row=>$rowVal){
            $originalIds[] = $rowVal['original_id'];
        }

        $originalIdTxt = implode(',', $originalIds);
        if($originalIdTxt){
            $type = ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MEMBER_SEND;
            $whereCondition = " where is_valid = $is_valid and type = '$type' and original_id in ($originalIdTxt)";
            $sql = "select sum(unit) as sum_unit from $this->tableName".$whereCondition;
            $result = $this->query($sql);
            if(!empty($result)){
                $unitSum = $result[0]['sum_unit'];
                $is_valid = ConstantUtils::$IS_VALID['no'];
                $sql = "update $this->tableName set is_valid = $is_valid ".$whereCondition;
                $this->execute($sql);

                $type = ConstantUtils::$CONTRIBUTION_RECORD_TYPE_KICK_MEMBER;
                $organizationMgr = new OrganizationMgrModel();
                $mgr_id = $organizationMgr->getMgrIdById($organizationId);
                $this->generateRecord($mgr_id, 0,$unitSum,$type,$organizationId);
            }//if
        }//if

        return $unitSum;
    }
}