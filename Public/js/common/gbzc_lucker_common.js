var gbcz_option = {
    rules:{
        cz_account:"required",
        cz_contact_way:{
            required:true,
            mobile:true
        },
        cz_login_way:"required",
        cz_qufu:"required",
        cz_role:"required",
        cz_password:"required"
    },
    messages:{
        cz_qufu:"请填写游戏区服",
        cz_login_way:"请选择登录方式",
        cz_contact_way:{
            required:"请填写您的联系方式",
            mobile:"手机号码格式错误"
        },
        cz_account:"请填写游戏账号",
        cz_role:"请填写游戏角色",
        cz_password:"请填写游戏账号的密码"
    }
}

var gbcz_verify_option = {
    rules:{
        contact_way:{
            required:true,
            mobile:true
        }
    },
    messages:{
        contact_way:{
            required:"请填写您的联系方式",
            mobile:"手机号码格式错误"
        }
    }
}
$().ready(function(){
    $.validator.addMethod("mobile", mobileFormat, "手机号码格式错误");
});

