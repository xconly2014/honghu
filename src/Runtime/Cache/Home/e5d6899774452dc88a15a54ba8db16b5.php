<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>

    <title><?php echo ($seo_title); ?></title>
    <meta name="keywords" content="<?php echo ($seo_keyword); ?>">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

    <link rel="stylesheet" type="text/css" href="/branches/out_excel/Public/css/common.css">
    
    <link rel="stylesheet" type="text/css" href="/branches/out_excel/Public/css/login.css">

    <script type="text/javascript" src="/branches/out_excel/Public/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript">
        $().ready(function(){
        	$('button').click(function(){
        		if(!checkField()){
        			return false;
        		}
        		
        		var username = $.trim($("#account").val());
        		var password = $.trim($("#pwd").val());
        		
        		var remember = document.getElementById('remember');
        		if(remember.checked == true){
        			var auto = "on";
        		}
        		
			    var url="<?php echo U('Home/Login/ajaxLogin');?>";
			    
			    $.post(url,{username:username,password:password,type:'home',remember:auto},function(msg){
	 		        if(msg.status){
			            window.location.href = msg.data;
			        }else{
			            updateError(msg.data);
			            return false;
			        } 
			    },'json');
        	});
        	
        	function updateError(errorMsg){
        	    $("#error_info").text(errorMsg);
        	}
        	
        	function checkField(){
                $('#account').focus(function(){
                    $('#error_info').text('');
                });
                $('#pwd').focus(function(){
                    $('#error_info').text('');
                });
                
                $("#error_info").html("&nbsp;");
                var username = $.trim($("#account").val());
                var password = $.trim($("#pwd").val());

                if(username == '' ){
                    updateError('请填写账号（邮箱/手机号）');
                    return false;
                }

                if(password == ''){
                    updateError('请填写密码');
                    return false;
                }
                return true;
            }
        	
        	$('#account').blur(function(){
    	    	var username = $('#account').val();
    	    	if(username == ''){
    	    		$("#error_info").html("&nbsp;");
        	    	updateError('请填写账号（邮箱/手机号）');
    	    		return false;	    		
    	    	}
    	    });
        	
        	$('#pwd').blur(function(){
    	    	var password = $('#pwd').val();
    	    	if(password == ''){
    	    		$("#info").html("&nbsp;");
        	    	updateError('请填写密码');
    	    		return false;	    		
    	    	}
    	    });	  
        });
    </script>
</head>
<body>
<div class="row_container">
    <div class="top_bar">
        <a href="<?php echo U('/');?>">
            <img src="/branches/out_excel/Public/img/logo.png" alt="网站logo"/>
        </a>
    </div>
</div>
<div class="row_container">
    <div class="login_box">
        <a href="<?php echo U('Home/Help/index?id=24');?>">
            <img class="login_banner" src="/branches/out_excel/Public/img/one_buy.png" alt="登录展示图"/>
        </a>     
        <div class="login_form_container">
            <div class="title_bar">
                <center><img src="/branches/out_excel/Public/img/login_title.png" /></center>
            </div>
            <p class="input_field error_input">
                <label class="form_info"></label>
                <span id="error_info" style="color:#f00;">&nbsp;</span>
            </p>
            <p class="input_field">
                <label class="form_info"></label>
                <input type="text" id="account" name="account" placeholder="请填写您的轰轰虎账号">
            </p>
            <p class="input_field">
                <label class="form_info"></label>
                <input type="password" id="pwd" name="pwd" placeholder="请填写密码">
            </p>
            <div class="operation">
                <input type="checkbox" name="remember" id="remember"/>记住密码
                <a id="register_href" href="<?php echo U('Home/Register/reg_tel');?>">马上注册</a>
                <a id="pwd_find_href" href="<?php echo U('Home/User/forget_password_index');?>">忘记密码?</a>
            </div>
            <div class="third_logo">
                <ul>
                    <li class="ali_logo">
                        <a href="<?php echo U('Home/Login/ali_login');?>">&nbsp;支付宝</a>
                    </li>
                    <li class="wx_logo">
                        <a href="<?php echo U('Home/Login/wx_login');?>">&nbsp;微信</a>
                    </li>
                    <!-- <li class="qq_logo">
                        <a href="<?php echo U('Home/Login/qq_login');?>">&nbsp;QQ</a>
                    </li> -->
                 </ul>
                 <button type="submit">登&nbsp;&nbsp;录</button>
                 <div class="clear"></div>
            </div>
        </div>
    </div>
</div>

<div class="footer_container">
    <div class="row_container">
        <div class="part_margin footer">
            <div class="footer_top">
                <ul>
                    <li class="item_1">
                        <span>超时无货赔付</span>
                    </li>
                    <li class="item_2">
                        <span>官方正品实惠</span>
                    </li>
                    <li class="item_3">
                        <span>下单闪电快充</span>
                    </li>
                    <li class="item_4">
                        <span>7x24小时客服在线</span>
                    </li>
                </ul>
            </div>

            <div class="left_computer">
                <img src="/branches/out_excel/Public/img/footer/computer.png" alt="computer" width="110px" height="77px" />
            </div>
            <div class="footer_details">
                <a href="<?php echo U('Home/Help/index', array('id'=>7));?>">关于我们</a>
                <span>|</span>
                <a href="<?php echo U('Home/Help/index', array('id'=>9));?>">商务合作</a>
                <span>|</span>
                <a href="<?php echo U('Index/web_map');?>">网站地图</a>
                <span>|</span>
                <a href="<?php echo U('Help/index', array('id'=>4));?>">免责声明</a>
                <span>|</span>
                <a  href="tencent://message/?uin=4008062400">在线咨询</a>
                <span>|</span>
                <a href="<?php echo U('Suggest/suggest');?>">投诉与建议</a>
            </div>
            <div class="footer_introduce">
                    <span class="introduce">
                        广州鸿鹄网络科技有限公司 &nbsp; 版权所有Copyright © 2013 www.honghonghu.com 粤ICP备14011973号
                    </span>
            </div>
            <div class="footer_safe">
                <a href="http://www.cyberpolice.cn/wfjb/" target="_blank">
                    <img class="img_border" src="/branches/out_excel/Public/img/footer/01.jpg" alt="网络警察提醒您" title="网络警察提醒您" width="126px" height="47px"/>
                </a>
                <div style="display:inline-block;margin-right:auto;margin-left:auto;text-align: center;">
                    <script src="http://kxlogo.knet.cn/seallogo.dll?sn=e14041844010048148ul1a000000&size=0"></script>
                </div>
                <a>
                    <img src="/branches/out_excel/Public/img/footer/03.png" alt="安全联盟实名验证" title="安全联盟实名验证" width="126px" height="47px"  />
                </a>
                <a>
                    <img src="/branches/out_excel/Public/img/footer/04.jpg" alt="360可信网站" title="360可信网站" width="124px" height="47px"  />
                </a>
                <a>
                    <img class="img_border" src="/branches/out_excel/Public/img/footer/05.jpg" alt="中国文化部" title="中国文化部" width="126px" height="47px"  />
                </a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cspan id='cnzz_stat_icon_1253269026'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s9.cnzz.com/stat.php%3Fid%3D1253269026%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
    </script>
</div>

</body>
</html>