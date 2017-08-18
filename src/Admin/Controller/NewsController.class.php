<?php
namespace Admin\Controller;
use Admin\Model\NewsMgrModel;

class NewsController extends AuthController{
    private static  $news_function ='news_list';
	
	public function news_list(){
		$title = "";
		if(IS_POST){
			$title = I('post.title');
		}
		
		$news = new NewsMgrModel();
		$newsList = $news->getList($title);
		$this->assign('news_list',$newsList['data']);
		$this->assign('show',$newsList['show']);
		
		$this->assign('title','公告列表');
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$news_function);
		$this->display();
	}
	
	public function write_news(){
		if(IS_POST){
			$news = new NewsMgrModel();
			$newsRes = $news->addNews();
			if($newsRes){
				return $this->success('添加成功',U('Admin/News/news_list'));
			}else{
				$this->error('添加失败',U('Admin/News/write_news'));
			}
		}
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$news_function);
		$this->assign('title',"游戏公告");
		$this->display();
	}
	
	public function edit_news($id){
	    $news = new NewsMgrModel();
	    if(IS_POST){
	        $newsRes = $news->updateNews($id);
	        if($newsRes){
	            $this->success('修改成功', U('Admin/News/news_list'));
	        }else{
	            $this->error('修改失败');
	        }
	    }else{
	        $news = new NewsMgrModel();
	        $newsRes = $news->editNews($id);
	        
	        $this->assign('title',"游戏公告");
	        $this->assign('newsRes',$newsRes);
	        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$news_function);
	        $this->display();
	        
	    }
	}
	
	public function del_news($id){
		$news = new NewsMgrModel();
		$news->deleteNews($id);
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$news_function);
		$this->success('删除成功',U('Admin/News/news_list'));
	}
}