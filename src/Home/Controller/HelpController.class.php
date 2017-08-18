<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-4-20
 * Time: 上午9:26
 */

namespace Home\Controller;

use Home\Model\HelpMgrModel;
use Utils\ConstantUtils;

class HelpController extends DetectorController{

    public function help_list(){
        $help = new HelpMgrModel();
        
        $helpList = $help->getList();

        $this->assign('help_list',$helpList);
        $this->theme($this->theme)->display();
    }
    
    public function index(){
        $help = new HelpMgrModel();
        $id = I('get.id');
        if(empty($id)){
            $id = ConstantUtils::$DEFAULT_ARTICLE_ID;
        }
        $helpInfo = $help->getInfo($id);
        $helpList = $help->getList();
        $this->assign('help_list',$helpList);
        $this->assign('cur_page',$helpInfo['id']);
        $this->assign('help_info',$helpInfo);

        $seoInfo = array(
            ConstantUtils::$SEO_TITLE_KEY=>$helpInfo['name'].ConstantUtils::$SEO_HELP_BASE."_".ConstantUtils::$SITE_KEYWORD,
            ConstantUtils::$SEO_KEYWORD_KEY=>$helpInfo['name'].ConstantUtils::$SEO_HELP_BASE."_".ConstantUtils::$SITE_KEYWORD
        );
        $this->theme($this->theme)->display('', $seoInfo);
    }

} 