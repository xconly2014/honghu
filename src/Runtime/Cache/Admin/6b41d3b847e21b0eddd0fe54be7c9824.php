<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <link rel="stylesheet" type="text/css" href="/branches/out_excel/Public/css/admin.css">

    <script type="text/javascript" src="/branches/out_excel/Public/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="/branches/out_excel/Public/js/Plugin/jqueryForm/jQuery_Validation.js"></script>
    <script type="text/javascript" src="/branches/out_excel/Public/js/menu.js"></script>
    <script type="text/javascript" src="/branches/out_excel/Public/js/admin.js"></script>
    <script src="/branches/out_excel/Public/js/Plugin/layer/layer.js"></script>

    <style>
        html body{
            background:#FAE3BF;
        }
    </style>

    
   <script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
   <script type="text/javascript" src="/branches/out_excel/Public/js/Plugin/jquery-multiselect/jquery-ui.min.js"></script>
   <script>
        $().ready(function () {
        $('#container').highcharts({
            title: {
                text: '每月订单量',
                x: -20 //center
            },
            xAxis: {
                title:{
                    text:'日期'
                },
                categories: ['1', '2', '3', '4', '5', '6','7', '8', '9', '10', '11', '12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31']
            },
            yAxis: {
                title: {
                    text: '充值订单数'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '单',
                shared:true,
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            credits:{
                enabled:true,// 默认值，如果想去掉版权信息，设置为false即可
                text:'轰轰虎',  // 显示的文字
                href:'http://www.honghonghu.com',   // 链接地址
            },
            series: []
        });
        
        var myDate = new Date();
        var year = myDate.getFullYear(); 
        var month = myDate.getMonth();
        getPicture(year,month+1);//初始化数据

        //选择不同月份获取到的数据图
        $('#button').click(function(){
            var year = $('#year').val();
            var month = $('#month').val();
            getPicture(year,month);
        });

        //日历插件    
        $( "#datepicker" ).datepicker({
            inline: true,
            dateFormat: 'yy-mm-dd',//日期格式 
            monthNames: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],  
            dayNamesMin: ['日','一','二','三','四','五','六'], 
            showMonthAfterYear:true,//是否把月放在年的后面 
            yearSuffix: '年'
        });
        
    });

    var index = Array();
    function getPicture(year,month){
            if(index[year+''+month]){
                return;
            }
            $.post("<?php echo U('Admin/Index/getPicture');?>",{"year":year,"month":month},function(arr){
                if(arr){
                    var chart = $('#container').highcharts();                
                    var count = arr['count'];
                    var sum = arr['sum'];
                    var data = '';

                    for(var p in count){
                        data = count[p].split(',');

                        var length = data.length;

                        for(var i=0; i< length; i++){
                            data[i] = parseInt(data[i]);
                        }

                        chart.addSeries({
                            name:year+'年'+p+'月 ( '+sum[p]+'单 )',
                            data: data
                        });                   
                        index[year+''+month] = true;
                    }
                }
                   
            },"json");
        }    

        //提交前检查日期是否选择的函数
        function checkDate(){
            var date = $('#datepicker').val();
            if(!date){
                alert('请选择一个日期');
                return false;
            }
        }        
   </script>

    
    <link rel="stylesheet" href="/branches/out_excel/Public/css/jquery-ui.css" />

    <title>轰轰虎商城后台</title>
</head>

<body>

    <div class="top_bar">
        <div class="logout">
            <a href="<?php echo U('Admin/Login/logout');?>">退出</a>
        </div>
    </div>



    <div class="wrap">
        <div class="menu_bar_container">
            <div class="menu_bar">
                <div class="menu_container">
                    <div class="box">
                        <h1>
                            <img src="/branches/out_excel/Public/img/menu/index.png"/>
                            <a class="box_title <?php if($cur_page == 'Index/index'): ?>active<?php endif; ?>" href="<?php echo U('Admin/Index/index');?>">首页
                            </a></h>
                    </div>
                    <?php $menu = getMenu(); ?>
                    <?php if(is_array($menu)): foreach($menu as $module_title=>$module_name): ?><div class="box">
                        <h1><img src="/branches/out_excel/Public/img/menu/<?php echo ($module_name["img"]); ?>" /><?php echo ($module_name["title"]); ?></h1>
                        <div class="text">
                        <?php if(is_array($module_name["data"])): foreach($module_name["data"] as $key=>$operation_name): ?><li>
                                <a class="<?php if($cur_page == $operation_name['function']): ?>active<?php endif; ?>" href="<?php echo ($operation_name["name"]); ?>"><?php echo ($operation_name["title"]); ?></a>
                            </li><?php endforeach; endif; ?> 
                        </div>
                    </div><?php endforeach; endif; ?>
                </div>
            </div>
        </div>

        
    <div class="content_container">
        <div class="content">
            <li class="input_field required">
                <select name="year" id="year">
                    <option value="2014">2014</option>
                    <option value="2015" selected>2015</option>
                    <option value="2016">2016</option>
                </select>
            </li>

            <li class="input_field required">
                <select name="year" id="month">
                    <?php $__FOR_START_20252__=1;$__FOR_END_20252__=13;for($i=$__FOR_START_20252__;$i < $__FOR_END_20252__;$i+=1){ ?><option value="<?php echo ($i); ?>"><?php echo ($i); ?></option><?php } ?>
                </select>
            </li>
            <li class="input_field required">
                <button id="button" class="autocompare">获取曲线图</button>
            </li>
            <div id="container" style="min-width:800px;height:400px;"></div>

            <form id="out_excel" action="<?php echo U('Admin/Index/outExcel');?>" method="post" onsubmit="return checkDate();">
                <li class="input_field" style="display:inline;padding-top:50px;">
                    <input type="text" id="datepicker" name="out_date"></li>
                <li class="input_field" style="display:inline;">
                    <button id="excel_button" >导出Excel</button>
                </li>
            </form>
        </div>
    </div>

    </div>