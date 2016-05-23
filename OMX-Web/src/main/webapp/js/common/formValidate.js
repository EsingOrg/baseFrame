var dmCheck={
	/**************************************
	 * js通用表单校验工具
	 * @author:pengshihong
	 * @date:2015-3-18
	 *---------------------------
	 * 使用说明
	 * 支持校验的类型有
	 * 中文，英文，整数，金额，指定长度，是否为必填，email，自定义正则表达式，支持自定义错误消息。
	 * --------------------------
	 * 使用示例
	 * 1,在需要验证的页面引入此文件，并编写代码dmCheck.init("#formId");
	 * 2,中文，英文，整数，金额，是否必填，email的校验方式如下:
	 * 
	 * 中文
	 * <input type="text" validate="zh" info="zh:此项必须为中文" />
	 * 
	 * 英文
	 * <input type="text" validate="en" info="en:此项必须为英文" />
	 * 
	 * 校验 整数、金额、是否为必填、费率、email需要将上面 validate 属性的值分别依次修改为 z,amount,q,rate,email
	 * 数字范围取值  validate="range"  range="1,30"
	 * 身份证号码   validate="idCard"
	 * 图片链接	 validate="pic"
	 *  
	 * 若想同时校验中文和英文见如下
	 * <input type="text" validate="en|zh" info="en:此项必须为英文|zh:此项必需为中文" />
	 * 可以不定义info属性,会有默认的出错信息.
	 * 
	 * 长度校验  leng属性对长度进行限定
	 * <input type="text" validate="leng" leng="4,12" info="leng:长度必须在4-12位之间" />
	 * 
	 * 自定义正则校验
	 * <input type="text" reg="/^\d+$/" warning="格式不正确" />
	 * --------------------------
	 * version 2015-09-24 updateBy tangguilin
	 * gram  克重校验，不能超过三位小数
	 */
		
	regArray:{
		Require : /.+/,
		Email : /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
		Phone : /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/,
		//Mobile : /^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$/,
		Mobile:/^1[34578][0-9]{9}$/,
		Url : /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/,
		Currency : /^\d+(\.\d{1,2})?$/,
		Weight : /^\d+(\.\d{1,3})?$/,
		Sion:/^[0-9]{1}.[0-9]{1}.[0-9]{1}$/,
		Number : /^\d+$/,
		Zip : /^[1-9]\d{5}$/,
		PicLink:/.+\.(jpg|png|jpeg|bmp|png|gif)$/i,
		QQ : /^[1-9]\d{4,8}$/,
		Integer : /^[-\+]?\d+$/,
		Double : /^[-\+]?\d+(\.\d+)?$/,
		English : /^[A-Za-z]+$/,
		Chinese :  /^[\u0391-\uFFE5]+$/,
		Username : /^[a-z]\w{3,}$/i,
		UnSafe : /^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/,
		Rate:/^\d{0,2}(\.\d{1,2})?$/,
		IdCard:/^[0-9]{17}[0-9Xx]{1}$/,
	    Gram:/^\d+(\.\d{1,3})?$/
	},
	getInfo:function(obj){
		var infoArr=[];
		if(typeof($(obj).attr("info"))!="undefined"){
			var tempArr=$(obj).attr("info").split("|");
			for(var j=0;j<tempArr.length;j++){
				var dd=[];
				dd=tempArr[j].split(":");
				infoArr[dd[0]]=dd[1];
			}
		}
		return infoArr;
	},
	setInfo:function(obj,str,defaultInfo){
		var message=defaultInfo;
		if(typeof(str)!="undefined"){
			message=str;
		}
		this.tip(obj,message);
	},
	timeHandle:null,
	clearTip:function(){
		$('span.pop-con').remove();
	},
	waitClearTip:function(){
		if(this.timeHandle!=null){
			//alert("qing");
			clearTimeout(this.timeHandle);
		}
		this.timeHandle=setTimeout(function(){$('span.pop-con').remove();},6000);  
	},
	tip:function(obj, tip){
		if(this.timeHandle!=null){
			clearTimeout(this.timeHandle);
		}
		$("span.pop-con").remove();
		$(obj).before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">' + tip + '</div></span>');
		//定时清除校验提示
		setTimeout(function() {
			$("span.pop-con").fadeOut("slow");
		}, 3000);
	},
	initForAjax:function(formId){
		var that=this;
		$(formId+" input,"+formId+" select,"+formId+" textarea").live("blur",function(){ 
			var status=dmCheck.checkOne($(this));
			if(status){
				if($(this).attr("type") != "button" && $(this).attr("type") != "submit"){ 
					that.clearTip();
				}
			}
		});
		
		$(formId+" input,"+formId+" select,"+formId+" textarea").live("click",function(){
				that.waitClearTip();
		});
		
	},
	init:function(formId){
		
		var that=this;
		$(formId).bind("submit",function(){
			return dmCheck.check($(formId));
		});
		
		$(formId+" input,"+formId+" select,"+formId+" textarea").live("blur",function(){
			var status=dmCheck.checkOne($(this));
			if(status){
				if($(this).attr("type") != "button" && $(this).attr("type") != "submit"){ 
					that.clearTip();
				}
			}
		});
		
		$(formId+" input,"+formId+" select,"+formId+" textarea").live("click",function(){
				that.waitClearTip();
		});
		
	},
	//进行18位身份证的基本验证和第18位的验证
	checkidcard:function(idCard){
	    if (idCard.length == 18) {   
	        var a_idCard = idCard.split("");  // 得到身份证数组   
	        if(this.isValidityBrithBy18IdCard(idCard) && this.isTrueValidateCodeBy18IdCard(a_idCard)) { //进行18位身份证的基本验证和第18位的验证
	            return true;   
	        } else {   
	            return false;   
	        }
	    } else {
	        return false;   
	    }   
	},
	/**  
	 * 判断身份证号码为18位时最后的验证位是否正确  
	 * @param a_idCard 身份证号码数组  
	 * @return  
	 */  
	isTrueValidateCodeBy18IdCard:function(a_idCard) {  
	    var sum = 0;                              // 声明加权求和变量   
	    if (a_idCard[17].toLowerCase() == 'x') {   
	        a_idCard[17] = 10;                    // 将最后位为x的验证码替换为10方便后续操作   
	    }
	    for ( var i = 0; i < 17; i++) { 
	        sum += this.idCardConfig.Wi[i] * a_idCard[i];           // 加权求和   
	    }
	    valCodePosition = sum % 11;               // 得到验证码所位置   
	    if (a_idCard[17] == this.idCardConfig.ValideCode[valCodePosition]) {   
	        return true;   
	    } else {
	        return false;   
	    }
	},
	isValidityBrithBy18IdCard:function(idCard18){   
	    var year =  idCard18.substring(6,10);   
	    var month = idCard18.substring(10,12);   
	    var day = idCard18.substring(12,14);   
	    var temp_date = new Date(year, parseFloat(month)-1, parseFloat(day));   
	    // 这里用getFullYear()获取年份，避免千年虫问题   
	    if(temp_date.getFullYear() != parseFloat(year)   
	          || temp_date.getMonth() != parseFloat(month)-1   
	          || temp_date.getDate() != parseFloat(day)) { 
	            return false;   
	    } else {
	        return true;   
	    }
	},
	idCardConfig:{
		Wi:[ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ],    // 加权因子   
		ValideCode:[ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ]            // 身份证验证位值.10代表X  
	},
	checkOne:function(obj){
		point=this;
		var st=true;
		infoArr=[];
		that=obj;
		infoArr=point.getInfo(that);
		var k=that.attr("validate");
		if(typeof(k)!="undefined"){
			var arr=[];
			arr=k.split("|");
			for(var i=0;i<arr.length;i++){
				//email
				if(arr[i]=="email"){
					if(that.val()==""){
						st=true;
						//break;
					}else if(!dmCheck.regArray.Email.test(that.val())){
						var message="email格式不正确!";
						point.setInfo(that,infoArr['email'],message);
						st=false;
						break;			
					}
				}
				//中文
				if(arr[i]=="zh"){
					if(that.val()==""){
						st=true;
						//break;
					}else if(!dmCheck.regArray.Chinese.test(that.val())){
						var message="此项必须为中文!";
						point.setInfo(that,infoArr['zh'],message);
						st=false;
						break;			
					}
				}
				//费率(百分比)
				if(arr[i]=="rate"){
					if(that.val()==""){
						st=true;
						//break;
					}else if(!dmCheck.regArray.Rate.test(that.val())){
						var message="此项必须为小于100的小数且小数位数不超过2位";
						point.setInfo(that,infoArr['rate'],message);
						st=false;
						break;	
					}
				}
				//英文
				if(arr[i]=="en"){
					if(that.val()==""){
						st=true;
						//break;
					}else if(!dmCheck.regArray.English.test(that.val())){
						var message="此项必须为英文!";
						point.setInfo(that,infoArr['en'],message);
						st=false;
						break;			
					}
				}

				//校验金额
				if(arr[i]=="amount"){
					if(that.val()==""){
						st=true;
						//break;
					}else if(!dmCheck.regArray.Currency.test(that.val())){
						var message="此项必须为整数或小数且最多保留两位小数!";
						point.setInfo(that,infoArr['amount'],message);
						st=false;
						tempst=false;
						break;	
					}
				}
				
				//校验克重
				if(arr[i]=="weight"){
					if(that.val()==""){
						st=true;
						//break;
					}else if(!dmCheck.regArray.Weight.test(that.val())){
						var message="此项必须为整数或小数且最多保留三位小数!";
						point.setInfo(that,infoArr['weight'],message);
						st=false;
						tempst=false;
						break;	
					}
				}
				
				//校验版本号
				if(arr[i]=="sion"){
					if(that.val()==""){
						st=true;
						//break;
					}else if(!dmCheck.regArray.Sion.test(that.val())){
						var message="此项必须为类似1.1.1格式!";
						point.setInfo(that,infoArr['sion'],message);
						st=false;
						tempst=false;
						break;	
					}
				}
				
				//整数校验
				if(arr[i]=="z"){
					if(that.val()==""){
						st=true;
						//break;
					}else if(!dmCheck.regArray.Number.test(that.val())){
						var message="此项必须为整数!";
						point.setInfo(that,infoArr['z'],message);
						st=false;
						break;	
					}
				}
				//手机号码校验
				if(arr[i]=="m"){
					if(that.val()==""){
						st=true;
						//break;
					}else if(!dmCheck.regArray.Mobile.test(that.val())){
						var message="手机号码格式不正确!";
						point.setInfo(that,infoArr['m'],message);
						st=false;
						break;	
					}
				}
				//图片链接
				if(arr[i]=="pic"){
					if(that.val()==""){
						st=true;
						//break;
					}else if(!dmCheck.regArray.PicLink.test(that.val())){
						var message="图片链接格式不正确!";
						point.setInfo(that,infoArr['pic'],message);
						st=false;
						break;	
					}
				}
				//身份证号码校验
				if(arr[i]=="idCard"){
					if(that.val()==""){
						st=true;
						//break;
					}else if(!dmCheck.checkidcard(that.val())){
						var message="身份证号码不正确!";
						point.setInfo(that,infoArr['idCard'],message);
						st=false;
						break;	
					}
				}
				//校验长度
				if(arr[i]=="leng"){
					if(that.val()==""){
						st=true;
						tempst=true;
						//break;
					}else if(that.attr("leng")!="undefined"){
						var lengStr=that.attr("leng");
						if(lengStr.indexOf(",")==-1){
							if(that.val().length!=lengStr){
								st=false;
								tempst=false;
								dmCheck.tip(that, "长度必须为"+lengStr);
								break;
							}
						}else{
							var s=that.attr("leng").split(",");
							if(that.val().length<s[0] || that.val().length>s[1]){
								st=false;
								tempst=false;
								dmCheck.tip(that, "长度必须在"+s[0]+"-"+s[1]+"个字符之间");
								break;
							}
						}
					}
					
				}
				//范围
				if(arr[i]=="range"){
					if(that.val()==""){
						st=true;
						tempst=true;
					}else if(that.attr("range")!="undefined"){
						var s=that.attr("range").split(",");
						if(parseFloat(that.val()) < s[0] || parseFloat(that.val()) > s[1]){
							st = false;
							tempst = false;
							dmCheck.tip(that, "此项的数字必须在"+s[0]+"-"+s[1]+"之间");
							break;
						}
					}
					
				}
				//必填
				if(arr[i]=="q"){
					if(that.val()==""){
						var message="此项不能为空";
						point.setInfo(that,infoArr['q'],message);
						return false;
					}
				}
				//克 重校验  千分位精度
				if(arr[i]=="gram"){
					if(that.val()==""){
						st=true;
						//break;
					}else if(!dmCheck.regArray.Gram.test(that.val())){
						var message="无效克重值,不能超过三位小数!";
						point.setInfo(that,infoArr['gram'],message);
						st=false;
						tempst=false;
						break;	
					}
				}
				//最小值校验
				if(arr[i]=="minNum"){
					if(that.val()==""){
						st=true;
						tempst=true;
					}else if(that.attr("minNum")!="undefined"){
						var s=that.attr("minNum");
						if(parseFloat(that.val()) < s ){
							st = false;
							tempst = false;
							dmCheck.tip(that, "此项的数字必须大于"+s);
							break;
						}
					}
					
				}
			}
			
		}

		var reg=that.attr("reg");
		if(typeof(reg)!="undefined"){
			//用户自定义正则
			if(that.val()==""){
				return true;
			}
			reg=eval(reg);
			var warning=that.attr("warning");
			if(typeof(reg)!="undefined"){
				if(typeof(warning)=="undefined"){
					warning="此项格式不正确!";
				}
				if(!reg.test(that.val())){
					st=false;
					this.tip(that, warning);
					return st;
				}
			}
		}
		return st;
		
	},
	check:function(a){
		var obj=true;
		$(a).find("input:text,input:password,select,textarea").each(function(){
			if(!dmCheck.checkOne($(this))){
				$(this).focus();
				obj=false;
				return false;
			}
		});
		return obj;
	},
	returnObj:function(a){
		var obj = null;
		$(a).find("input:text,input:password,select,textarea").each(function(){
			if(!dmCheck.checkOne($(this))){
				obj = this;
				return false;
			}	
		});
		return obj;
	}
};