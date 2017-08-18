var nickname_option = {
    rules: {
        nickname: {
            required:true,
                remote:{
                url: 'ajax_check_nickname',
                    type: "post",
                    dataType: "json",
                    data: {
                    nickname: function() {
                        return $("#nickname").val();
                    }
                }
            }
        },
        password_hash: {
            required:true,
                minlength:5,
                checkPass:true
        },
        confirm_password_hash:{
            required:true,
                minlength:5,
                equalTo:'#password'
        },
        email:{
            required:true,
            email:true ,
            remote:{
            url: 'ajax_check_email',
                type: "post",
                dataType: "json",
                data: {
                email: function() {
                    return $("#email").val();
                    }
                }
            }
        },
        vcode:{
            required:true,
                remote:{
                url: 'ajax_check_vcode',
                    type: "post",
                    dataType: "json",
                    data: {
                    vcode: function() {
                        return $("#check_vcode").val();
                    }
                }
            }
        },
        xieyi:'required'

    },

    messages:{
        nickname:{
            required:'用户名不能为空',
                remote:'此用户名已存在'
        },
        password_hash:{
            required:'请填写密码',
                minlength:$.validator.format("最少长度为5")
        },
        confirm_password_hash:{
            required:'请填写确认密码',
                minlength:'最少长度为5',
                equalTo:"两次输入密码不一致"
        },
        email:{
            required:'请填写邮箱',
            email:'请填写正确格式的邮箱',
            remote:'此邮箱已被注册'
        },
        vcode:{
            required:'请填写验证码',
                remote:'验证码错误'
        },
        xieyi:"请同意轰轰虎服务协议"
    }

};

var tel_option = {
    rules: {
        tel: {
            required:true,
            mobile: true,
            remote:{
                url: 'ajax_check_tel',
                type: "post",
                dataType: "json",
                data: {
                    tel: function() {
                        return $("#tel").val();
                    }
                }
            }
        },
        vcode:{
            required:true,
            remote:{
                url: 'ajax_check_vcode',
                type: "post",
                dataType: "json",
                data: {
                    vcode: function() {
                        return $(".code_check").val();
                    }
                }
            }
        },
        tel_vcode:{
            required:true,
            remote:{
                url: 'ajax_check_tel_code',    //验证手机验证码是否填写正确
                type: "post",
                dataType: "json",
                data: {
                    tel_vcode: function() {
                        return $(".tel_vcode_check").val();
                    }
                }
            }
        },
        password_hash: {
            required:true,
            minlength:5,
            checkPass:true
        },
        confirm_password_hash:{
            required:true,
            minlength:5,
            equalTo:'#password'
        },
        xieyi:'required'

    },

    messages:{
        tel:{
            required:'手机号码不能为空',
            remote:'此手机已存在'
        },
        vcode:{
            required:'请填写验证码',
            remote:'验证码错误'
        },
        tel_vcode:{
            required:"请填写手机验证码",
            remote:"短信验证码错误或失效"
        },
        password_hash:{
            required:'请填写密码',
            minlength:$.validator.format("最少长度为5")
        },
        confirm_password_hash:{
            required:'请填写确认密码',
            minlength:'最少长度为5',
            equalTo:"两次输入密码不一致"
        },
        xieyi:"请同意轰轰虎服务协议"
    }
};

function addMethod(){
    $.validator.addMethod("mobile", mobileFormat, "手机号码不足11位或者格式错误");
    $.validator.addMethod("unameFormat", userNameFormat, "6-18个字符内(仅限英文、数字和下划线)");
    $.validator.addMethod("checkPass", checkPass, "必须是字母和数字结合");
}
