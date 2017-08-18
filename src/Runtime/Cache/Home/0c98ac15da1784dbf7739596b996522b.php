<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <meta name="applicable-device"content="pc,mobile">
    <meta name="baidu-site-verification" content="exgxIqEXav" />
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=52006351" charset="UTF-8"></script>
    <title><?php echo ($seo_title); ?></title>
    <meta name="keywords" content="<?php echo ($seo_keyword); ?>">
    
    <link href="/branches/out_excel/Public/css/mb/mui.min.css" rel="stylesheet"/>
    <link href="/branches/out_excel/Public/css/mb_index.css" rel="stylesheet"/>
    
    <style>
        .mb_footer{
	        position:relative;
        }
    </style>


    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.8.2/jquery.min.js"></script>
    <script src="/branches/out_excel/Public/js/mb/mui.min.js"></script>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        $().ready(function(){
           $('#cnzz_stat_icon_1253269026').find("img").remove();
        });
    </script>
    
    <script type="text/javascript">
        var _speedMark = new Date();
        
        $().ready(function(){
            //点击搜索时，如果为空则获得焦点
            $('#search_submit').click(function(){
                var name = $('#search_text').val();
                if(name==''){
                    $('#search_text').focus();
                    return false;
                }
            });

            $('.mui-slider-indicator .mui-indicator:first').addClass('mui-active');
        });
    </script>


</head>
<body>

<?php if($type != 'index'): ?><header class="mui-bar mui-bar-nav">
        <a href="javascript:history.back()" class="mui-icon mui-icon-left-nav mui-pull-left"></a>
        <a href="<?php echo U('/');?>" class="mui-icon mui-icon-home mui-pull-right"></a>
        
             <h1 class="mui-title">当前页面</h1>
        
    </header><?php endif; ?>

<!-- 内容页面 -->
<div id="mui_content" class="mui-content">
    
<div class="main_container" style="padding-bottom:0;line-height: 0px;">
    <div class="nav-bar">
        <div class="logo_bar">
            <img src="/branches/out_excel/Public/img/honghonghulogo.png" alt="轰轰虎首页"/>
        </div>
        <div class="login_bar">
            <?php if(is_login()): ?><a href="<?php echo U('Home/User/info');?>">
                    <img src="/branches/out_excel/Public/img/mb_index/account_center.png" alt="个人中心"/>个人中心
                </a>
                <a href="<?php echo U('Home/Login/logout');?>">
                    <img src="/branches/out_excel/Public/img/mb_index/logout.png" alt="退出登录"/>退出
                </a>
            <?php else: ?>
                <a href="<?php echo U('Home/Login/index');?>">
                    <img src="/branches/out_excel/Public/img/mb_index/login.png" alt="登录"/>登录
                </a>
                <a href="<?php echo U('Home/Register/reg_tel');?>">
                    <img src="/branches/out_excel/Public/img/mb_index/register.png" alt="注册"/>注册
                </a><?php endif; ?>
            <a href="#search" class="search">
                <img src="/branches/out_excel/Public/img/mb_index/search.png" alt="搜索游戏" class="search" />搜索
            </a>
        </div>
    </div>

    <div id="slider" class="mui-slider">
        <div class="mui-slider-group">
            <?php if(is_array($banners)): $i = 0; $__LIST__ = $banners;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$one_item): $mod = ($i % 2 );++$i;?><div class="mui-slider-item">
                    <a href="<?php echo ($one_item["href"]); ?>">
                        <img src="/branches/out_excel/Public/upload/banner/<?php echo ($one_item["img"]); ?>" alt="<?php echo ($one_item["title"]); ?>"/>
                    </a>
                </div><?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
        <div class="mui-slider-indicator">
            <?php if(is_array($banners)): $i = 0; $__LIST__ = $banners;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$one_item): $mod = ($i % 2 );++$i;?><div class="mui-indicator"></div><?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
    </div>

    <div  class="nva">
        <div class="left">
            <div>
                <a class="item" href="<?php echo U('Home/TradeCenter/index',array('type'=>2));?>">
                    <img src="/branches/out_excel/Public/img/mb_index/account_trade.png" alt="账号交易">
                </a>
            </div>

            <div>
                <a class="item" href="<?php echo U('Home/Family/family_index');?>">
                    <img src="/branches/out_excel/Public/img/mb_index/family.png" alt="名人堂">
                </a>
            </div>
        </div>
        <div class="center">
            <div>
                <!--<a class="item" href="<?php echo U('Home/CZIOS/index');?>">-->
                <a class="item" href="<?php echo U('Home/CZIOS/cz_introduce');?>">
                    <img src="/branches/out_excel/Public/img/mb_index/cz_ios.png" alt="苹果充值">
                </a>
            </div>
        </div>
        <div class="right">
            <div>                
                <a class="item" href="<?php echo U('Home/TradeCenter/index');?>">
                    <img src="/branches/out_excel/Public/img/mb_index/train.png" alt="代练中心">
                </a>
            </div>
    
            <div>
                <a class="item" href="<?php echo U('Home/TrafficOrder/mb_flow_index');?>">
                    <img src="/branches/out_excel/Public/img/mb_index/4g_flow.png" alt="4G流量">
                </a>
            </div>
            
        </div>

        <div class="bottom_left">
            <a class="item" href="<?php echo U('Home/SCH/introduce_sch');?>">
                <img src="/branches/out_excel/Public/img/mb_index/sch.png" alt="首充号">
            </a>
        </div>
        <div class="bottom_right">                
            <a class="item" href="<?php echo U('Home/Help/help_list');?>">
                <img src="/branches/out_excel/Public/img/mb_index/help.png" alt="帮助中心">
            </a>
        </div>
    </div>
    <form action="<?php echo U('Home/Index/mb_search');?>" method="post">
        
        <input id="search_text" type="text" name="name"   placeholder="输入要搜索的游戏"><a name="search" id="search"></a><button id="search_submit" >
            <span class="mui-icon mui-icon-search"style="font-weight:bold;font-size:26px;"></span>      
        </button>
        
    </form>

</div>

    <div class="mb_footer">
        <div class="footer_container">
            <div class="index-tel">
                <span class="mui-icon mui-icon-phone"></span>
            <span>24小时客服电话:400-806-2400</span>
            </div>
            
            <div class="index-qq" style="margin-top:10px;">
                <script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzkzODAwNzI2M18yNjE4OTZfNDAwODA2MjQwMF8"></script>
            </div>
            <div class="suggest">
                <a href="<?php echo U('Home/Suggest/suggest');?>">
                    <span class="mui-icon mui-icon-compose"></span>
                    建议反馈
                </a>
            </div>

            <script type="text/javascript">
                var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
                document.write(unescape("%3Cspan id='cnzz_stat_icon_1253269026'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s9.cnzz.com/stat.php%3Fid%3D1253269026%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
            </script>
            <script type="text/javascript">
                var _bdhmProtocol = (("https:" == document.location.protocol) ? "https://" : "http://");
                document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F77eddee7c086e43698c007b8bcbee395' type='text/javascript'%3E%3C/script%3E"))
            </script>
        </div>        
    </div>
</div>
    
    
</body>
</html>