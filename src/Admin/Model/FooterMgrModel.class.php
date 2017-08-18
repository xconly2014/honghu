<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-3-17
 * Time: 上午11:48
 */

namespace Admin\Model;


class FooterMgrModel extends DataMgrBaseModel{
    private $parentTable = 'footer_col';
    private $sonTable = 'footer_col_item';

    public function getSonList(){
        $footer_col_id = $_GET['footer_col_id'];
        $sql ="select * from $this->sonTable where footer_col_id=$footer_col_id order by 'order'";
        return $this -> query($sql);
    }

    public function insertFooterList(){


    }

    public function editFooterList(){
        $id = $_GET['id'];
        $sql = "select * from $this->sonTable where id=$id";
        return $this -> query($sql);
    }

    public function updateFooterList(){
        $id = $_GET['id'];

    }

    public function delFooterList(){
        $id = $_GET['id'];
        $sql = "delete from $this->sonTable where id=$id";
        return $this->execute($sql);
    }








//
    public function getAllListItem(){
        $sql = "select * from $this->parentTable";
        return $this->query($sql);
    }

    public function getListItemName($id){
        $row = $this->getListItem($id);
        return empty($result)? 0:$row['name'];
    }

    public function getListItem($id){
        $sql = "select * from $this->parentTable where id=$id";
        $result = $this->query($sql);
        return empty($result)? 0:$result[0];
    }

    public function insertListItem($image_path=''){
        $name = trim($_POST['name']);
        $priority = intval($_POST['priority']);
        $image_path = $image_path;
        $sql = "insert into $this->parentTable(name,priority,image_path)value('$name','$priority','$image_path')";
        return $this->execute($sql);
    }

    public function updateListItem($id){
        $name = trim($_POST['name']);
        $priority = intval($_POST['priority']);

        $sql = "update $this->parentTable set name='$name',priority='$priority' where id=$id";
        return $this -> execute($sql);
    }

    public function delListItem($id){
        $sql = "delete from $this->parentTable where id=$id";
        dump($sql);
        return $this->execute($sql);
    }

    public function getAllListItemCol(){
        $sql = "select * from $this->sonTable";
        $result = $this->query($sql);
        foreach($result as &$row){
            $row['footer_item_name'] = $this->getListItemName($row['footer_col_id']);
        }
        return $result;
    }

    public function insertItemCol($itemId){
        $name = trim($_POST['name']);
        $href = trim($_POST['href_value']);
        $priority = $_POST['priority'];
        $sql = "insert into $this->sonTable(name,href,footer_col_id, priority)value('$name', '$href', $itemId, '$priority')";
        return $this->execute($sql);
    }

    public function getItemCol($colId){
        $sql = "select * from $this->sonTable where id=".$colId;
        $result = $this->query($sql);

        return empty($result)? "":$result[0];
    }

    public function updateItemCol($colId){
        $name = trim($_POST['name']);
        $href = trim($_POST['href_value']);
        $priority = $_POST['priority'];
        $sql = "update $this->sonTable set name='$name',href='$href', priority='$priority' where id=".$colId;
        return $this->execute($sql);
    }

    public function delItemCol($colId){
        $sql = "delete from $this->sonTable where id=".$colId;
        $this->execute($sql);
    }




} 