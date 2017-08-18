<?php
namespace Admin\Model;


class SysConfigModel extends DataMgrBaseModel{
    private $table_name = "seo";

    public function addItem(){
        $title = I('post.meta_title');
        $keyword = I('post.meta_keyword');
        $description = I('post.meta_description');
        $url = I('post.url');

        $sql = "insert into $this->table_name(html_title, html_keyword, html_description,url)
                values('$title', '$keyword', '$description','$url')";
        return $this->execute($sql);
    }

    public function getItemList($url = ''){
        
        $sql = "select id from $this->table_name where url like '%$url%'";
        
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,15);
        
        $sql = "select * from $this->table_name where url like '%$url%' limit $Page->firstRow,$Page->listRows";

        $result['show'] = $Page->show();
        $result['data'] = $this->query($sql);
        
        return $result;
    }

    public function getItemInfo($itemId){
        $sql = "select * from $this->table_name where id=".$itemId;
        $result = $this->query($sql);
        return empty($result)? '': $result[0];
    }

    public function updateItemInfo($itemId){
        $title = I('post.meta_title');
        $keyword = I('post.meta_keyword');
        $description = I('post.meta_description');
        $url = I('post.url');

        $sql = "update $this->table_name set html_title='$title', html_keyword='$keyword',
               html_description='$description',url = '$url' where id=".$itemId;
        return $this->execute($sql);
    }

    public function delItem($itemId){
        $sql = "delete from $this->table_name where id=".$itemId;
        return $this->execute($sql);
    }
} 