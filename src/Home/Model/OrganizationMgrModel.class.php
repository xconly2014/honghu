<?php
namespace Home\Model;
use Utils\ConstantUtils;

class OrganizationMgrModel extends DataMgrBaseModel{
    private $tableName = "organization";
    private $memberTableName = "member";


    public function add(){

        $logo_id = I('post.family_logo_id');
        $introduction = I('post.introduction');
        $created_date = date('Y-m-d H:i:s',time());
        $mgr_id = get_uid();
        $max_count = ConstantUtils::$FAMILY_MAX_COUNT;

        $sql = "insert into $this->tableName (logo_id,created_date,mgr_id,introduction,sum,member_count,max_count,recommand) value('$logo_id','$created_date','$mgr_id','$introduction','0','1','$max_count','0')";
        return $this->insert($sql);
    }

    public function getUserOrganizationInfo($uId){
        $organizationId = $this->isUserJoinOrganization($uId);
        return $this->getOrganizationRow($organizationId);
    }

    public function isMemberCountLimit($id){
        $organizationRow = $this->getOrganizationRow($id);
        if($organizationRow['member_count'] == $organizationRow['max_count']){
            return true;
        }
        return false;
    }

    public function getOrganizationRow($id){
        
        $sql = "select id,logo_id,member_count,max_count,sum,mgr_id,introduction from $this->tableName where id = '$id'";
        $row = $this->query($sql);
        if($row[0]){
            $logoMgr = new OrganizationLogoMgrModel();
            $logoInfo = $logoMgr->getRow($row[0]['logo_id']);

            $memberInfo = $this->getMemberRow($row[0]['mgr_id']);
            $row[0]['nick_name'] = $memberInfo['nick_name'];
            $row[0]['name'] = $logoInfo['name'];
            $row[0]['logo'] = $logoInfo['pic_name'];
        }
        return empty($row) ? '' : $row[0];
    }

    /*
     * 检查用户是否为堂会管理员
     */
    public function isUserOrganizationMgr($uId, $organizationId){
        $userOrganizationId = $this->isUserJoinOrganization($uId);
        if(!$userOrganizationId){
            return false;
        }//if
        if($userOrganizationId != $organizationId){
            return false;
        }//if
        if(checkIdentity($uId) == ConstantUtils::$IDENTITY_MANAGER){
            return true;
        }//if
        return false;
    }

    public function getRecommandList(){
        $recommand = ConstantUtils::$IS_RECOMMEND['yes'];
        $sql = "select id,logo_id,member_count,sum,max_count from $this->tableName where recommand = '$recommand' order by sum desc limit 6";
        $data = $this->query($sql);
        $this->encapsulationData($data);
        return empty($data) ? '' : $data;
    }

    public function getFirstRow(){
        $sql = $sql = "select id,logo_id,member_count,sum,max_count from $this->tableName order by sum desc limit 1";
        $data = $this->query($sql);
        $this->encapsulationData($data);
        return empty($data) ? '' : $data[0];
    }

    public function getOrganizationList($sorting ='sum'){
        $ranking = ' order by sum desc';
        if($sorting  == ConstantUtils::$SORT_BY_TIME){
            $ranking = ' order by created_date asc';
        }

        $sql = "select id,logo_id,member_count,sum,max_count from $this->tableName  ".$ranking;
        $data = $this->query($sql);
        $this->encapsulationData($data);

        return empty($data) ? '' : $data;

    }

    /*
     * 会员自行退出/堂主踢除成员后，
     * 更新堂会信息：成员数、贡献值总数
     */
    public function updateAfterMemberOut($id, $contribt_sum){
        $sql = "update $this->tableName set member_count=member_count-1,sum =sum-$contribt_sum where id='$id'";
        return $this->execute($sql);
    }
    
    public function addOrganizationMember($id){
        $sql = "update $this->tableName set member_count=member_count+1 where id='$id'";
        return $this->execute($sql);
    }

    public function getMemberRow($user_id){
        $type = ConstantUtils::$MEMBER_TYPE_IN;
        $sql = "select id,user_id,organization_id,contribt_sum,created_date,nick_name from $this->memberTableName where user_id = '$user_id' and type='$type'";
        $row = $this->query($sql);
        return empty($row) ? '' : $row[0];
    }


