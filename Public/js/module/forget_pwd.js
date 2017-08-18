
$().ready(function(){

	addMethod();
	$("#tel_form").validate(window.tel_form_option);
	$("#auth_tel").validate(window.auth_tel_option);
	$("#updatePass_form").validate(window.updatePass_form_option);
	
	
	$(".forget_pwd_title > a").each(function(index){
		var aNode = $(this);
		$(this).click(function(){
			$('a.active').removeClass('active');
			$('.show').removeClass('show');
			$('.forget_pad_content > div').eq(index).addClass('show');
			aNode.addClass('active');
		});
	});
	
	
	//验证邮箱	
    $(".email_form").validate({
        onfocusout: function(element) {
            $(element).valid();
        },
        rules: {
        	email:{
        		required:true,
        		email:true,
        		remote:{
        			type:"post",
        			url : "ajax_check_email",
	           		 data:{
	        			 email:function(){
	        				 return $("#email").val();
	        			 }
	        		 },
	        		 dataType : "json",
        		}
        	}
        },

        messages:{
        	email:{
        		required:'请填写注册时的邮箱',
        		email:'您填写的邮箱格式有误',
        		remote:'您填写的邮箱不存在'
        	}
        },
        errorPlacement: function(error, element) {
            error.appendTo(element.parent());
            error.siblings("span").remove();
        },
        errorElement:"span",
        success: function(span) {
            span.attr("class","success");
        },
        submitHandler:function(form){
            form.submit();
        }
    });
    

    
    
  //验证手机
    $.validator.addMethod("mobile", mobileFormat, "手机号码格式错误");

    
    
    
    //发送邮件验证码
	$('.auth_email .abut').click(function(){
		var $ticket = $(".auth_email .form_value").text();
		var $type = 'email';
		sleepSendBtn();
		$.post("ajax_send_code",{ticket:$ticket,type:$type},function(msg){
			if(msg.status == 'true'){
	            $('.vcode').next().remove();
	            $('.vcode').after("<span id='vcode-error' class='infosuccess'>"+msg.data+"</span>");
			}else{
	            $('.vcode').next().remove();
	            $('.vcode').after("<span id='vcode-error' class='infoerror'>"+msg.data+"</span>");
			}
		},'json');
	});

    //发送手机短信验证码
	$('#auth_tel .abut').click(function(){
		var $ticket = $("#auth_tel .form_value").text();
		var $type = 'tel';
		sleepSendBtn();
		$.post("ajax_send_code",{ticket:$ticket,type:$type},function(msg){
			if(msg.status == 'true'){
	            $('.vcode').next().remove();
	            $('.vcode').after("<span id='vcode-error' class='infosuccess'>"+msg.data+"</span>");
			}else{
	            $('.vcode').next().remove();
	            $('.vcode').after("<span id='vcode-error' class='infoserror'>"+msg.data+"</span>");
			}
		},'json');
	});	
	
    $('.vcode').focus(function(){
    	$('.vcode').next().remove();
    	$('.abut').css('opacity','0.5');
    	$('.abut').prop("disabled",true)
  });
    
	
    $('.vcode').blur(function(){
        var $vcode = $('.vcode').val();
            $.post('ajax_check_vcode',{vcode:$vcode},function(msg){
            	if(msg){
            		$('.abut').css('opacity','1');
            		$('.abut').removeAttr('disabled');
            	}else{
            		$('.abut').css('opacity','0.5');
            	}
            },'json');
     });
	
	
    
    
    //验证身份之邮箱auth_email
    $(".auth_email").validate({
        onfocusout: function(element) {
            $(element).valid();
        },
        rules: {
        	email_code:{
        		required:true,
        		remote:{
        			type:"post",
        			url : "ajax_check_tel_code",
	           		 data:{
	           			tel_vcode:function(){
	        				 return $("#email_code").val();
	        			 }
	        		 },
	        		 dataType : "json",
        		}
        	},
        	vcode:{
        		required:true,
        		remote:{
        			type:"post",
        			url : "ajax_check_vcode",
	           		 data:{
	           			vcode:function(){
	        				 return $(".vcode").val();
	        			 }
	        		 },
	        		 dataType : "json",
        		}        		
        	}
        },
        messages:{
        	email_code:{
        		required:'请填写邮箱验证码',
        		remote:'邮箱验证码有误或失效'
        	},
        	vcode:{
        		required:'请填写图形验证码',
        		remote:'图形验证码有误'
        	}        	
        },
        errorPlacement: function(error, element) {
            error.appendTo(element.parent());
            error.siblings("span").remove();
        },
        errorElement:"span",
        success: function(span) {
            span.attr("class","success");
        },
        submitHandler:function(form){
            form.submit();
        }
    });
    
    
    
    //重置密码页updatePass_form
	 $.validator.addMethod("combination", function(value, element) {
			var combination = /^(?![^a-zA-Z]+$)(?!\D+$)/;
			return this.optional(element) || (combination.test(value)); 
	}, "必须是字母和数字结合");
  	 
 	
    
    function sleepSendBtn(){
    	var time = 60;
        var interval = setInterval(function(){
            --time;
            if(time >= 0){
            	 $('.vcode').prop("disabled",true);
                 $('.abut').val('重发'+time).css('opacity','0.5').prop("disabled",true);
            }
            if(time < 0){
            	$('.vcode').removeAttr("disabled");
                $('.abut').removeAttr('disabled').css('opacity','1').val('发 送');
                clearInterval(interval);
            }
        },1000); 
    }
});