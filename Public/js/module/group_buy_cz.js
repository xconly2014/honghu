$().ready(function(){

	$(".title_nav li").each(function(index){
        var liNode = $(this);
        $(this).click(function(){
            $(".buy_record .show").removeClass('show');
            $(".title_nav .selected").removeClass('selected');
            $(".buy_record div").eq(index).addClass('show');
            liNode.addClass('selected');
        });
    });

	$(".record_title li").each(function(index){
        var liNode = $(this);
        $(this).click(function(){
            $(".all_info .show").removeClass('show');
            $(".record_title .selected").removeClass('selected');
            $(".all_info>div").eq(index).addClass('show');
            liNode.addClass('selected');
        });
    });
	
    
    $('.my_record li').mouseover(function(){
        $(this).children('em').css('display','block');
    });
    $('.my_record li').mouseout(function(){
        $(this).children('em').css('display','none');
    });
    
    
   $('.new_record li').mouseover(function(){
	    $(this).children('span').css('display','none');
        $(this).children('p').css('display','block');
    });
    $('.new_record li').mouseout(function(){
        $(this).children('p').css('display','none');
        $(this).children('span').css('display','block');
    });

    $('.show_btn').mouseenter(function(){
        $(this).children('.check_more').css('display','inline-block');
    });
    $('.check_more').toggle(
        function(){
            $(this).siblings('div').show(300);
            $(this).text('点击关闭');
        },
        function(){
            $(this).siblings('div').hide(300);
            $(this).text('查看更多');
        }
    );
    $('.show_btn').mouseleave(function(){
        $(this).children('.check_more').css('display','none');
    });
    

    $('#view').click(function(){
    	$('#codes').show(1000);
    });
    $('#close').click(function(){
    	$('#codes').hide(1000);
    });
    

    $('#max').click(function(){
		var times = $(this).text();
		var remain = $('.blue').text();
		var differential = parseInt(times) - parseInt(remain);
		 if(differential > 0 ){
			 $('#num').val(remain);
		}else{
			$('#num').val(times);
		}
	});
	
	$('#reduce').click(function(){
		var num = $('#num').val();
		if(num - 1 > 0){
			$('#num').val(num-1);
		}else{
			$('#num').val(1);
		}
	});
	
	$('#add').click(function(){
		var num = parseInt($('#num').val());
		var remain = $('.blue').text();
        var max_time = parseInt($('#max').text());
		if(remain<=max_time && remain<=num){
            $('#num').val(remain);
            return;
        }
        if(remain>=max_time && max_time<=num){
            $('#num').val(max_time);
            return;
        }
        $('#num').val(num+1);
	});
	
    $('#num').focusout(function(){
        var end = parseInt($('.blue').text());
        var max_time = parseInt($('#max').text());
        if(end>=max_time && max_time < $(this).val()){
            $(this).val(max_time);    
        }
        if(end<=max_time && end < $(this).val()){
            $(this).val(end);
        }       
    	if($(this).val() == 0){
    		 $('#num').val(1);
    	 }
    });
    
    
    $('#more').toggle(
    		function(){
            	$(this).html("<img src='/Public/img/up.png' />收起");
            	$('.more').removeClass('none');
            },
            function(){
            	$(this).html("<img src='/Public/img/down.png' />展开更多");
            	$('.more').addClass('none');
            }
            
        );
    

});
