var requirement_form_option = {
		rules: {
            hu_title:'required',
            hu_platform:'required',
            operator:'required',
            hu_qufu:'required',
            hu_role:'required',
            days:'required',
            hu_details:'required',
            hu_result:'required',
            hu_provided:'required'
        },

        messages:{
            hu_title:'请填写标题',
            hu_platform:'请选中系统平台',
            operator:'请选择客户端',
            hu_qufu:'请填写游戏区服',
            hu_role:'请填写角色名称',
            days:'请选择代练天数',
            hu_details:'请填写当前的角色状态',
            hu_result:'请填写角色期望状态',
            hu_provided:'请选择是否提供充值'
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
var requirement_account_option = {
		rules: {
            hu_account:"required",
            hu_password: "required",
            hu_price: {
                required:true,
                range:[1,99999999]
            },
            hu_security:{
                required:true,
                range:[1,99999999]
            },
            hu_contact:{
                required:true,
                mobile:true
            },
            read: "required"
        },
        messages:{
            hu_account:'请填写游戏账号',
            hu_password:'请填写游戏密码',
            hu_price:{
                required:'请填写代练价格',
                range:'价格必须是非零整数'
            },
            hu_security:{
                required:'请填写保证金',
                range:'价格必须是非零整数'
            },
            hu_contact:{
                required:'请填写您的手机号码',
                mobile:'手机号码格式不正确'
            },
            read:'请同意轰轰虎协议'
        }
};

var verify_requirement_option = {
		rules: {
            contact:{
                required:true,
                mobile:true
            },
            read:"required"
        },
        messages:{
            contact:{
                required:'请填写您的手机号码',
                mobile:'手机号码格式不正确'
            },
            read:"请先阅读协议"
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
});