    public function getMemberList($organization_id,$user_id=''){
        $type = ConstantUtils::$MEMBER_TYPE_IN;
        $sql = "select id,user_id,organization_id,contribt_sum,created_date,nick_name from $this->memberTableName where organization_id = '$organization_id' and type='$type' order by contribt_sum desc, created_date asc";
        $data = $this->query($sql);

        $info = $this->assemblyMemberData($data,$user_id);

        $page_size = ConstantUtils::$FAMILY_INFO_PAGE_SIZE;
        if($info['num']){
            $res['page'] = ceil($info['num']/$page_size) - 1;
        }
        $res['data'] = array_chunk($info['data'],$page_size);

        return empty($res['data']) ? '' : $res;
    }


    //组装member数据
    private  function assemblyMemberData($data,$uid=''){
        $userMgr = new UserMgrModel();
        $vipMgr = new VipLevelMgrModel();
        $num = '';
        $copyData = $data;
        foreach($copyData as $key=>$list){
            if($list['user_id'] == $uid){
                $num = $key + 1;
            }
            $copyData[$key]['ranking'] = $key + 1;
            $userInfo = $userMgr->getUserInfo($list['user_id']);
            $copyData[$key]['pic'] = $userInfo['thumb_img'];
            $vipInfo = $vipMgr->getVipInfo($userInfo['cz_sum']);
            $copyData[$key]['vip'] = empty($vipInfo['name']) ?  '无' : $vipInfo['name'];
        }

        $res['data'] = $copyData;
        $res['num'] = $num;
        return $res;

    }
    //组装Organization数据
    private function encapsulationData(&$data){
        if($data){
            $logoMgr = new OrganizationLogoMgrModel();
            foreach($data as $key=>$row){
                $data[$key]['residue'] = $row['max_count'] - $row['member_count'];
                $data[$key]['progress'] = ($row['member_count'] / $row['max_count']) * 100;
                $logoInfo = $logoMgr->getRow($row['logo_id']);
                $data[$key]['logo'] = $logoInfo['pic_name'];
                $data[$key]['name'] = $logoInfo['name'];
            }
        }
    }

    public function memberInsert($family_id){
        $nick_name = I('post.nick_name');
        $user_id = get_uid();
        $created_date = date('Y-m-d H:i:s',time());
        $type = ConstantUtils::$MEMBER_TYPE_IN;

        $sql = "insert into $this->memberTableName (user_id,organization_id,created_date,nick_name,contribt_sum,type) value ('$user_id','$family_id','$created_date','$nick_name','0','$type')";
        return $this->execute($sql);
    }

    /*
     * 检查用户是否在“某个”堂会
     */
    public function isUserJoinOrganization($user_id){
        $type = ConstantUtils::$MEMBER_TYPE_IN;
        $sql = "select id,organization_id from $this->memberTableName where user_id='$user_id' and type='$type'";
        
        $result = $this->query($sql);
        return empty($result)? false:$result[0]['organization_id'];
    }

    /*
     *
     */
    public function canUserJoin($uid, $id){
        $isJoin = $this->isUserJoinOrganization($uid);
        $isLimited = $this->isMemberCountLimit($id);
        if(!$isJoin && !$isLimited){
            return true;
        }
        return false;
    }

    public function canUserLogout($uid, $id){
        $isIn = $this->isUserInOrganization($uid, $id);
        $isMgr = $this->isUserOrganizationMgr($uid, $id);

        if($isIn && !$isMgr){
            return true;
        }
        return false;
    }

    /*
     * 检查用户是否在指定堂会
     */
    public function isUserInOrganization($user_id, $organization_id){
        $oid = $this->isUserJoinOrganization($user_id);
        if($oid == $organization_id){
            return true;
        }
        return false;
    }

    /*
     * 判断用户是否“曾经”在某个堂会
     */
    public function isUserInOrganizationEver($uId){
        $sql = "select id,organization_id from $this->memberTableName where user_id='$uId'";

        $result = $this->query($sql);
        return !empty($result)&&$result[0]['organization_id']? true:false;
    }

    private function memberLogoutImp($id){
        $type = ConstantUtils::$MEMBER_TYPE_OUT;
        $sql = "update $this->memberTableName set type='$type', contribt_sum=0 where id='$id'";
        return $this->execute($sql);
    }

