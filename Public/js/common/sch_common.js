var sc_game_account_option = {
		rules:{
        	role: 'required',
        	qufu: 'required',
        	password:{
        		required:true,
        	},
        	account:'required',
            contact_way:{
                required:true,
                mobile:true
            }
        },
        messages:{
        	role:'请输入您的游戏角色',
        	qufu: '请输入您的游戏区服',
        	password:{
        		required:'请输入您的游戏密码',
        	},
        	account:'请输入您的游戏账号',
            contact_way:{
                required:'请输入您的联系方式',
                mobile:'手机号码格式错误'
            }
        }

};


function addMethod(){
    $.validator.addMethod("mobile", mobileFormat, "手机号码不足11位或者格式错误");
    $.validator.addMethod("unameFormat", userNameFormat, "6-18个字符内(仅限英文、数字和下划线)");
    $.validator.addMethod("checkPass", checkPass, "必须是字母和数字结合");
}


$().ready(function(){

    $('.theme-poptit .close').click(function(){
        close_dlg();
    });
    $('#reset').click(function(){
        close_dlg();
    });

    /*$(".platform_nav li").each(function(index){
     var liNode = $(this);
     $(this).click(function(){
     $(".sc_tabs_content .sc_list").removeClass('sc_list');
     $(".platform_nav .selected_li").removeClass('selected_li');
     $(".sc_tabs_content div").eq(index).addClass('sc_list');
     liNode.addClass('selected_li');
     });
     }); */

});

function getGift(game){
    if(is_login){
        var url = 'ajax_get_gift';
        $.post(url,{'game':game},function(msg){
            if(msg['state']){
                layer.alert(msg['data']);
                layer.title('恭喜您获得礼包');
            }else{
                layer.alert(msg['data']);
            }
        });
        return;
    }
    open_dlg();
}

