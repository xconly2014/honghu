<?php
namespace Admin\Controller;
use Think\Controller;
use Admin\Model\CategoryMgrModel;
use Admin\Model\ArticleMgrModel;

class HelpController extends AuthController{
    private static  $help_function ='category';
    
	public function category(){
		$category = new CategoryMgrModel();
		$categoryRes = $category->getCategory();
		$this->assign('categoryRes',$categoryRes);
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$help_function);
		$this->display();
	}
	public function categoryInsert(){
		if(IS_POST){
			$category = new CategoryMgrModel();
			$categoryRes = $category->insertCategory();
			if($categoryRes){
				$this->success('添加成功', U('Admin/Help/category'));
			}else{
				$this->error('添加失败');
			}
		}else{
		    $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$help_function);
			$this->display();
		}
	}
	
	public function categoryDel(){
		$category = new CategoryMgrModel();
		$categoryRes = $category->delCategory();
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$help_function);
		if($categoryRes){
			$this->success('添加成功', U('Admin/Help/category'));
		}else{
			$this->error('删除目录失败');
		}
	}
	
	public function categoryEdit(){
		if(IS_POST){
			$category = new CategoryMgrModel();
			$categoryRes = $category->updateCategory();
			if($categoryRes){
				$this->success('修改成功', U('Admin/Help/category'));
			}else{
				$this->error('修改失败');
			}
		}else{
		    
			$category = new CategoryMgrModel();
			$categoryRes = $category->editCategory();
			$this->assign('categoryRes',$categoryRes);
			$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$help_function);
			$this->display();
		}
	}
	
	public function article(){
		$help_category_id = $_GET['help_category_id'];
		$article = new ArticleMgrModel();
		$articleRes = $article->getArticle();
		$this->assign('help_category_id',$help_category_id);
		$this->assign('articleRes',$articleRes);
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$help_function);
		$this->display();
	}

	public function articleInsert(){
		$help_category_id = $_GET['help_category_id'];

		if(IS_POST){
			$article = new ArticleMgrModel();
			$articleRes = $article->insertArticle();
			if($articleRes){
				$this->success('添加成功', U('Admin/Help/article', array("help_category_id"=>$help_category_id)));
			}else{
				$this->error('添加失败');
			}
		}else{

			$this->assign('help_category_id',$help_category_id);
			$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$help_function);
			$this->display();
		}
	}
		
	public function articleDel(){
		$id = $_GET['id'];
		$help_category_id = $_GET['help_category_id'];

		$article = new ArticleMgrModel();
		$articleRes = $article->delArticle($id);
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$help_function);
		if($articleRes){
			$this->success('删除文章成功', U('Admin/Help/article', array("help_category_id"=>$help_category_id)));
		}else{
			$this->error('删除文章失败');
		}
	}

    public function articleEdit(){
		$id = $_GET['id'];
		$help_category_id = $_GET['help_category_id'];

		if(IS_POST){
			$article = new ArticleMgrModel();
			$articleRes = $article->updateArticle($id);
			if($articleRes){
				$this->success('修改成功', U('Admin/Help/article', array("help_category_id"=>$help_category_id)));
			}else{
				$this->error('修改失败');
			}
		}else{
			$article = new ArticleMgrModel();
			$articleRes = $article->editArticle($id);

			$this->assign('articleRes',$articleRes);
			$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$help_function);
			$this->display();
		}
	}
}