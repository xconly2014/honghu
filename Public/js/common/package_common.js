var publish_option = {
    rules: {
        title: "required",
        platform: "required",
        operator_id:"required",
        qufu: "required",
        details:"required",
        spend_day:"required",
        cz_provided:"required",
        security_price:{
               required:true,
               range:[1,99999999] 
        },
        price:{
               required:true,
               range:[1,99999999] 
        },
        contact_way:{
                required:true,
                mobile:true
        },
        xieyi:"required"
    },

    messages:{
        title:"套餐标题不能为空",
        platform:"请选择游戏平台",
        operator_id:"请选择客户端",
        qufu:"游戏区服不能为空",
        details:"套餐详情不能为空",
        spend_day:"代练耗时不能为空",
        cz_provided:"请选择是否需要充值支持",
        security_price:{
               required:"保证金不能为空",
               range:$.validator.format("请输入非0数字")
        },
        price:{
               required:"价格不能为空",
               range:$.validator.format("请输入非0数字")
        },
        contact_way:{
               required:"手机号不能为空",
               mobile:"手机号码格式错误"
        },
        xieyi:"请同意轰轰虎用户服务协议"
    }
};

var buy_package_option= {
    rules: {
        platform: "required",
        operator_id:"required",
        account:"required",
        password:"required",
        qufu: "required",
        role:"required",
        role_details:"required",
        role_result:"required",
        contact_way:{
            required:true,
            mobile:true
        },
        image_path:"required",
        xieyi:"required"

    },

    messages:{
        platform:"请选择游戏平台",
        operator_id:"请选择客户端",
        account:"游戏账号不能为空",
        password:"游戏密码不能为空",
        qufu:"游戏区服不能为空",
        role:"角色名不能为空",
        role_details:"请填写当前角色状态",
        role_result:"请填写期望的的角色状态",
        contact_way:{
            required:"手机号不能为空",
            mobile:"手机号码格式错误"
        },
        image_path:"请上传图片",
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