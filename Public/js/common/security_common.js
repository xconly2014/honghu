var update_password_option = {
    rules: {
        old_password_hash:{
            required:true,
            remote:{
                url: 'ajax_check_password',  //后台处理程序
                type: "post",               //数据发送方式
                dataType: "json",           //接受数据格式
                data: {                     //要传递的数据
                    old_password_hash: function() {
                        return $("#oldPassword").val();
                    }
                }
            }
        },
        password_hash: {
            required:true,
            minlength:6,
            checkPass:true,
            same:true
        },
        confirm_password_hash:{
            required:true,
            minlength:6,
            equalTo:'#password'
        },
        vcode:{
            required:true,
            minlength:4,
            remote:{
                url: 'ajax_check_vcode',  //后台处理程序
                type: "post",               //数据发送方式
                dataType: "json",           //接受数据格式
                data: {                     //要传递的数据
                   vcode: function() {
                        return $("#check_vcode").val();
                    }
                }
            }
        }
    },

    messages:{
        old_password_hash:{
            required:'请填写当前密码',
            remote:'当前密码填写错误',
        },
        password_hash:{
            required:'请填写密码',
            minlength:$.validator.format("最少长度为6")
        },
        confirm_password_hash:{
            required:'请填写确认密码',
            minlength:'最少长度为6',
            equalTo:"两次输入密码不一致"
        },
        vcode:{
            required:"请填写验证码",
            minlength:"验证码有误",
            remote:"验证码有误"
        }
    }
};

var mobile_bind_auth_option = {
    rules: {
        email_vcode:{
            required:true,
            remote:{
                url: 'ajax_check_tel_code',     //后台处理程序
                type: "post",               //数据发送方式
                dataType: "json",           //接受数据格式
                data: {                     //要传递的数据
                    tel_vcode: function() {
                        return $("#email_vcode").val();
                    }
                }
            }
        }
    },

    messages:{
        email_vcode:{
            required:'请填写邮箱验证码',
            remote:'邮箱验证码错误或过期'
        }
    }
};

var mobile_bind_option = {
    rules: {
       tel:{
            required:true,
            mobile:true,
            remote:{
                url: 'ajax_check_telephone',     //后台处理程序
                type: "post",               //数据发送方式
                dataType: "json",           //接受数据格式   
                data: {                     //要传递的数据
                    tel: function() {
                        return $(".tel_value").val();
                    }
                }
            }
        },

        vcode:{
            required:true,
            minlength:4,
            remote:{
                url: 'ajax_check_vcode',     //后台处理程序
                type: "post",               //数据发送方式
                dataType: "json",           //接受数据格式
                data: {                     //要传递的数据
                    vcode: function() {
                        return $("#check_vcode").val();
                    }
                }
            }
        },

        tel_vcode:{
            required:true,
            remote:{
                url: 'ajax_check_tel_code',     //后台处理程序
                type: "post",               //数据发送方式
                dataType: "json",           //接受数据格式   
                data: {                     //要传递的数据
                    tel_vcode: function() {
                        return $("#tel_vcode").val();
                    }
                }
            }
        }
    },

    messages:{
        tel:{
            required:'手机号不能为空',
            mobile:'手机号码格式错误',
            remote:'此号码已被注册',
        },
        vcode:{
            required:'请填写验证码',
            minlength:'验证码最小长度为4',
            remote:'验证码错误'
        },
        tel_vcode:{
            required:'请填写短信验证码',
            remote:'手机验证码错误'
        }
    }
};

var tel_email_option = {
    rules: {
        tel_vcode:{
            required:true,
            remote:{
                url: 'ajax_check_tel_code',     //后台处理程序
                type: "post",               //数据发送方式
                dataType: "json",           //接受数据格式   
                data: {                     //要传递的数据
                    tel_vcode: function() {
                        return $("#tel_vcode").val();
                    }
                }
            }
        },
        vcode:{
            required:true,
            minlength: 4,
            remote:{
                url: 'ajax_check_vcode',     //后台处理程序
                type: "post",               //数据发送方式
                dataType: "json",           //接受数据格式
                data: {                     //要传递的数据
                    vcode: function() {
                        return $("#check_vcode").val();
                    }
                }
            }
        }
    },

    messages:{
        tel_vcode:{
            required:'请填写短信验证码',
            remote:'短信验证码错误'
        },
        vcode:{
            required:'请填写验证码',
            minlength:'验证码最小长度为4',
            remote:'验证码错误'
        }
    }
}

var tel_email_set_option = {
    rules: {
        email:{
            required:true,
            email:true,
            remote:{
                url: 'ajax_check_email_auth',
                    type: "post",
                    dataType: "json",
                    data: {
                    email: function() {
                        return $("#email").val();
                    }
                }
            }
        },
        email_vcode:{
            required:true,
            remote:{
                url: 'ajax_check_tel_code',     //后台处理程序
                type: "post",               //数据发送方式
                dataType: "json",           //接受数据格式
                data: {                     //要传递的数据
                    tel_vcode: function() {
                        return $("#email_vcode").val();
                    }
                }
            }
        }
    },

    messages:{
        email:{
            required:'请填写邮箱',
            email:'邮箱格式不正确',
            remote:'此邮箱已被注册'
        },
        email_vcode:{
            required:'请填写邮箱验证码',
            remote:'邮箱验证码错误或过期'
        }
    }
}