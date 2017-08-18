<?php
namespace Admin\Model;

class BannerMgrModel extends DataMgrBaseModel{
    private $tableName = 'banner';
    
    public function getList(){
         $sql = "select id, href, img, title, priority from $this->tableName";
         return $this->query($sql);
    }
    
    public function addBanner($img){
         $title = I('post.title');
         $href= I('post.href');
         $priority = I('post.priority');
         
         $sql = "insert into $this->tableName (title,href,img, priority) value ('$title','$href','$img', $priority)";
         return $this->execute($sql);
    }
    
    public function deleteBanner($id){
        $bannerInfo = $this->getRow($id);
        $file = './Public/upload/banner/'.$bannerInfo['img'];
        if(file_exists($file)){
            unlink($file);
        }
        $sql = "delete from $this->tableName where id='$id'";
        return $this->execute($sql);
    }
    
    public function editBanner($id){
        $title = I('post.title');
        $href = I('post.href');
        $priority = I('post.priority');
        
        $sql = "update $this->tableName set title='$title',href='$href',priority=$priority where id=$id";
        return $this->execute($sql);
    }
    
    public function getRow($id){
        $sql = "select id, href, img, title, priority from $this->tableName where id = '$id'";
        $result = $this->query($sql);
        return empty($result) ? '' : $result[0];
    }
}