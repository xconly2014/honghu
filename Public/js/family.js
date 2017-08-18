var family_create = {
            rules:{
                nick_name:{
                    required:true,
                    maxlength:10
                },
                introduction:{
                    required:true,
                    rangelength:[20,100]
                }
            },

            messages:{
                nick_name:{
                    required:'请填写您在堂会中的昵称',
                    maxlength:'昵称最大长度为10'
                },
                introduction:{
                    required:'请填写堂会的简介',
                    rangelength:'堂会简介词应在20-100个字符间'
                }
            },
             submitHandler:function(form){

                var nick_name = $('input[name=nick_name]').val();
                var family_logo_id = $('input[name=family_logo_id]').val();
                var introduction = $('textarea').val();
                var url = $(this).attr('action');

                $.post(url,{nick_name:nick_name,family_logo_id:family_logo_id,introduction:introduction},function(data){
                    if(data['state'] == 'true'){
                        layer.alert(data['message'],function(){
                            
                            window.location.href="/branches/family_list/Family/family_index";
                        });
                        layer.title('轰轰虎提示');
                        
                        
                    }else{
                         layer.alert(data['message']); 
                         layer.title('轰轰虎提示');  
                    }
                });
                return false;
            }    
        }

        //获取logo和堂会名函数
        function clickLogo(logoObj,flag){
            var family_name = logoObj.attr('alt');
            var family_logo = logoObj.attr('src');
            var family_logo_id = logoObj.attr('id');

           if(flag){
                $('.family_small_logo img').css('border','1px solid #ededed');
                logoObj.css('border','1px solid red');

           }else{

                logoObj.parent().css('border','1px solid red');
                logoObj.parent().siblings().css('border','1px solid #ededed');
           }
            

            $('.family_logo_id').val(family_logo_id);
            $('.family_logo_name').text(family_name);
            $('.family_big_logo img').attr('src',family_logo);
        }

          function logout_family(family_id){
            layer.confirm('确定要退出堂会吗？自行退出将清空所有的贡献值!', function(index){
                //ajax
                $.post("family_logout?id="+family_id,function(data){
                    if(data['state']){
                        layer.alert(data['message'],function(){
                            window.location.href="family_info?id="+family_id;
                        });
                        layer.title('轰轰虎提示');
                        
                    }
                });

                layer.close(index);
            });             
            layer.title('轰轰虎提示');
        }

        function alert_member_in(family_id){
            layer.open({
                type: 1,
                title: '<b>申请加入堂会</b>',
                shadeClose: true,
                shade: 0.8,
                area: ['300px', '200px'],
                content: '<div id="add_family"><div class="add_family_container"><span>亲，要多为堂会做贡献哦！</span><p class="input_field"><label class="form_info member_nick_name" style="width:50px;color:#FF6B2F;font-size:14px;margin-right:0px;">昵称：</label><input type="text" class="member_nick" name="nick_name" placeholder="请填写您在堂会中的昵称！" /></p><p class="input_field"><label class="form_info">&nbsp;</label><button type="submit" class="mui-btn mui-btn-positive add_member">确认加入</button></p></div></div>'
            }); 
            $('.add_member').click(function(){
                 add_family(family_id);
            });
        }

        function add_family(family_id){
            var nick = $('.member_nick').val();
            var url = "add_member";
            if(nick == ''){
                layer.tips('昵称不能为空', '.member_nick',{
                        tips: [1, '#f00'],
                        time: 3000
                    });
                return;
            }
            $.post(url,{nick_name:nick,id:family_id},function(data){
                if(data['state'] == 'true'){
                    layer.alert(data['message'],function(){
                            window.location.href="family_info?id="+family_id;
                        });
                    layer.title('轰轰虎提示');               
                }else{
                    layer.tips(data['message'], '.add_member',{
                        tips: [1, '#f00'],
                        time: 3000
                    });
                }
            });
        }