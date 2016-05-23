/** 
@ Author :chuzhisheng 
@ Date : 2015-8-14 
@ Version : 1.0 
*/
(function(){

	/**
	 * 创建DMGold项目对象
	 */
	DMGold = {} ;
	$.extend(DMGold,{
		ajax:function(options){
			var datas=null;
			//如果参数serialize的值为true，则序列化表单传到后台，默认不序列化表单
			if(options["serialize"]){
                if(options["formId"]){//传了formId则按id取form表单
				 datas = $("#" + options["formId"]).serialize();
                }else{//没传formId则取第一个表单
                datas = $(document.forms[0]).serialize();
                }
			}
			//默认设置
			var defaultOptions={
					type:"post",
					async:false,
					dataType:"json",
					data:datas
			};
			
			options=$.extend(defaultOptions,options);
			//请求后台
			$.ajax({
				type:options["type"],
				async: options["async"],
				dataType:options["dataType"],
				url:options["url"],
				data:options["data"],
				success:function(data){
					//判断是否为表单重复提交，是否未登录
					if(data&&("600001"==data.code||'200001'==data.code)){
						dm.alert(data.description);
					}
					//操作成功
					if(typeof (options["success"]) == "function"){
						options["success"](data);
					}
				},
				error:function(data){
					if(typeof (options["error"]) == "function"){
						options["error"](data);
						return false;
					}
					//存在非法字符处理
					if(data.responseText){
						if(data.responseText.match("<script>")){
							window.alert = dm.alert;//同一提示方式
							eval(data.responseText.replace("<script>","").replace("</script>",""));
							return false;
						}
					}
					window.location.href='login.do';
				}
			});
		},
		
		/**
		 * 上传图片时，预览图片
		 * 
		 * 
		 * @param picture    上传file的id
		 * @param showPicDiv   用来预览图片的div的id
		 * @param newImg   图片的id
		 * @param imgF   <image>this对象
		 * @returns {Boolean}
		 */
		setImagePreview:function(picture,showPicDiv,newImg,imgF){
			var docObj=document.getElementById(picture);
			var imgObjPreview=document.getElementById(newImg);
			if(docObj.files && docObj.files[0]){
				//火狐下，直接设img属性
				if(imgF){
					imgObjPreview.style.display = 'block';
					imgObjPreview.style.width = $("#"+newImg).css("width");
					imgObjPreview.style.height = $("#"+newImg).css("height"); 
				}else{
					imgObjPreview.style.display = 'block';
					imgObjPreview.style.width = '200px';
					imgObjPreview.style.height = '80px';                    
				}
				//imgObjPreview.src = docObj.files[0].getAsDataURL();
				//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式  
				imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
			}else{
				//IE下，使用滤镜
				docObj.select();
				var imgSrc = document.selection.createRange().text;
				var localImagId = document.getElementById(showPicDiv);
				//必须设置初始大小
				if(imgF){
					imgObjPreview.style.display = 'block';
					imgObjPreview.style.width = $("#"+newImg).css("width");
					imgObjPreview.style.height = $("#"+newImg).css("height"); 
				}else{
					localImagId.style.width = "200px";
					localImagId.style.height = "80px";
				}
				//图片异常的捕捉，防止用户修改后缀来伪造图片
				try{
					localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
					localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
				}catch(e){
					dm.alert("您上传的图片格式不正确，请重新选择!");
					return false;
				}
				//imgObjPreview.style.display = 'none';
				document.selection.empty();
			}
			return true;
		},
		/**
		 * 分页组件
		 * 
		 * 初始化参数
		 * options:{"divId":"pageTargId",                分页组件所在div id
		 * 			"formId":"goldForm",                 分页组件引用的form查询框，将会使用form中的条件做分页查询
		 * 			"curPage":5,                         当前页
		 * 			"totalCount":5,                      总记录数
		 * 			"pageCount":5,                       总页数
		 *          "showPages":5,                       显示页数
		 *          "url":"getPanelList.do",             请求路径
		 *          "toPageCallBack":testCallBack1       跳转页回调函数
		 *          }
		 *  示例：
		 *      DMGold.PageTag.init({"divId":"pageTargId","formId":"goldForm","curPage":5,"totalCount":5,
		 *      "pageCount":5,"showPages":5,"url":"getPanelList.do","toPageCallBack":toPageCabk});  
		 *      funciton toPageCabk(data){
		 *      	//解析data
		 *          //初始化分页组件
		 *          DMGold.PageTag.init(options);
		 *      }
		 *        
		 * @author:tangguilin
		 */
		PageTag:{
			divId:"pageTagDiv",
			form:{},
			curPage:1,
			totalCount:1,
			pageCount:1,
			showPages:5,
			url:"#",
			toPageCallBack:{},
			init:function(options){
				$.extend(this,options);
				this.form = $("#"+options["formId"]);
				//获取组件div
				var pageTagDiv = $("#"+options["divId"]);
				//添加样式
				pageTagDiv.addClass("paging");
				//清空组件
				pageTagDiv.empty();
				//添加总记录数
				pageTagDiv.append("总共&nbsp;<span class=\"total orange ml5 mr5\">" + this.totalCount + "</span>&nbsp;条记录");
				//添加首页
				pageTagDiv.append("<a href=\"Javascript:DMGold.PageTag.toPage(1)\" class=\"pagebox\" >" + "首页 " + "</a>");
				//如果不是第一页显示‘上一页按钮’
				if(this.curPage>1){
					pageTagDiv.append("<a href=\"Javascript:DMGold.PageTag.toPage(" + (this.curPage - 1) + ")\" class=\"pagebox\" >" + "上一页" + "</a>");
				}
				if(this.pageCount<=this.showPages+2){
					for(var i = 1;i<=this.pageCount;++i){
						if(i==this.curPage){
							pageTagDiv.append("<font class=\"cpagebox\">" + i + "</font>");
						}else{
							pageTagDiv.append("<a href=\"Javascript:DMGold.PageTag.toPage(" + i + ")\" class=\"pagebox\">" + i + "</a>");
						}
					}
				}
				else if(this.curPage<this.showPages){
					for(var i=1;i<=this.showPages;++i){
						if(i==this.curPage){
							pageTagDiv.append("<font class=\"cpagebox\">" + i + "</font>");
						}else{
							pageTagDiv.append("<a href=\"Javascript:DMGold.PageTag.toPage(" + i + ")\" class=\"pagebox\">" + i + "</a>");
						}
					}
					pageTagDiv.append("<font class=\"vpagebox\">...</font>");
					pageTagDiv.append("<a href=\"Javascript:DMGold.PageTag.toPage(" + this.pageCount + ")\" class=\"pagebox\">" + this.pageCount + "</a>");
				
				}else if(this.curPage > this.pageCount - this.showPages + 1){
					pageTagDiv.append("<a href=\"Javascript:DMGold.PageTag.toPage(" + 1 + ")\" class=\"pagebox\">" + 1 + "</a>");
					pageTagDiv.append("<font class=\"vpagebox\">...</font>");
		            for (var i = this.pageCount - this.showPages + 1; i <= this.pageCount; ++i)
		            {
		                if (i == this.curPage)
		                {
		                	pageTagDiv.append("<font class=\"cpagebox\">" + i + "</font>");
		                }
		                else
		                {
		                	pageTagDiv.append("<a href=\"Javascript:DMGold.PageTag.toPage(" + i + ")\" class=\"pagebox\">" + i + "</a>");
		                }
		            }
				}else{
					pageTagDiv.append("<a href=\"Javascript:DMGold.PageTag.toPage(" + 1 + ")\" class=\"pagebox\">" + 1 + "</a>");
					pageTagDiv.append("<font class=\"vpagebox\">...</font>");
		            var offset = Math.ceil((this.showPages - 2) / 2);
		            for (var i = this.curPage - offset; i <= this.curPage + offset; ++i)
		            {
		                if (i == this.curPage)
		                {
		                	pageTagDiv.append("<font class=\"cpagebox\">" + i + "</font>");
		                }
		                else
		                {
		                	pageTagDiv.append("<a href=\"Javascript:DMGold.PageTag.toPage(" + i + ")\" class=\"pagebox\">" + i + "</a>");
		                }
		            }
		            pageTagDiv.append("<font class=\"vpagebox\">...</font>");
		            pageTagDiv.append("<a href=\"Javascript:DMGold.PageTag.toPage(" + this.pageCount + ")\" class=\"pagebox\">" + this.pageCount + "</a>");
				}
				if(this.curPage!=this.pageCount){
					pageTagDiv.append("<a href=\"Javascript:DMGold.PageTag.toPage(" + (this.curPage + 1) + ")\" class=\"pagebox\" >" + "下一页 " + "</a>");
				}

				pageTagDiv.append("<a href=\"Javascript:DMGold.PageTag.toPage(" + this.pageCount + ")\" class=\"pagebox\" >" + "尾页 " + "</a>");
				pageTagDiv.append(
		            "转到<input type='text' maxlength='7'  class='page_input' style=\"ime-mode: disabled;\"  id='_pageNumz' onkeyup=\"this.value=this.value.replace(/\\D/g,'')\"  onafterpaste=\"this.value=this.value.replace(/\\D/g,'')\" onKeyPress=\" return DMGold.PageTag.putPageCode(this,event)\" />页 \n");
				pageTagDiv.append(
		            "<input type='button' value='确定' class=\"btn_ok\" onclick=\"DMGold.PageTag.toPage($(this).siblings('.page_input').val())\"/>");
			},
			/**
			 * 页跳转
			 * @param p
			 */
			putPageCode:function(inp,event){
				var keynum;
				//浏览器兼容性问题
				if(window.event) // IE
					{
					keynum = event.keyCode
					}
				else if(event.which) // Netscape/Firefox/Opera
					{
					keynum = event.which
					}
				if(keynum == 8) return true;
				if (keynum == 13)
					DMGold.PageTag.toPage(inp.value);
				if(inp.value){
					if (keynum < 48 || keynum > 57) 
						return false;
				}else{
					if (keynum < 49 || keynum > 57) 
						return false;
				}
				
	            if (parseInt(inp.value?inp.value*10:0)+parseInt(keynum-48) >this.pageCount){
	            	return false;
	            }	
			},
			toPage : function(page){
				if(!page||page<0||page>this.pageCount){
					dm.alert("跳转页码有误！");
					return;
				}
				var reqData = this.form.serialize();
				//请求后台
				$.ajax({
					type:"POST",
					async:false,
					dataType:"json",
					url:this.url,
					data:reqData+"&reqPageNum="+page,
					success:function(data){
						DMGold.PageTag.toPageCallBack(data);
					},
					error:function(data){
						dm.alert("登录超时，请重新登录！");
					}
				});
			},
			/**
			 * 加载统计数据--克重
			 * statIds:{statid:''} 页面对应的id
			 * statData:{satat:''} 统计数据
			 * unit('0.00') 默认单位精度
			 * eg : initWeightStat({"weiId":null,"totId":null},data.statResult);
			 */
			initStat:function(statIds,statData,unit){
				if(!statData){
					//当统计数据为空值，添加默认值
					for(var index in statIds){
						$("#"+index).empty();
						$("#"+index).append(unit);//元精度
					}
				}
				//当统计数据不为空时
				for(var index in statIds){
					var stat = statData[index];
					//当统计数据为null或==0时
					if(!stat||stat==0){
						$("#"+index).empty();
						$("#"+index).append(unit);//元精度
					}else{
						//加载数据
						$("#"+index).empty();
						$("#"+index).append(stat);//具体值
					}
				}
			}
		},
		
		
		/**
		 * 分页组件----用于页面同时显示多个列表进行分页
		 * 
		 * 初始化参数
		 * options:{"divId":"pageTargId",                分页组件所在div id
		 * 			"formId":"goldForm",                 分页组件引用的form查询框，将会使用form中的条件做分页查询
		 * 			"curPage":5,                         当前页
		 * 			"totalCount":5,                      总记录数
		 * 			"pageCount":5,                       总页数
		 *          "showPages":5,                       显示页数
		 *          "url":"getPanelList.do",             请求路径
		 *          "toPageCallBack":testCallBack1       跳转页回调函数
		 *          }
		 *  示例：
		 *      DMGold.PageTag.init({"divId":"pageTargId","formId":"goldForm","curPage":5,"totalCount":5,
		 *      "pageCount":5,"showPages":5,"url":"getPanelList.do","toPageCallBack":toPageCabk});  
		 *      funciton toPageCabk(data){
		 *      	//解析data
		 *          //初始化分页组件
		 *          DMGold.PageTag.init(options);
		 *      }
		 *        
		 * @author:huxingwei
		 */
		PageTags:{
			divId:"pageTagDiv",
			form:{},
			curPage:1,
			totalCount:1,
			pageCount:1,
			showPages:5,
			url:"#",
			toPageCallBack:{},
			callBacks:[],
			push:function(options){
				var object={'divId':options["divId"],'formId':options["formId"],'func':options["toPageCallBack"],"url":options["url"]};
				this.callBacks.push(object);
			},
			get:function(key){
				var map=this.callBacks;
				if(map){
					for(i in map){
						var object = map[i];
					    if(object["divId"]==key){
					    	return object;
					    }
					}
				}
				return null;
			},
			init:function(options){
				$.extend(this,options);
				var pageId=options["divId"];
				this.form = $("#"+options["formId"]);
				this.push(options);
				//获取组件div
				var pageTagDiv = $("#"+options["divId"]);
				//添加样式
				pageTagDiv.addClass("paging");
				//清空组件
				pageTagDiv.empty();
				//添加总记录数
				pageTagDiv.append("总共&nbsp;<span class=\"total orange ml5 mr5\">" + this.totalCount + "</span>&nbsp;条记录");
				//添加首页
				pageTagDiv.append("<a href=\"Javascript:DMGold.PageTags.toPage(1,'"+pageId+"')\" class=\"pagebox\" >" + "首页 " + "</a>");
				//如果不是第一页显示‘上一页按钮’
				if(this.curPage>1){
					pageTagDiv.append("<a href=\"Javascript:DMGold.PageTags.toPage(" + (this.curPage - 1) +",'"+pageId+"')\" class=\"pagebox\" >" + "上一页" + "</a>");
				}
				if(this.pageCount<=this.showPages+2){
					for(var i = 1;i<=this.pageCount;++i){
						if(i==this.curPage){
							pageTagDiv.append("<font class=\"cpagebox\">" + i + "</font>");
						}else{
							pageTagDiv.append("<a href=\"Javascript:DMGold.PageTags.toPage(" + i+",'"+pageId+"')\" class=\"pagebox\">" + i + "</a>");
						}
					}
				}
				else if(this.curPage<this.showPages){
					for(var i=1;i<=this.showPages;++i){
						if(i==this.curPage){
							pageTagDiv.append("<font class=\"cpagebox\">" + i + "</font>");
						}else{
							pageTagDiv.append("<a href=\"Javascript:DMGold.PageTags.toPage(" + i +",'"+pageId+ "')\" class=\"pagebox\">" + i + "</a>");
						}
					}
					pageTagDiv.append("<font class=\"vpagebox\">...</font>");
					pageTagDiv.append("<a href=\"Javascript:DMGold.PageTags.toPage(" + this.pageCount +",'"+pageId+ "')\" class=\"pagebox\">" + this.pageCount + "</a>");
				
				}else if(this.curPage > this.pageCount - this.showPages + 1){
					pageTagDiv.append("<a href=\"Javascript:DMGold.PageTags.toPage(" + 1 +",'"+pageId+ "')\" class=\"pagebox\">" + 1 + "</a>");
					pageTagDiv.append("<font class=\"vpagebox\">...</font>");
		            for (var i = this.pageCount - this.showPages + 1; i <= this.pageCount; ++i)
		            {
		                if (i == this.curPage)
		                {
		                	pageTagDiv.append("<font class=\"cpagebox\">" + i + "</font>");
		                }
		                else
		                {
		                	pageTagDiv.append("<a href=\"Javascript:DMGold.PageTags.toPage(" + i +",'"+pageId+ "')\" class=\"pagebox\">" + i + "</a>");
		                }
		            }
				}else{
					pageTagDiv.append("<a href=\"Javascript:DMGold.PageTags.toPage(" + 1 +",'"+pageId+ "')\" class=\"pagebox\">" + 1 + "</a>");
					pageTagDiv.append("<font class=\"vpagebox\">...</font>");
		            var offset = Math.ceil((this.showPages - 2) / 2);
		            for (var i = this.curPage - offset; i <= this.curPage + offset; ++i)
		            {
		                if (i == this.curPage)
		                {
		                	pageTagDiv.append("<font class=\"cpagebox\">" + i + "</font>");
		                }
		                else
		                {
		                	pageTagDiv.append("<a href=\"Javascript:DMGold.PageTags.toPage(" + i +",'"+pageId+ "')\" class=\"pagebox\">" + i + "</a>");
		                }
		            }
		            pageTagDiv.append("<font class=\"vpagebox\">...</font>");
		            pageTagDiv.append("<a href=\"Javascript:DMGold.PageTags.toPage(" + this.pageCount +",'"+pageId+ "')\" class=\"pagebox\">" + this.pageCount + "</a>");
				}
				if(this.curPage!=this.pageCount){
					pageTagDiv.append("<a href=\"Javascript:DMGold.PageTags.toPage(" + (this.curPage + 1) +",'"+pageId+ "')\" class=\"pagebox\" >" + "下一页 " + "</a>");
				}

				pageTagDiv.append("<a href=\"Javascript:DMGold.PageTags.toPage(" + this.pageCount +",'"+pageId+ "')\" class=\"pagebox\" >" + "尾页 " + "</a>");
				pageTagDiv.append(
		            "转到<input type='text' maxlength='7'  class='page_input' style=\"ime-mode: disabled;\"  id='_pageNumz' onkeyup=\"this.value=this.value.replace(/\\D/g,'')\"  onafterpaste=\"this.value=this.value.replace(/\\D/g,'')\" onKeyPress=\"DMGold.PageTags.putPageCode(this,event),'"+pageId+"'\" />页 \n");
				pageTagDiv.append(
		            "<input type='button' value='确定' class=\"btn_ok\" onclick=\"DMGold.PageTags.toPage($(this).siblings('.page_input').val(),'"+pageId+"')\"/>");
			},
			/**
			 * 页跳转
			 * @param p
			 */
			putPageCode:function(inp,event){
				if (event.keyCode == 13)
					DMGold.PageTags.toPage(inp.value);
				if(inp.value){
					if (event.keyCode < 48 || event.keyCode > 57) 
						event.returnValue = false;
				}else{
					if (event.keyCode < 49 || event.keyCode > 57) 
						event.returnValue = false;
				}
				
	            if (parseInt(inp.value?inp.value*10:0)+parseInt(event.keyCode-48) >this.pageCount)
	            	event.returnValue = false;
			},
			toPage : function(page,pageId){
				
				var object=this.get(pageId);
				if(!page||page<0||page>this.pageCount){
					dm.alert("跳转页码有误！");
					return;
				}
				var reqData =$("#"+object["formId"]).serialize();
				//请求后台
				$.ajax({
					type:"POST",
					async:false,
					dataType:"json",
					url:object["url"],
					data:reqData+"&reqPageNum="+page,
					success:function(data){
						object["func"](data);
					},
					error:function(data){
						dm.alert("登录超时，请重新登录！");
					}
				});
			}
		},
		
		/**
		 * 字符超过指定长度截取显示'...'
		 * eg: 添加属性：limit= 40
		 */
		limit:function(){
			var self = $("[limit]");
			self.each(function(){
				var objString = $(this).text().trim();
				var objLength = $(this).text().length;
				var num = $(this).attr("limit");
				if(objLength > num){
		            $(this).attr("title",objString);
					objString = $(this).text(objString.substring(0,num)+"......");
				}
			});
		}
	});
	
	
}).call(this);



