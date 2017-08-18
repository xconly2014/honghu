var tel_form_option = {
		rules: {
        	tel:{
        		required:true,
                mobile:true,
        		remote:{
        			type:"post",
        			url : "ajax_check_tel",
	           		 data:{
	        			 tel:function(){
	        				 return $("#tel").val();
	        			 }
	        		 },
	        		 dataType : "json",
        		}
        	}
        },
        messages:{
        	tel:{
        		required:'请填写注册时的手机',
        		remote:'您填写的手机不存在'
        	}
        }
};

var auth_tel_option = {
		rules: {
        	tel_code:{
        		required:true,
        		minlength:6,
        		remote:{
        			type:"post",
        			url : "ajax_check_tel_code",
	           		 data:{
	           			tel_vcode:function(){
	        				 return $("#tel_code").val();
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
	        				 return $("#code").val();
	        			 }
	        		 },
	        		 dataType : "json",
        		}        		
        	}
        },
        messages:{
        	tel_code:{
        		required:'请填写短信验证码',
        		minlength:'短信验证码长度不少于六位',
        		remote:'短信验证码有误或失效'
        	},
        	vcode:{
        		required:'请填写图形验证码',
        		remote:'图形验证码有误'
        	}       	
        }
};

var updatePass_form_option = {
		rules: {
        	newpass:{
        		required:true,
        		minlength:6,
        		checkPass:true
        	},
        	rnewpass:{
            	required:true,
            	equalTo: "#newpass"
        	}
        },
        messages:{
        	newpass:{
        		required:'请填写新的密码',
        		minlength:'新密码长度不能小于6位',
        		checkPass:'必须字母和数字结合'
        	},
        	rnewpass:{
    			required:'请填写确认密码',
    			equalTo:'两个密码不一致'
    		}
    	}
};



function addMethod(){
    $.validator.addMethod("mobile", mobileFormat, "手机号码不足11位或者格式错误");
    $.validator.addMethod("unameFormat", userNameFormat, "6-18个字符内(仅限英文、数字和下划线)");
    $.validator.addMethod("checkPass", checkPass, "必须是字母和数字结合");
}
