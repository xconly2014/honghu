$().ready(function(){
	addMethod();
	$("#requirement_form").validate(window.requirement_form_option);
	$("#requirement_account_form").validate(window.requirement_account_option);
	$("#verify_requirement").validate(window.verify_requirement_option);
	
    
    $(".tab_header li").each(function(index){
        var liNode = $(this);
        $(this).click(function(){
            $(".tab_body .cur").removeClass('cur');
            $(".tab_header .active").removeClass('active');
            $(".tab�jll�������l��kp����ڱ���m� kk�������m�kk ������vp���kww����vǶ��q�pwk��wǱ�ql�۱�vl����lw�q���vk���wpǱ�ll��p � �q p�p ��q p v��jǱ��q��kkkm��۱�v�q� kw����q�q�kw m����qwp��� www���pww���www ����w����mlw�ڶ�v����mǪl۱j�v��k�p��qܱvw�jk������vpl���w�v��m�p۶ܶmv��ڪmk���Ƕkƭ�k �� �����p�p �j ���vpk�j�ڱm���ۭmkk����v����mlk��ƶ���mpl���vw����mǶ�q��vk��lǱ�q��� �jp��p����jp ����������p��v�j�j���jllj���m�q�llq���Ʊv�q���q�j�ܱlw�j�ǭj �� l��ڷ�v l�q ۶��m�mvl�j�������mpk���v��q�pܶvw�j�ݪ�qw�k��jmww����vww���wpw���qww����ǭ��qkl���v�v����kǪ�ڱj�vl���������lp�q���j���pl�q��lǱl �v �����