jQuery.fn.extend({
    uploadPreview: function (opts) {
        var _self = this,
            _this = $(this);
        opts = jQuery.extend({
            Img: "ImgPr",
            Width: 210,
            Height: 125,
            ImgType: [ "jpg", "png"],
            Callback: function () {}
        }, opts || {});
        _self.getObjectURL = function (file) {
            var url = null;
            if (window.createObjectURL != undefined) {
                url = window.createObjectURL(file)
            } else if (window.URL != undefined) {
                url = window.URL.createObjectURL(file)
            } else if (window.webkitURL != undefined) {
                url = window.webkitURL.createObjectURL(file)
            }
            return url
        };
        _this.change(function () {
            if (this.value) {
            	var size=fileChange(this);
            	if(size>1000){   
            		dm.alert("图片太大，不能大于1M");  
            		return false;
            	}else if(size == 0){
            		dm.alert("文件大小验证未生效！\r\n启用此验证，请如下修改浏览器设置：工具->Internet选项->安全->本地Intranet->自定义级别->ActiveX控件和插件->对没有标记为安全的ActiveX控件进行初始化和脚本运行->启用！");  
            		return false;
            	} 
                if (!RegExp("\.(" + opts.ImgType.join("|") + ")$", "i").test(this.value.toLowerCase())) {
                    dm.alert("选择文件错误,图片类型必须是" + opts.ImgType.join("，") + "中的一种");
                    this.value = "";
                    return false;
                }
                if ($.browser.msie) {
                    try {
                        $("#" + opts.Img).attr('src', _self.getObjectURL(this.files[0]))
                    } catch (e) {
                        var src = "";
                        var obj = $("#" + opts.Img);
                        var div = obj.parent("div")[0];
                        _self.select();
                        if (top != self) {
                            window.parent.document.body.focus()
                        } else {
                            _self.blur()
                        }
                        src = document.selection.createRange().text;
                        document.selection.empty();
                        obj.hide();
                        obj.parent("div").css({
                            'filter': 'progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)',
                            'width': opts.Width + 'px',
                            'height': opts.Height + 'px'
                        });
                        div.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = src
                    }
                } else {
                    $("#" + opts.Img).attr('src', _self.getObjectURL(this.files[0]))
                }
                opts.Callback()
            }
        })
    }
});
       
function fileChange(target) {     
	var isIE = /msie/i.test(navigator.userAgent) && !window.opera;     
	var fileSize = 0;     
	if (isIE) {   
		try{
			target.select();
		    var filePath = document.selection.createRange().text;    
		    var fileSystem = new ActiveXObject("Scripting.FileSystemObject");         
		    var file = fileSystem.GetFile(filePath);      
		    fileSize = file.Size;
	  	}catch (e) {
			if(e.description=="Automation 服务器不能创建对象"){
				//opts.callBack({fileName:this.value,errorMsg:"文件大小验证未生效！\r\n启用此验证，请如下修改浏览器设置：工具->Internet选项->安全->本地Intranet->自定义级别->ActiveX控件和插件->对没有标记为安全的ActiveX控件进行初始化和脚本运行->启用！",fileSize:-1});
				fileSize=0;
			}
		}
	} else {
		fileSize = target.files[0].size;      
	}
	var size = fileSize / 1024;     
   	return size; 
     
} 
	
