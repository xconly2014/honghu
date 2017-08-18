/**
 +------------------------------------------------------------------------------
 * [多文件上传]插件 jquery.kinFormUpload
 +------------------------------------------------------------------------------
 * @author   Mr.kin
 * @version  1.1
 * @file  	 jquery.kinFormUpload.1.1.source.js
 * @info  	 报告BUG、建议、索取最新版本 请Mail：Mr.kin@foxmail.com(注：邮件标题请包含kinFormUpload 以便于邮箱自动归档)
 * @date  	 2012-12-16 16:35
 +------------------------------------------------------------------------------
 */
(function($){
	$.fn.kinFormUpload = function(user_options){
			//默认设置
			var default_options = {
								//允许上传文件的数量,0代表无限制
								length:0,
								//允许上传文件的扩展名 默认所有。使用半角逗号分隔
								ext:'',
								//kinFormUpload 显示层级 默认为null, 如果kinFormUpload 被其他物体遮挡住时 可设置此项
								zIndex:null,								
								//按钮美化设置
								button:{
										//按钮宽度
										width:107,
										
										//按钮高度
										height:32,
										
										//按钮文字距离 按钮左边距离
										left:0,
										
										//按钮文字距离 按钮顶部距离
										top:0,
										//按钮显示文字
										text:{word:'╋ 选择文件',normal:{color:'#333333',fontFamily:'Arial',fontSize:'12px',fontWeight:'bold'},hover:{color:'#ffffff'}},
										
										//按钮背景 (normal:正常状态,hover:鼠标经过。可以是图片或是背景颜色;)
										background:{normal:'color[#fcfcfc,#dbdbdb]',hover:'color[#2882c2,#0a5890]'},
										
										//按钮边框 (normal:正常状态,hover:鼠标经过。格式：1px solid #ccc;如使用背景图片 不需要边框可设置为：'none')
										border:{normal:'#dddddd #999999 #999999 #dddddd',hover:'#77b3dd #023961 #023961 #77b3dd'}

								}
								
			};
			//获取最终配置值
			var options = jQuery.extend(true,{},default_options,user_options);
			//全局对象
			var K = {};
			//当前文件上传域对象
			K.t = this;
			//检测文件上传域 是否合法
			if( !$(K.t).is("input[type='file']") ) { $.error('kinFormUpload error : Is not a valid file field elements') };
			//检测一次操作文件上传域数量 每次只能实例化一个(如页面中需要多个 请多次实例化)
			if( $(K.t).length>1 ) { $.error('kinFormUpload error : Only operate a file field once') };
			//文件域名称
			K.name = $(K.t).attr('name');
			
			//生成容器ID
			K.id = 'kinFormUpload_'+K.name.replace(/[\||\"|\'|\.|\_|\-|\[|\]]/gi,'') + parseInt(Math.random()*1000000); 
			//文件域索引
			K.index = 1;
			
			K.buildHTML = function(){
				//设置容器
				$(K.t).wrap('<div class="kinFormUpload" id="'+K.id+'"></div>');
				//容器对象
				var mid = '#'+K.id;  
				K.wrap = $(mid);
				//清空容器 重置对象
				K.wrap.empty();
				//设置 kinFormUpload CSS
				Css = K.setCSS();
				K.wrap.prepend(Css);
				//检测文件域 自动配置多文件上传 文件域名称(注：php中有效，其他语言中未测，如果不是 name[] 形式 需要上传多文件 请删除下面if语句)
				if(options.length){
					K.name = K.name.replace('[]','')+'[]';
				}
				//按钮配置
				var b = options.button;
				//文件域ID
				var fileFieldId = K.id+'_'+K.index;
				var uploaderHtml = '<a class="kinFormUpload_uploadLink" href="javascript:;"><span>'+b.text.word+'(<i class="num">0</i>)</span><input type="file" class="notSelected" id="'+fileFieldId+'" name="'+K.name+'" /></a>';
				uploaderHtml+='<div class="kinFormUpload_upfilesInfo"><div class="kinFormUpload_upfilesInfoContent">';
				uploaderHtml+='<p class="kinFormUpload_controlTitle">上传文件列表<a class="kinFormUpload_controlClose" href="javascript:;" title="关闭">×</a></p>';
				uploaderHtml+='<p class="kinFormUpload_errorTip"></p>';
				var uploadTip = options.length===0?'已选择<strong>0</strong>个文件':'已选择<strong>0</strong>个文件，最多还可以选择<strong>'+options.length+'</strong>个文件';
				uploaderHtml+='<p class="kinFormUpload_uploadTip">'+uploadTip+'</p>';
				uploaderHtml+='<div class="kinFormUpload_fileListWrap"><ul class="kinFormUpload_fileList">';
				uploaderHtml+='</ul></div>';
				uploaderHtml+='<s><i></i></s></div></div>';
				K.wrap.append(uploaderHtml);
				//绑定 文件域 change 事件
				K.wrap.find("input.notSelected").live('change',function(){
					K.addFile(this);
				});
				//绑定 面板关闭事件
				K.wrap.find("a.kinFormUpload_controlClose").live('click',function(){		//小图标单击
				//K.wrap.find("a.kinFormUpload_controlClose").live('mouseover',function(){	//小图标鼠标经过
					K.wrap.find('.kinFormUpload_upfilesInfo').hide();						//隐藏小窗口
					K.wrap.find('.kinFormUpload_uploadLink').live('mouseover',function(){	//按钮鼠标应经显示小窗口
					//K.wrap.find('.kinFormUpload_uploadLink').live('click',function(){
						K.wrap.find('.kinFormUpload_upfilesInfo').show();
						//K.wrap.find('.kinFormUpload_upfilesInfo').hide();
					});
				});
				
					
				
				//绑定删除事件
				K.wrap.find('.kinFormUpload_fileList a.kinFormUpload_fileRemoveButton').live('click',function(){
					var fileId = $(this).attr('fileid');
					//移除文件域
					K.wrap.find('#'+fileId).remove();
					//删除文件列表中记录
					$(this).closest('li').remove();
					//更新文件计数信息
					K.setFilesNum('-');
				});			
			};
			
			K.setCSS = function(){
				//按钮配置
				var b = options.button;
				//z-index
				var zIndex = '';
				if(options.zIndex!==null){
					zIndex = 'z-index:'+options.zIndex+';';
				}
				
				//边框
				var bd = {};
				if( b.border.normal=='none' || b.border.normal==0 ){
					bd.normal = 'border:none;';
				}else{
					bd.normal = 'border-width:1px;border-style:solid;border-color:'+b.border.normal+';';	
				}
				if( b.border.hover=='none' || b.border.hover==0 ){
					bd.hover = 'border:none;';
				}else{
					bd.hover  = 'border-width:1px;border-style:solid;border-color:'+b.border.hover+';';	
				}
				//背景
				var bg = {};
				bg.normal = {};
				bg.normal.css = '';
				bg.hover = {};
				bg.hover.css = '';
				//背景 normal 样式
				
				bg.normal.exec = /(\w+)\[(.*?)\]/ig.exec(b.background.normal);
				bg.normal.style = bg.normal.exec[1];
				bg.normal.value = bg.normal.exec[2];
				//背景 hover 样式
				bg.hover.exec = /(\w+)\[(.*?)\]/ig.exec(b.background.hover);
				bg.hover.style = bg.hover.exec[1];
				bg.hover.value = bg.hover.exec[2];				
				
				//bg normal css
				switch(bg.normal.style){
					case 'color' :
						 var cl = bg.normal.value.split(',');
						 bg.normal.css = "background:-webkit-gradient(linear,left top,left bottom,from("+cl[0]+"),to("+cl[1]+"));background:-moz-linear-gradient(top,"+cl[0]+","+cl[1]+");	background:-o-linear-gradient(top,"+cl[0]+","+cl[1]+");background:linear-gradient(top,"+cl[0]+","+cl[1]+");filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='"+cl[0]+"',endColorstr='"+cl[1]+"');";
						 break;
					case 'image' :
						 bg.normal.css = 'background:'+bg.normal.value+';'; 
						 break;
				}
				//bg hover css
				switch(bg.hover.style){
					case 'color' :
						 var cl = bg.hover.value.split(',');
						 bg.hover.css = "background:-webkit-gradient(linear,left top,left bottom,from("+cl[0]+"),to("+cl[1]+"));background:-moz-linear-gradient(top,"+cl[0]+","+cl[1]+");	background:-o-linear-gradient(top,"+cl[0]+","+cl[1]+");background:linear-gradient(top,"+cl[0]+","+cl[1]+");filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='"+cl[0]+"',endColorstr='"+cl[1]+"');";
						 break;
					case 'image' :
						 bg.hover.css = 'background:'+bg.hover.value+';'; 
						 break;
				}				 
							
				//宽、高
				b.width = parseInt(b.width)+'px';
				b.height = parseInt(b.height)+'px';
				//文字边距
				b.left = parseInt(b.left)+'px';
				b.top = parseInt(b.top)+'px';
				
				var CssId = '#'+K.id;
				//CSS 命名空间
				var p = {}
				//kinFormUpload_
				p.k = 'kinFormUpload_';
				//kinFormUpload_uploadLink
				p.l = p.k+'uploadLink';
				//kinFormUpload_upfilesInfo
				p.u = p.k+'upfilesInfo';
				//kinFormUpload_upfilesInfoContent
				p.c = p.u+'Content';
				
				var Css = '<style type="text/css">';
				Css +=CssId+' { display:inline-block;_display:inline;position:relative;'+zIndex+'font-size:12px;font-family:Arial}';
				Css +=CssId+' *{margin:0;padding:0;}';
				
				Css +=CssId+' a.'+p.l+'{position:relative;width:'+b.width+';height:'+b.height+';display:inline-block; vertical-align:middle; text-decoration:none; overflow:hidden; '+bg.normal.css+bd.normal+' outline:none;hide-focus:expression(this.hideFocus=true);}';
				Css +=CssId+' a.'+p.l+':hover{'+bg.hover.css+bd.hover+'}';
				Css +=CssId+' a.'+p.l+' span{position:absolute; top:'+b.top+'; left:'+b.left+';width:'+b.width+';height:'+b.height+';text-align:center;vertical-align:baseline; overflow:hidden; display:block;color:'+b.text.normal.color+'; font:'+b.text.normal.fontSize+'/'+b.height+' '+b.text.normal.fontFamily+';font-weight:'+b.text.normal.fontWeight+';}';
				Css +=CssId+' a.'+p.l+':hover span{color:'+b.text.hover.color+'; font:'+b.text.hover.fontSize+'/'+b.height+' '+b.text.hover.fontFamily+';font-weight:'+b.text.hover.fontWeight+';}';
				Css +=CssId+' a.'+p.l+' span i{ font-style:normal;}';
				Css +=CssId+' input.notSelected{ position:absolute; top:0; right:0; font-size:200px; opacity:0;filter:alpha(opacity=0);outline:none;hide-focus:expression(this.hideFocus=true); cursor:pointer;}';
				Css +=CssId+' input.hasSelected{font-size:12px;display:none;}';
				var fileInfoTop = parseInt(b.height)+13;
				Css +=CssId+' .'+p.u+'{display:none;position:absolute;width:300px;left:0;top:'+fileInfoTop+'px;}';
				Css +=CssId+' .'+p.c+'{background:#F0F7FC;border: 1px solid #C3E7FC;position:relative;padding:5px;}';
				Css +=CssId+' .'+p.c+' p.kinFormUpload_controlTitle{line-height:20px;color:#2984B4;margin-bottom:5px;font-weight:bold;_zoom:1;}';
				Css +=CssId+' .'+p.c+' p.kinFormUpload_controlTitle a.kinFormUpload_controlClose{float:right;*margin-top:-18px;display:inline-block;width:16px;height:16px;overflow:hidden;text-align:center;border:1px solid #e5e5e5;background:#e65221;color:#fff;text-decoration:none;font:12px/16px "Lucida Console";font-weight:bold;outline:none;hide-focus:expression(this.hideFocus=true);_line-height:18px;}';
				Css +=CssId+' .'+p.c+' p.kinFormUpload_controlTitle a.kinFormUpload_controlClose:hover{border:1px solid #e5e5e5;background:#c30b0b;color:#fff;}';
				Css +=CssId+' .'+p.c+' p.kinFormUpload_errorTip{display:none;background:#FEFCDF;border:1px solid #FEEA93;line-height:18px;color:#c00; padding:2px;margin-bottom:5px;word-break:break-all}';
				Css +=CssId+' .'+p.c+' p.kinFormUpload_errorTipRed{background:#FFCCCC;border:1px solid #FF0000;}';
				Css +=CssId+' .'+p.c+' p.kinFormUpload_uploadTip{background:#f6fdf2;border:1px dashed #C8E4BA;line-height:18px;color:#429917; padding:2px;margin-bottom:5px;}';
				Css +=CssId+' .'+p.c+' p.kinFormUpload_uploadTip strong{padding:0 1px;color:#c00;}';
				Css +=CssId+' .'+p.c+' .kinFormUpload_fileListWrap{height:100px;overflow-x:hidden;overflow-y:auto;background:#fff; border-color: #848484 #E0E0E0 #E0E0E0 #848484;border-style: solid;border-width: 1px;}';
				Css +=CssId+' .'+p.c+' ul{list-style:none;padding-left:5px;}';
				Css +=CssId+' .'+p.c+' ul li{list-style:none;line-height:20px;font-size:12px;border-bottom:1px dashed #e0e0e0;white-space:nowrap;overflow:hidden;_zoom:1;}';
				Css +=CssId+' .'+p.c+' ul li span{float:left;line-height:20px;width:220px;height:20px;overflow:hidden;font-size:12px;color:#666666;display:inline-block; cursor:default;}';
				Css +=CssId+' .'+p.c+' ul li a.kinFormUpload_fileRemoveButton{float:right;margin-right:5px;display:inline-block;color:#c00;text-decoration:none;outline:none;hide-focus:expression(this.hideFocus=true);font-family:Arial;}';
				Css +=CssId+' .'+p.c+' ul li a.kinFormUpload_fileRemoveButton:hover{color:#F00;text-decoration:underline;}';
				Css +=CssId+' .'+p.c+' s{position:absolute;top:-20px;left:20px;display:block;height:0;width:0;font-size: 0; line-height: 0;border-color:transparent transparent #C3E7FC transparent;border-style:dashed dashed solid dashed;border-width:10px;}';
				Css +=CssId+' .'+p.c+' i{position:absolute;top:-9px;left:-10px;display:block;height:0;width:0;font-size: 0;line-height: 0;border-color:transparent transparent #F0F7FC transparent;border-style:dashed dashed solid dashed;border-width:10px;}';
				Css +='</style>';	
				return Css;
			};
			
			K.addFile = function(fileInput){
				if( !K.verify(fileInput) ){
					return false;	
				}
				$(fileInput).removeClass('notSelected').addClass('hasSelected');
				K.setFilesNum('+');
				K.addFileInput();
				K.wrap.find('.kinFormUpload_upfilesInfo .kinFormUpload_errorTip').fadeOut(200);
			};
			
			//验证
			K.verify = function(fileInput){
				var uploaded_length =  K.wrap.find("input.hasSelected").length;
				//验证上传数量限制
				if(options.length>0 && uploaded_length >= options.length){
					K.setErrorTip('超过设定上传文件数量限制，请删减后再重新选择');
					$(fileInput).remove();
					K.addFileInput();
					return false;
				}
				
				//扩展名验证
				var file = {};
				file.name = K.getFileName(fileInput);
				file.ext  = K.getFileExt(file.name).toLowerCase();
				if(options.ext!=''){
					options.ext = options.ext.toLowerCase();
					var allowExtList = options.ext.split(',');
					if( $.inArray(file.ext,allowExtList) == -1){
						K.setErrorTip('仅允许上传以下格式的文件：<br /> ('+options.ext+')');	
						$(fileInput).remove();
						K.addFileInput();
						return false;
					}
				}
				
				K.addToList(fileInput,file.name);
				return true;
			};
			
			//新增一个点击文件域
			K.addFileInput = function(){
				K.index++;
				var nextFileFieldId = K.id+'_'+K.index;
				K.wrap.find('a.kinFormUpload_uploadLink').append('<input type="file" class="notSelected" id="'+nextFileFieldId+'" name="'+K.name+'" />');
			}
			
			//上传数量显示
			K.setFilesNum = function(operator){
				var iNum = K.wrap.find('a.kinFormUpload_uploadLink span i.num');
				var uploadedNum = iNum.html();
				switch(operator){
					case '+' :uploadedNum++;break;
					case '-' :uploadedNum--;break;
				}
				iNum.html(uploadedNum);
				var iTip = K.wrap.find('.kinFormUpload_upfilesInfo .kinFormUpload_uploadTip');
				var uploadTip = options.length===0?'已选择<strong>'+uploadedNum+'</strong>个文件':'已选择<strong>'+uploadedNum+'</strong>个文件，最多还可以选择<strong>'+(options.length-uploadedNum)+'</strong>个文件';
				iTip.html(uploadTip);
			}
			
			//错误显示
			K.setErrorTip = function(tip){
				K.wrap.find('.kinFormUpload_upfilesInfo').show();
				var flag = 0;
				var errorTip = K.wrap.find('.kinFormUpload_upfilesInfo .kinFormUpload_errorTip');
				errorTip.html(tip);
				errorTip.fadeIn(100);
				var timer = setInterval(function(){
						if(flag%2==0){
							errorTip.addClass('kinFormUpload_errorTipRed');
						}else{
							errorTip.removeClass('kinFormUpload_errorTipRed');
						}
						flag++;
						if(flag>8){
							errorTip.removeClass('kinFormUpload_errorTipRed');
							clearInterval(timer);	
						}
				},100);
				
			}
			
			//上传文件列表
			K.addToList = function(fileInput,fileName){
				var fileId = $(fileInput).attr('id');
				var oneFile = '<li title="'+fileName+'"><span>'+fileName+'</span><a fileid="'+fileId+'" class="kinFormUpload_fileRemoveButton" href="javascript:;" title="从队列中移除此文件">×删除</a></li>';
				K.wrap.find('.kinFormUpload_fileList').append(oneFile);
				//获取文件列表高度
				var fileListHeight = K.wrap.find('.kinFormUpload_fileList').height();
				//文件列表容器 滚动条到最底 
				K.wrap.find('.kinFormUpload_fileListWrap').scrollTop(fileListHeight);
				//显示文件列表面板
				K.wrap.find('.kinFormUpload_upfilesInfo').show();
				
				
			};
			
			
			//获取文件名称
			K.getFileName = function(fileInput){
				//取得文件路径信息 (非真实路径 文件名真实)
				var filePath = fileInput.value;
				var fileName ;
				//window系统下的 路径分隔符 \
				if(filePath.indexOf('\\')>-1){
					var pathInfo = filePath.split('\\');
					fileName =  pathInfo[pathInfo.length-1];
				}else if(filePath.indexOf('/')>-1){
				//linux系统下的 路径分隔符 /
					var pathInfo = filePath.split('/');
					fileName =  pathInfo[pathInfo.length-1];					
				}else{
				//无路径
					fileName = filePath;
				}
				return fileName;
			};
			
			//获取文件扩展名
			K.getFileExt = function(fileName){
				var file = fileName.split('.');	
				return file[file.length-1];
			}
			
			
			K.create = function (){
				K.buildHTML();
			};			
			
			//创建kinFormUpload
			K.create();
			
		
		
	}	
	
})(jQuery)