var trade_center_option = {
		rules: {
        	platform: "required",
        	operator: "required",
        	game_account:"required",
        	password:"required",
        	game_qufu:"required",
        	juese:"required",
        	contact:{
        		required:true,
        		mobile:true
        	},
        	zhiye:"required",
        	level: "required",
        	comment:"required"
        },

        messages:{
        	platform:"请选择系统平台",
        	operator:"请选择客户端",
        	game_account:"请填写游戏账号",
        	password:"请填写游戏密码",
        	game_qufu:"请填写游戏区服",
        	juese:"请填写游戏角色",
        	contact:{
        		required:"请填写手机号码",
        		mobile:"手机号码格式有误"
        	},
        	zhiye:"请填写游戏职业",
        	level:"请填写游戏等级",
        	game_account:"请填写游戏账号",
        	comment:"请填写备注"
        }
};

var account_trade_option = {
		rules: {
        	title: "required",
        	jiaqian:{
                required:true,
                min:10,
                range:[0,999999],
                digits:true
            },
            time:{
                required:true,
                range:[1,30],
                digits:true
            },
            details:"required",
            xieyi:"required"
        },

        messages:{
        	title:"请填写商品标题",
        	jiaqian:{
                required:"请填写价钱",
                min:"价格不能少于10元",
                range:"价钱为非零整数",
                digits:"价钱为非零整数"
            },
            time:{
                required:"请填写商品有效时间",
                range:"时间应为1到30天",
                digits:"天数应为整数"
            },
            details:"请填写交易详情",
            xieyi:"请同意轰轰虎用户服务协议"
        },
        submitHandler:function(form){
            var num = $('i').html();
            if(num < 1){
                return;
            }else{
                form.submit();
            }
        }
};

var account_trade_verify_option = {
    rules: {
        tel:{
            required:true,
            mobile:true
        },
        qq_code:"required"
    },
    messages:{
        tel:{
            required:"请填写您的手机号码",
            mobile:"请填写正确的手机号"
        },
        qq_code:"请填天您的QQ号码"
    }
};




function addMethod(){
    $.validator.addMethod("mobile", mobileFormat, "手机号码不足11位或者格式错误");
    $.validator.addMethod("unameFormat", userNameFormat, "6-18个字符内(仅限英文、数字和下划线)");
    $.validator.addMethod("checkPass", checkPass, "必须是字母和数字结合");
}

$().ready(function(){
	if($("#uploadImages").length > 0 ){
        $("#uploadImages").kinFormUpload({
            length:5,
            zIndex:2,
            ext:'jpg,jpeg,png,gif'
        });
    }
	
     $('#jiaqian').blur(function(){
         $('#security').text("");
         var money = parseInt($(this).val());
         if(money && money >= 10){
             $('#security').text(Math.floor(money*0.2));
         }

     });

});
