<?php
namespace Admin\Controller;
use Admin\Model\CountOrderMgrModel;
use Admin\Model\GameMgrModel;
use Admin\Model\CZOrderIOSModel;
use Think\Controller;

class IndexController extends AuthController {
	
    public function index(){
        $title = "后台首页";
        $this->assign('title',$title);
        
        $this->assign('cur_page', CONTROLLER_NAME.'/'.ACTION_NAME);
        $this->display();
    }
    
    public function getPicture(){
        $year = I('post.year');
        $month = I('post.month');
        $countOrderMgr = new CountOrderMgrModel();
        $countOrderList = $countOrderMgr->getList($year,$month);
        $this->ajaxReturn($countOrderList);
    }
    
    public function outExcel(){
        $czOrderMgr = new CountOrderMgrModel();
        $data = $czOrderMgr->getCount();
            
        //导入PHPExcel类库，因为PHPExcel没有用命名空间，只能inport导入
        import("Org.Util.PHPExcel");
        import("Org.Util.PHPExcel.Writer.Excel5");
        import("Org.Util.PHPExcel.IOFactory.php");
        
        $time = strtotime(I('post.out_date')); 
        $month = date("Y-m",$time);
        $filename = "$month.xls";
        
        $headArr=array("日期","订单数","总金额");
        $this->getExcel($filename,$headArr,$data);       
    }
    
    private	function getExcel($fileName,$headArr,$data){
        //对数据进行检验
        if(empty($data) || !is_array($data)){
            die("请选择一个正确的日期");
        }
        //检查文件名
        if(empty($fileName)){
            exit;
        }
    
        //创建PHPExcel对象，注意，不能少了\
        $objPHPExcel = new \PHPExcel();
        $objProps = $objPHPExcel->getProperties();
        $objPHPExcel->setActiveSheetIndex(0);
        	
        //设置表头
        $key = ord("A");
        foreach($headArr as $v){
            $colum = chr($key);
            $objPHPExcel->getActiveSheet() ->setCellValue($colum.'1', $v);
            $key += 1;
        }
    
        $column = 2;
	    $objActSheet = $objPHPExcel->getActiveSheet();
	    foreach($data as $key => $rows){ //行写入
	        $span = ord("A");
	        foreach($rows as $keyName=>$value){// 列写入
	            $j = chr($span);
	            $objActSheet->setCellValue($j.$column, $value);
	            $span++;
	        }
	        $column++;
	    }
        
        //设置单元格宽度
        $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(12);
        $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(12);
        $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(15);
        

        $objActSheet->setCellValue('E4', '月订单总数：');
        $objActSheet->setCellValue('F4', '=SUM(B2:B'.$column .')');
        
        $objActSheet->setCellValue('E5', '月总金额：');
        $objActSheet->setCellValue('F5', '=SUM(C2:C'.$column .')');
        $fileName = iconv("utf-8", "gb2312", $fileName);
        //重命名表
        // $objPHPExcel->getActiveSheet()->setTitle('test');
        //设置活动单指数到第一个表,所以Excel打开这是第一个表
        ob_end_clean();//清除缓冲区,避免乱码
        header('Content-Type: application/vnd.ms-excel;charset:utf-8');
        header("Content-Disposition: attachment;filename=\"$fileName\"");
        header('Cache-Control: max-age=0');
    
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output'); //文件通过浏览器下载
        exit;
    }
    
    
}