    /*
     * 堂员自行退出
     */
    public function memberLogout($uId){
        $memberInfo = $this->getMemberRow($uId);
        $success = $this->memberLogoutImp($memberInfo['id']);
        if($success){
            $sum = $memberInfo['contribt_sum'];
            $organizationId = $memberInfo['organization_id'];
            $memberName = $memberInfo['nick_name'];
            if($sum > 0){
                $contributionMgr = new ContributionRecordMgrModel();
                $contributionMgr->processAfterLogout($uId, $sum, $organizationId);
            }
            $this->updateAfterMemberOut($organizationId, $sum);//

            $messageMgr = new MessageMgrModel();
            $msgType = ConstantUtils::$MESSAGE_TYPE_MEMBER_LOGOUT;
            $info = $this->getOrganizationRow($organizationId);
            $messageMgr->generateMessage($msgType, $info['mgr_id'], array('name'=>$memberName));
            return true;
        }

        return false;
    }


    private function outMember($id){
        $type = ConstantUtils::$MEMBER_TYPE_KICK;
        $sql = "update $this->memberTableName set type='$type', contribt_sum=0 where id=$id";
        return $this->execute($sql);
    }

    public function getOrganizationMembers($user_id){
        $memberInfo = $this->getMemberRow($user_id);
        $type = ConstantUtils::$MEMBER_TYPE_IN;
        $sql = "select user_id from $this->memberTableName where user_id <> '$user_id' and type = '$type' and organization_id = ".$memberInfo['organization_id'];
        $res =  $this->query($sql);
        return empty($res) ? '' : $res;
    }

    private  function addMemberContribution($user_id,$contribution){
        $type = ConstantUtils::$MEMBER_TYPE_IN;
        $sql = "update $this->memberTableName set contribt_sum  = contribt_sum  + $contribution where user_id = '$user_id' and type = '$type'";
        return $this->execute($sql);
    }

    private  function addOrganizationContribution($organization_id,$sum){
        $sql = "update $this->tableName set sum = sum + $sum where id = '$organization_id'";
        return $this->execute($sql);
    }

    public function addContributionRecords($user_id,$oid,$payment){
        $user_identity = checkIdentity($user_id);

        if($user_identity != ConstantUtils::$IDENTITY_ORDINARY){
            $organization_id = $this->getOrganizationIdByUId($user_id);
            $extraParam = array(
                'payment' => $payment,
                'organization_id'=>$organization_id,
                'oid'=>$oid
            );

            if($user_identity == ConstantUtils::$IDENTITY_MANAGER){
                $senderList  = $this->getOrganizationMembers($user_id);
                $data = $this->genContributionData($user_id, $senderList, ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MGR_CZ, $extraParam);
            }

            if($user_identity == ConstantUtils::$IDENTITY_MEMBER) {
                $senderList[] = array('user_id' => $this->getMgrIdByUId($user_id));
                $data = $this->genContributionData($user_id, $senderList, ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MEMBER_CZ, $extraParam);
            }//
            $contribution_sum = $this->insertRecord($data);
            return $this->addOrganizationContribution($organization_id, $contribution_sum);
        }
    }

    private function getTypeAndPercentage($type){
        switch($type){
            case ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MEMBER_CZ:
                $type = ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MEMBER_SEND;
                $percentage = ConstantUtils::$CONTRIBUTION_PERCENTAGE_MEMBER_SEND;
                break;
            case ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MGR_CZ:
                $type = ConstantUtils::$CONTRIBUTION_RECORD_TYPE_MGR_SEND;
                $percentage = ConstantUtils::$CONTRIBUTION_PERCENTAGE_MGR_SEND;
                break;
        }

        return array('type'=> $type, 'percentage'=>$percentage);
    }

    private function genSlaverData($slaver, $type, $extraParam){
        $allUser = array();
        foreach($slaver as $user){
            $userUnit['user_id'] = $user['user_id'];
            $typePercentage = $this->getTypeAndPercentage($type);
            $userUnit['type'] = $typePercentage['type'];
            $userUnit['percentage'] = $typePercentage['percentage'];
            $userUnit['contribution'] = $extraParam['payment'] * $userUnit['percentage'];
            $userUnit['organization_id'] = $extraParam['organization_id'];
            $userUnit['oid'] = $extraParam['oid'];
            $allUser[] = $userUnit;
        }

        return $allUser;
    }

