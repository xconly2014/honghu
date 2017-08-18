<?php
namespace Admin\Model;

class TagLinkMgrModel extends DataMgrBaseModel{
    private $tableName = 'order_tag_link';
    
    public function getList($orderId){
        
        $sql = "select id, name,bg, order_id from $this->tableName where order_id='$orderId'";
        $result = $this->query($sql);
        
        return empty($result)?'':$result;
    }
    
    public function tagLinkInsert(){
        $order_id = I('post.order_id');
        $tag_id = I('post.tag_id');
        $tagMgr = new OrderTagMgrModel();
        $tagInfo = $tagMgr->getTagRow($tag_id);
        $name = $tagInfo['name'];
        $bg = $tagInfo['bg'];
        
        $sql = "insert into $this->tableName (order_id,name,bg) value ('$order_id','$name','$bg')";
        return $this->execute($sql);
    }
    
    public function tagLinkDel(){
        $id = I('post.tag_link_id');
        $sql = "delete from $this->tableName where id='$id'";
        return $this->execute($sql);
    }
}