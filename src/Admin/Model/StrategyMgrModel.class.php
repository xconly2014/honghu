<?php

namespace Admin\Model;

class StrategyMgrModel extends DataMgrBaseModel{
	private $tableName = "game_strategy";
	
	/**
	 * 添加数据
	 * @return \Think\mixed
	 */
    public function addItem() {
    	//接收用户提交的数据
    	$created_date = date("Y-m-d H:i:s",time());
    	$title = I('post.title');
    	$game_id = intval(I('post.game_id'));
    	$content = I('post.content');
    	$scan_num = '0';
    	$meta_desc= I('post.meta_desc');
    	$meta_keyword = I('post.meta_keyword');
    	$meta_title = I('post.meta_title');	
    	$author_id = get_uid();
		 $sql = "insert into $this->tableName (created_date,title, game_id,content,scan_num,meta_desc,meta_keyword,meta_title,author_id)
                values('$created_date','$title', '$game_id','$content','$scan_num','$meta_desc','$meta_keyword','$meta_title','$author_id')";
		return $this->execute($sql);
    }
    
    
    /**
     * 获取数据列表
     */
    public function getItemList($title=""){
        $sql = "select S.id, S.title, S.created_date, U.nickname from $this->tableName S,user U where S.author_id=U.id and (S.title like '%$title%' or U.nickname like '%$title%')";
        $res = $this->query($sql);
        $count = count($res);
    	$Page = new \Think\Page($count, 10);
    	$show = $Page->show();

        $sql =   $sql." order by S.id desc limit $Page->firstRow,$Page->listRows";    		
    	$result = $this->query($sql);
    	
    	$info['data'] = $result;
    	$info['show'] = $show;
    	return $info;	
    }
    
  	/**
  	 * 获取要修改的数据
  	 * @param unknown $editId
  	 * @return \Think\mixed
  	 */
    public function getItemRow($editId){
    	$id = $editId;
    	$sql = "select title,content,scan_num,meta_desc,meta_keyword,meta_title,game_id from $this->tableName where id = '$id'";
    	return $this->query($sql);
    }
	
    
    /**
     * 修改处理数据
     * @return \Think\false
     */
    public function updateItem($id){
    	$title = I('post.title');
    	$content = I('post.content');
    	$meta_desc= I('post.meta_desc');
    	$meta_keyword = I('post.meta_keyword');
    	$meta_title = I('post.meta_title');
    	$game_id = I('post.game_id');
    	$author_id = get_uid();
		$sql = "update $this->tableName set title='$title',content='$content',meta_desc='$meta_desc',meta_keyword='$meta_keyword',meta_title='$meta_title',game_id='$game_id',author_id='$author_id' where id='$id'";
        return $this->execute($sql);
    }
    
    
    /**
     * 处理删除数据
     * @param array $id
     */
    public  function deleteItem($id){
    	$sql = "delete from $this->tableName where id='$id'";
    	return $this->execute($sql);
    }
    
    /**
     * 统计总查询的条数
     * @return \Think\mixed
     */
    public  function counts($title=""){
    	$sql = "select count(id) as C from $this->tableName";
        if($title != ""){
            $sql = $sql. " where title like '%$title%'";
        }
    	return $this->query($sql);
    }
    
} 