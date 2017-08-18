<?php
namespace Admin\Model;
class FamilyLogoMgrModel extends DataMgrBaseModel{
    private $tableName = 'organization_logo';
    
    public function getList(){
        $sql = "select id, pic_name, name, is_used from $this->tableName order by is_used asc";
        return $this->query($sql);
    }
    
    public function addLogo($pic_name){
        $name = I('post.name');
        
        $sql = "insert into $this->tableName (pic_name,name,is_used) value ('$pic_name','$name','0')";
        return $this->execute($sql);
    }
    
    public function deleteLogo($id){
        $logoInfo = $this->getRow($id);
        $file = './Public/img/family/logo/'.$logoInfo['pic_name'];
        if(file_exists($file)){
            unlink($file);
        }
        $sql = "delete from $this->tableName where id='$id'";
        return $this->execute($sql);
    }
    
    public function getRow($id){
        $sql = "select id, pic_name,name from $this->tableName where id = '$id'";
        $result = $this->query($sql);
        return empty($result) ? '' : $result[0];
    }
}