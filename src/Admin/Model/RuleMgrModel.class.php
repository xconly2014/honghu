<?php

namespace Admin\Model;
use Utils\ConstantUtils;

class RuleMgrModel extends DataMgrBaseModel{
	private $tableName = "auth_rule";

    public function getList(){
        $sql = "select id from $this->tableName";

        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,30);

        $sql = "select id,name,title from $this->tableName order by id desc limit $Page->firstRow,$Page->listRows";

        $data = $this->query($sql);

        $resValue['data'] = $data;
        $resValue['show'] = $Page->show();
        return $resValue;
    }

    public function addRule(){
        $mid =I('post.mid');
        $url = I('post.url');
        $name = I('post.name');

        $sql = "insert into $this->tableName (name,title,type,status,m_id) value('$url','$name','1','1','$mid')";
        $insertId = $this->insert($sql);

        if($insertId){
            $menuMgr = new MenuMgrModel();
            $resId = $menuMgr->getMenuRid($mid);
            if($resId == false){
                return $menuMgr->updateRid($mid,$insertId);
            }
            return $insertId;
        }
    }


    public function getRow($id){
        $sql = "select id,name,title,m_id from $this->tableName where id = '$id'";
        $result = $this->query($sql);
        return empty($result) ? '' : $result[0];
    }


    public function updateDate($id){
        $row = $this->getRow($id);
        $mid = I('post.mid');
        $url = I('post.url');
        $title = I('post.name');
        $sql = "update $this->tableName set m_id = '$mid',name = '$url',title ='$title' where id = '$id'";
        $res = $this->execute($sql);
        if($res){
            if($row['m_id'] != $mid){
                $menuMgr = new MenuMgrModel();

                $oldMenuRow = $menuMgr->getRow($row['m_id']);
                if($oldMenuRow['r_id'] == $id ){
                    $checkResId = $this->checkMid($row['m_id']);
                    $rid = is_array($checkResId) ? $checkResId[0]['id'] : 0;
                    $menuMgr->updateRid($row['m_id'],$rid);
                }
               $menuMgr->checkAndUpdateRid($mid,$id);
            }
            return true;
        }
        return false;
    }


    private  function checkMid($mId){
        $sql = "select id from $this->tableName where m_id = '$mId'";
        $result = $this->query($sql);
        return  empty($result) ? 0 :$result;
    }

    public function delRow($id){
        $sql = "delete from $this->tableName where id = '$id'";
        return $this->execute($sql);
    }


    
    public function delRuleByMid($mId){
        $delRids = $this->checkMid($mId);
        if($delRids){
            foreach($delRids as $k=> $list){
                $this->delRow($list['id']);
            }
        }
        return true;
    }



    public function delDate($id){

        $row = $this->getRow($id);
        $res = $this->delRow($id);
        if($res){
            $menuMgr = new MenuMgrModel();
            $menuRow = $menuMgr->getRow($row['m_id']);

            if($menuRow['r_id'] == $id){
                $checkResId  = $this->checkMid($row['m_id']);
                $rid = is_array($checkResId) ? $checkResId[0]['id'] : 0;
                return $menuMgr->updateRid($row['m_id'],$rid);
            }
        }
        return $res;
    }




	
} 