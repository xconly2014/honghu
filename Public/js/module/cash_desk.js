function cash_desk_active(){
    var a = $('.pay_way > a');
    var aLength = a.length;
    var ul = $('.pay_way_list ul');
    for(var i = 0; i < aLength; i++){
        a[i].index = i;
        a[i].onclick = function(){
            $('.pay_way > a').attr('class', '');
            $('.pay_way_list ul').css('display', 'none');
            ul[this.index].style.display='block';
            this.className='active';
        }
    }

    $("li > span[id!='unable']").click(function(){
        $(".pay_way_list").find(":radio").removeAttr('checked')
        $(this).prev().attr("checked","checked");
        $(".pay_way_list").find('li > span').removeClass('checked');
        $(this).addClass('checked');
    });

    $(":radio").click(function(){
        $(".pay_way_list").find('li > span').removeClass('checked');
        $(this).next().addClass('checked');
    });

     /*$('.cash_desk_form').submit(function(){
         $('#bg').css({display:'block',height:$(document).height()});
         $('.up_box').css('display','block');
     });*/

     //点击关闭按钮的时候，遮罩层关闭
     $('.box_close').click(function(){
         $('#bg').css('display','none');
         $('.up_box').css('display','none');
     });
}