    private function genMasterData($masterId, $type, $extraParam){
        $allUser = array();
        $userUnit['user_id'] = $masterId;
        $userUnit['type'] = $type;
        $userUnit['percentage'] = ConstantUtils::$CONTRIBUTION_VALUE_SELF;
        $userUnit['contribution'] = $extraParam['payment'] * $userUnit['percentage'];
        $userUnit['organization_id'] = $extraParam['organization_id'];
        $userUnit['oid'] = $extraParam['oid'];
        $allUser[] = $userUnit;

        return $allUser;
    }

    private function genContributionData($masterId, $slaver, $type, $extraParam){
        $slaveData = $this->genSlaverData($slaver, $type, $extraParam);
        $masterData = $this->genMasterData($masterId, $type, $extraParam);
        return array_merge($slaveData, $masterData);
    }


    private function insertRecord($data){
        if($data){
            $contributionMgr = new ContributionRecordMgrModel();
            $sum_val = floatval(0);
            foreach($data as $list){
                $contributionMgr->generateRecord($list['user_id'],$list['oid'] ,$list['contribution'],$list['type'],$list['organization_id']);
                $this->addMemberContribution($list['user_id'],$list['contribution']);
                $sum_val = $sum_val + $list['contribution'];
            }
            return $sum_val;
        }
        return 0;
    }

    public function getMgrIdByUId($uid){
        $memberInfo = $this->getMemberRow($uid);
        $organization_id = $memberInfo['organization_id'];

        $sql = "select mgr_id from $this->tableName where id = '$organization_id'";
        $res = $this->query($sql);
        return empty($res) ? '' : $res[0]['mgr_id'];
    }

    public function getOrganizationIdByUId($uid){
        $res = $this->getMemberRow($uid);
        return empty($res) ? '' : $res['organization_id'];
    }

    public function getMyMembers($uid){
        $type = ConstantUtils::$MEMBER_TYPE_IN;
        $memberInfo = $this->getMemberRow($uid);
        $organization_id = $memberInfo['organization_id'];

        $sql = "select id from $this->memberTableName where user_id <> '$uid' and type = '$type' and organization_id = '$organization_id'";
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count, 8);
        $show = $Page->show();

        $sql = "select id,user_id,contribt_sum,nick_name from $this->memberTableName where user_id <> '$uid' and type = '$type' and organization_id = '$organization_id' order by contribt_sum desc limit $Page->firstRow,$Page->listRows";
        $data = $this->query($sql);

        $info = $this->assemblyMemberData($data);

        $res_data['data'] = $info['data'];
        $res_data['page'] = $show;
        return $res_data;
     }

    /*
     * 堂主踢除成员
     */
    public function kickMember($user_id){
        $memberInfo = $this->getMemberRow($user_id);
        $success = $this->outMember($memberInfo['id']);
        if($success){
            $sum = $memberInfo['contribt_sum'];
            $organizationId = $memberInfo['organization_id'];
            if($sum > 0){
                $contributionMgr = new ContributionRecordMgrModel();
                $sendUnitSum = $contributionMgr->processAfterKick($user_id, $sum, $organizationId);
                $this->minusMemberContribution($this->getMgrIdById($organizationId), $sendUnitSum);
                $sum += $sendUnitSum;
            }
            $this->updateAfterMemberOut($organizationId,$sum);


            $messageMgr = new MessageMgrModel();
            $msgType = ConstantUtils::$MESSAGE_TYPE_MEMBER_KICK;
            $messageMgr->generateMessage($msgType, $user_id,'');

            return true;
        }//if
        return false;
    }


    private  function minusMemberContribution($uid,$minus_sum){
        $type = ConstantUtils::$MEMBER_TYPE_IN;
        $sql = "update $this->memberTableName set contribt_sum  = contribt_sum -$minus_sum where user_id = '$uid' and  type = '$type'";
        return $this->execute($sql);

    }

    public function getMgrIdById($id){
        $sql = "select mgr_id from $this->tableName where id = '$id'";
        $res = $this->query($sql);
        return empty($res) ? '' : $res[0]['mgr_id'];
    }
}