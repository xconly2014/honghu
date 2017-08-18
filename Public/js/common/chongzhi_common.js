var chongzhi_option = {
    rules:{
        cz_option: "required",
        cz_number:"required",
        cz_qufu:"required",
        cz_contact_way:{
            required:true,
            mobile:true
        },
        cz_login_way:"required",
        cz_account:"required",
        cz_role:"required",
        cz_password:"required"
    },
    messages:{
        cz_option:"请选择充值面额",
        cz_number:"请选择充值数量",
        cz_qufu:"请填写游戏区服",
        cz_login_way:"请选择登录方式",
        cz_contact_way:
        {
            required:"请填写您的联系方式",
            mobile:"手机号码格式错误"
        },
        cz_account:"请填写游戏账号",
        cz_role:"请填写游戏角色",
        cz_password:"请填写游戏账号的密码"
    }
}

function set_sum_credits(sum, sum_price, credits)
{
    $("#sum").text(sum);
    $("#credits").text(credits);
    $("#del_price").text(sum_price);
    $('.del_line').css('text-decoration','line-through');
    //$("#double_credits").text(credits*2);
}

function get_sum()
{
   
  var sum = "";
    var credits = "";
    var sum_price = "";
    var discount = "";

    var value_array = $("select").multiselect("getChecked").map(function(){
        return this.value;
    }).get();

    var num = $("#cz_number").find("option:selected").attr("value");

    if(value_array.length == 0 || !num)
    {
        set_sum_credits(sum, sum_price, credits);
        return;
    }

    option_set = value_array;

    var option_array = $("#cz_option").find("option:selected");
    var val_obj_map = new Map();

    for(var i=0; i<option_array.length;i++)
    {
        var value = option_array[i].value;

        var map = new Map();
        for(var j=0; j<option_array[i].attributes.length; j++)
        {
            var nodeName = option_array[i].attributes[j]["nodeName"];
            var nodeValue = option_array[i].attributes[j]["nodeValue"];
            map.put(nodeName, nodeValue);
        }

        val_obj_map.put(value, map);
    }

    for(var i=0; i<value_array.length;i++)
    {
        
        var credits_mutiple = val_obj_map.get(value_array[i]).get("credits_multiple");
        var price = val_obj_map.get(value_array[i]).get("price");
        var discount = 1;
        discount = getDiscount(price,num);
    
        var temp_sum = parseFloat(num*price*discount).toFixed(1);
        var price_sum = parseFloat(num*price).toFixed(1);

        var temp_credits = price * num * credits_mutiple;

        sum  = accAdd(temp_sum, sum);
        sum_price = accAdd(price_sum, sum_price);
        credits = accAdd(temp_credits, credits);
    }
    sum_price = '原价：'+ sum_price+'元';
    set_sum_credits(sum, sum_price, credits);
   getDelPrice();

}//get_sum

function get_value(option_id, number,qufu_type){
    var option = $('#cz_number').children('option');
    var length = option.length;
    for(var i = 2; i <= length; i++){
        // if($("#cz_number option:nth-child("+i+")").val() == {$order_info.czInfo.number} ){
        if($("#cz_number option:nth-child("+i+")").val() == number){
            $("#cz_number option:nth-child("+i+")").attr('selected','selected');
        }
    }
    var qufu_option = $('#cz_login_way').children('option');
    var qufu_length = qufu_option.length;

    for(var k = 2; k <= qufu_length; k++){
        if($("#cz_login_way option:nth-child("+k+")").val() == qufu_type){
            $("#cz_login_way option:nth-child("+k+")").attr('selected','selected');
        }
    }


    var options = $('#cz_option').children('option');
    var lengths = options.length;
    var option_obj = option_id.split(',');
    var obj_length = option_obj.length;

    for(var o = 0; o< obj_length; o++){

        for(var j = 1; j <=length; j++){
        //if($("#cz_option option:nth-child("+j+")").val() == {$order_info.czInfo.option_id} ){
            if($("#cz_option option:nth-child("+j+")").val() == option_obj[o]){
                $("#cz_option option:nth-child("+j+")").attr('selected','selected');
            }
        }
    }
    

    $("#cz_option").multiselect("refresh");
}

$('.input_field > label').click(function(){
    $('.input_field :radio').removeAttr('checked');
    $(this).prev().attr("checked","checked");
});

function getDiscount(price,num){
    var discount = 1;
    var endTime = '2016/3/1';
    var endDate = new Date(endTime);
    var end = endDate.getTime()/1000;

    var d = new Date();
    var now = d.getTime()/1000;

    if(now > end){
        return discount;
    }

    if(price < 648){
        return discount;
    }

    if(num ==1){
        discount = 0.98;
    }

    if(num >= 2 && num <= 4){
        discount = 0.97;
    }

    if(num >=4 && num < 8){
        discount = 0.95;
    }

    if(num >=8){
        discount = 0.9;
    }

    return discount;
}


function getDelPrice(){
    $('#del_price').css('display','none');
    var price = $('#sum').text();
    var del_price = $('#del_price').text();
    var sum_price = del_price.match(/\d+/);
    if(sum_price > price){
        $('#del_price').css('display','inline-block');
    }
}
