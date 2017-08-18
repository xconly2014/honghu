$(document).ready(function(){
	
	
   
     


	$.validator.addMethod("mobile", mobileFormat, "手机号码格式错误");
	$.validator.addMethod("checkPass", checkPass, "必须是字母和数字结合");
       
    
    /*$("#auth_identity").validate({
        onfocusout: function(element) {
            $(element).valid();
        },
        rules: {
        	tel_code:{
        		required:true,
        		remote:{
        			type:"post",
        			url : "ajax_check_code",
	           		 data:{
	           			code:function(){
	        				 return $("#tel_code").val();  //短信验证
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
	        				 return $("#code").val();//图形验证
	        			 }
	        		 },
	        		 dataType : "json",
        		}        		
        	}
        },
        messages:{
        	tel_code:{
        		required:'请填写短信验证码',
        		remote:'短信验证码有误或失效'
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
        
        submitHandler:function(form){
            form.submit();
        }
    });
    */
    
    
    
    
    
    
    $('#code').focus(function(){
    	$('#check_vcode_btn').css('opacity','0.5');
    	$('#check_vcode_btn').prop("disabled",true)
  });
    
	
    $('#code').blur(function(){
        var vcode = $('#code').val();
            $.post('ajax_check_vcode',{vcode:vcode},function(msg){
            	if(msg){
            		$('#check_vcode_btn').css('opacity','1');
            		$('#check_vcode_btn').removeAttr('disabled');
            	}else{
            		$('#check_vcode_btn').css('opacity','0.5');
            	}
            },'json');
     });
    
    
    //发送手机短信验证码
	$('#check_vcode_btn').click(function(){
		var $ticket = $(".value").text();
		var $type = 'tel';
		sleepSendBtn();
		$.post("ajax_send_code",{ticket:$ticket,type:$type},function(msg){
			mui.toast(msg.data);
		},'json');
	});	
    
    
	
	
	
	
	
	


function updateError(errorMsg){
    mui.toast(errorMsg);
}


function sleepSendBtn(){
	var time = 60;
    var interval = setInterval(function(){
        --time;
        if(time >= 0){
             $('#check_vcode_btn').val('重发'+time).css('opacity','0.5').prop("disabled",true);
        }
        if(time < 0){
            $('#check_vcode_btn').removeAttr('disabled').css('opacity','1').val('获取短信验证码');
            clearInterval(interval);
        }
    },1000); 
}




