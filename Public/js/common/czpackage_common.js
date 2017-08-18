var czpackage_game_account_option = {
		rules: {
        	cz_contact_way:{
        		required:true,
        		mobile:true
        	},
        	cz_login_way:"required",
        	cz_account:"required",
        	cz_qufu:"required",
        	cz_role: "required",
        	cz_password:"required"
        },

        messages:{
        	cz_contact_way:{
        		required:"请填写联系方式",
        		mobile:"手机号码格式错误"
        	},
        	cz_login_way:"请选择登录方式",
        	cz_account:"请填写游戏账号",
        	cz_qufu:"请填写游戏区服",
        	cz_role: "请填写游戏角色",
        	cz_password:"请填写游戏密码"
        }
};

function addMethod(){
    $.validator.addMethod("mobile", mobileFormat, "手机号码不足11位或者格式错误");
    $.validator.addMethod("unameFormat", userNameFormat, "6-18个字符内(仅限英文、数字和下划线)");
    $.validator.addMethod("checkPass", checkPass, "必须是字母和数字结合");
}
