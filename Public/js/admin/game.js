/**
 * Created by Administrator on 15-5-19.
 */
$().ready(function(){
	
    if($("#uploadImages").length > 0 ){
        $("#uploadImages").kinFormUpload({
            length:1,
            zIndex:2,
            ext:'jpg,jpeg,png,gif'
        });
    }
    
    $('#uploadImg').mouseout(function(){
        var num = $('i').html();
        if(num == 0){
            $('#uploadImg').next().remove();
            $('#uploadImg').after("<label id='error'>请上传缩略图</label>");
        }else{
            $('#uploadImg').next().remove();
            $('#uploadImg').after("<label id='success'></label>");
        }
    });

    $("#iosCZOptionAdd").validate({
        rules: {
            currency: "required",

            price:{
                required:true,
                range:[1,99999999]
            },

            rate:{
                required:true,
                range:[0,1.0]
            }
        },

        messages:{
            currency:"游戏币不能为空",

            price:{
                required:"价格不能为空",
                range:$.validator.format("请输入小于99999999的非0数字")
            },

            rate:{
                required:"折扣不能为空",
                range:$.validator.format("请输入0到1之间的数字")
            },
        },

        errorPlacement: function(error, element) {
            error.appendTo(element.parent());
            error.siblings("span").remove();
        },

        errorElement:"span",

        success: function(span) {
            span.attr("class","success");
        },

        onfocusout: function(element) {
            $(element).valid();
        }
    });

    $("#gameAdd").validate({
        rules: {
            game_name:"required",
            game_pinyin:"required",
            game_currency:"required",
            game_help_text:"required",
            game_discount:"required",
            tx_game:"required",
            need_server:"required"
        },

        messages: {
            game_name:'请输入游戏名字',
            game_pinyin:"请输入游戏拼音",
            game_currency:"请输入游戏币单位",
            game_help_text:"请输入充值宣传文字",
            game_discount:"请输入充值折扣",
            tx_game:"请选择是否为腾讯游戏",
            need_server:"请选择该游戏是否需要填写区服"
        },

        errorPlacement: function(error, element) {
            error.appendTo(element.parent());
            error.siblings("span").remove();
        },

        errorElement:"span",
        success: function(span) {
            span.attr("class","success");
        },

        onfocusout: function(element) {
            $(element).valid();
        }
    });
    
    
    
    
    
	$("#IOSCZPageAdd").validate({
        onfocusout: function(element) { 
           $(element).valid();
       	},
        rules: {
        	game_id:"required",
        	mini:{
        		required:true,
        		digits:true,
        		min:1,
        	},
        	sum:{
        		required:true,
        		digits:true,
        		min:1,
        	},
        	real_price:{
        		required:true,
        		digits:true,
        		min:1,
        	},
        	price:{
        		required:true,
        		digits:true,
        		min:1,
        	},
        	option:'required',
        },
        messages:{
        	game_id:"请选择游戏名字",
        	mini:{
        		required:'请填写最小购买数',
        		digits:'必须为整数',
        		min:'请填写非零的整数',       		
        	},
        	sum:{
        		required:'请填写总数量',
        		digits:'必须为整数',
        		min:'请填写非零的整数',       		
        	},
        	real_price:{
        		required:'请填写面额原价格',
        		digits:'必须为整数',
        		min:'请填写非零的整数',       		
        	},
        	price:{
        		required:'请填写面额价格',
        		digits:'必须为整数',
        		min:'请填写非零的整数',       		
        	},
        	option:'请填写面额描述',
    	},
    	errorPlacement: function(error, element) {
            error.appendTo(element.parent());
            error.siblings("span").remove();
    	},
    	errorElement:"span",
    	success: function(span) {
    		span.attr("class","success");
    	},
       	submitHandler:function(form){
            form.submit();
        }      
    });
	
	
	
	
    $("#IOSScAdd").validate({
        rules: {
        	game_id: "required",
        	operator_id: "required",
        	details:"required",
        	price:{
        		required:true,
        		digits:true
        	},
            discount:{
                required:true,
                range:[0, 1.0]
            },
            amount:{
        		required:true,
        		digits:true
        	},
        	sell_amount:{
        		required:true,
        		digits:true
        	},
        },
        
        messages:{
        	game_id:"请选择游戏名字",
        	operator_id:"请选择客户端",
        	details:"请填写标题",
        	price:{
                required:"请填写原价",
                digits:"必须为整数"
            },
            discount:{
                required:"请填写折扣",
                range:$.validator.format("请输入0到1.0之间的数字")
            },
            amount:{
                required:"请填总数量",
                digits:"必须为整数"
            },
            sell_amount:{
        		required:"请填写销售数量",
        		digits:"必须为整数"
        	},
        },

        errorPlacement: function(error, element) {
            error.appendTo(element.parent());
            error.siblings("span").remove();
        },

        errorElement:"span",

        success: function(span) {
            span.attr("class","success");
        },

        onfocusout: function(element) {
            $(element).valid();
        }
    });
    
    
    
    $("#groupBuyCzAdd").validate({
        onfocusout: function(element) { 
           $(element).valid();
       	},
        rules: {
        	game_id:"required",
        	max:{
        		required:true,
        		digits:true,
        		min:1,
        	},
        	day:{
        		required:true,
        		digits:true,
        		min:1,
        	},
        	price:{
        		required:true,
        		digits:true,
        		min:1,
        	},
        	option:'required',
        },
        messages:{
        	game_id:"请选择游戏名字",
        	max:{
        		required:'请填写最都购买次数',
        		digits:'必须为整数',
        		min:'请填写非零的整数',       		
        	},
        	day:{
        		required:'请填写有效天数',
        		digits:'必须为整数',
        		min:'请填写非零的整数',       		
        	},
        	price:{
        		required:'请填写价钱',
        		digits:'必须为整数',
        		min:'请填写非零的整数',       		
        	},
        	option:'请填写面额描述',
    	},
    	errorPlacement: function(error, element) {
            error.appendTo(element.parent());
            error.siblings("span").remove();
    	},
    	errorElement:"span",
    	success: function(span) {
    		span.attr("class","success");
    	},
       	submitHandler:function(form){
            form.submit();
        }      
    });




    $("#GiftCodeAdd").validate({
        onfocusout: function(element) {
            $(element).valid();
        },
        rules: {
            game_id:"required",
            code:"required"
        },
        messages:{
            game_id:"请选择游戏名字",
            code:"请添加礼包码"
        },
        errorPlacement: function(error, element) {
            error.appendTo(element.parent());
            error.siblings("span").remove();
        },
        errorElement:"span",
        success: function(span) {
            span.attr("class","success");
        },
        submitHandler:function(form){
            form.submit();
        }
    });

	
	
    
    
});

function check(){
	$('#uploadImg').trigger('mouseout');
}
