

function setTab(name,cursel,n){
	for(var i=1;i<=n;i++){
	var menu=document.getElementById(name+i);
	var con=document.getElementById("con_"+name+"_"+i);
	menu.className=i==cursel?"hover":"";
	if (con)con.style.display=i==cursel?"block":"none";
	}
}

/*
	//向上箭头
	$(document).ready(function(){
		$(".guiz_table .ico").click(function(){//点击til
			//$(this).next().slideToggle("slow,10");//当前的下一个显示或隐藏
			$(this).next().slideToggle();//当前的下一个显示或隐藏
			if($(this).hasClass("up")){//如果有UP的样式
				$(this).removeClass("up");//就移除
			}else{
				$(this).addClass("up");//如果没有就加上
			}
		  });
	});
	
	*/

	//向上箭头
	$(document).ready(function(){
		$(".guiz_table .ico .i").click(function(){//点击til
			//$(this).next().slideToggle("slow,10");//当前的下一个显示或隐藏
			that=$(this).closest("td");
			that.next().slideToggle();//当前的下一个显示或隐藏
			if(that.hasClass("up")){//如果有UP的样式
				that.removeClass("up");//就移除
			}else{
				that.addClass("up");//如果没有就加上
			}
		  });
	});
	

String.prototype.trim = function() {
  return this.replace(/(^\s*)|(\s*$)/g, "");   
};

String.prototype.replaceAll = function (AFindText,ARepText) {
	raRegExp = new RegExp(AFindText, "g");
	return this.replace(raRegExp,ARepText);
};

String.prototype.startsWith = function(prefix) {
	return (this.indexOf(prefix) == 0);
};

String.prototype.toJSON = function() {
	return eval("(" + this + ")");
};

var week = ['日','一','二','三','四','五','六']; 
Date.prototype.toString = function() {
	return this.getFullYear()+"年"+
	      (this.getMonth()+1)+"月"+
	       this.getDate()+"日 星期"+
	       week[this.getDay()]+" " +
	       this.getHours()+":"+
	       this.getMinutes()+":"+
	       this.getSeconds();
};

function setClass(element, cls) {
	if (element) {
		element.className = cls;
		element.setAttribute("class", cls);
	}
}

function clearClass(element) {
	if (element) {
		element.className = "";
		element.removeAttribute("class");
	}
}

function getXMLHttpRequest() {
	return window.ActiveXObject ? 
		new ActiveXObject("Microsoft.XMLHTTP") : 
		new XMLHttpRequest();
}

function getMillis() {
	return new Date().getTime();
}

function toJSON(text) {
	return eval("(" + text + ")");
}

var pwd_regex = /^[_0-9a-zA-Z]{6,16}$/;
var count_regex = /^\+?[1-9][0-9]*$/;
var accept_pic = "gif,jpg,jpeg,bmp,png";
var number_regex = /^(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/;
var zipCode_regex = /^[0-9]{6}$/;
var mobile_regex = new RegExp("^\\d{11}(/\\d{11})*$");
var email_regex = /^[a-zA-Z0-9]([a-zA-Z0-9]*[-_.]?[a-zA-Z0-9]+)+@([\w-]+\.)+[a-zA-Z]{2,}$/;
var date_regex = /^(\d){4}-(\d){2}-(\d){2}$/;
var time_regex = /^\d{2}(:\d{2}){2}$/;
var isIE = document.uniqueID ? true : false; 
var url_regex = new RegExp("^((https|http|ftp|rtsp|mms)?://)" 
        + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@ 
      + "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184 
      + "|" // 允许IP和DOMAIN（域名）
      + "([0-9a-z_!~*'()-]+\.)*" // 域名- www. 
      + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名 
      + "[a-z]{2,6})" // first level domain- .com or .museum 
      + "(:[0-9]{1,4})?" // 端口- :80 
      + "((/?)|" // a slash isn't required if there is no file name 
      + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$");

function checkPwd(pwd) {
	return pwd_regex.test(pwd);
}

function checkUrl(url) {
	return url_regex.test(url);
}

function isValidEmail(email) {
  return email_regex.test(email);
}

function isDate(value) {
	return date_regex.test(value);
}

function isTime(value) {
	return time_regex.test(value);
}

function isEmail(value) {
	return email_regex.test(value);
}

function isEmpty(value) {
	return (value == undefined || value.trim() == "");
}

function isNotNumber(input) {
	var value = input.trim();
	return (value == "" || isNaN(value));
}

function isNotPositiveNumber(input) {
	var value = input.trim();
	return (isNotNumber(value) || parseInt(value) < 0);
}

function notEmpty(str) {
	return (typeof(str) != "undefined" && str.trim() != "");
}

function setCookie(name, value) {
	var args = setCookie.arguments;
	var len = setCookie.arguments.length;
	var expires = "";
	if (len > 2) {
		var millis = args[2]*1000;
		var expDate = new Date();
		expDate.setTime(expDate.getTime() + millis);
		expires = ";expires="+expDate.toGMTString();
	}
	var path = (len>3) ? args[3] : "";
	var domain = (len>4) ? args[4] : "";
	var secure = (len>5) ? args[5] : false;
	document.cookie = name+"="+escape(value) + expires +
		((path=="") ? "" : (";path="+path)) + 
		((domain=="") ? "" : (";domain="+domain)) +
		(secure ? ";secure" : "");
}

function getCookie(name) {
	var mycookie = unescape(document.cookie);
	var cindex = mycookie.indexOf(name + "=");
	if (cindex != -1) {
	    var cstart = cindex+name.length + 1;
	    var cend = mycookie.indexOf(";", cstart);
	    if (cend == -1) 
	        cend = mycookie.length;
	    return mycookie.substring(cstart, cend);
	}
	return null;
}

function delCookie(name) { 
	var time = new Date(); 
	time.setTime(time.getTime() - 1); 
	var value = getCookie(name); 
	document.cookie = name + "=" + value + ";expires=" + time.toGMTString(); 
}

function createOption(name, value) {
	var option = document.createElement("option");
	option.setAttribute("value", value);
	option.appendChild(document.createTextNode(name));
	return option;
}

function clearOptions(selectId, leaveNum) {
	if (leaveNum == undefined)
		leaveNum = 0;
	var select = document.getElementById(selectId);
	if(select!=null){
		while (select.options.length > leaveNum)
			select.removeChild(select.options[leaveNum]);
	}
}

function createTd(text) {
	var td = document.createElement("td");
	td.innerHTML = text;
	return td;
}

function clearRows(tbodyId, leaveNum) {
	if (leaveNum == undefined)
		leaveNum = 0;
	var tbody = document.getElementById(tbodyId);
	var rows = tbody.getElementsByTagName("TR");
	while (rows.length > leaveNum)
		tbody.removeChild(rows[leaveNum]);
}

function changeCaptcha(id, url) {
   document.getElementById(id).src = "captcha?ran=" + Math.random();
}

//in order to compatible IE6 and jquery
function auto() {}

var ind_vst = getCookie("ind_vst");
if (ind_vst == null || ind_vst == "") {
	ind_vst = getRndVal();
	var expDate = new Date();
	expDate.setTime(expDate.getTime() + 10*365*24*60*60*1000);
	document.cookie = "ind_vst="+escape(ind_vst) + ";expires="+expDate.toGMTString() + ";path=/";
}

function getRndVal() {
	var val = parseInt(Math.random()*10000000000) + 5180000000000;
	return val.toString(16);
}

function setOrder(formid, key, order, arg1){
	if(!formid || !$("#"+formid) || !key)	return;
	if(arg1){
		$('input[name$=".order"]').attr('value',0);
	}
	$('input[name="'+key+'.order"]').attr('value',order);
	$("#"+formid).submit();
}

var dm={
		//js弹出框
		//author:pengshihong
		//date:2015-2-5
		/*
		 dm.alert()
		  示例1：dm.alert("您的申请已提交");
		  示例2:
		 dm.alert("您的申请已提交",{
			title:"提示",				//弹窗的标提
			okName:"确定",			//如同alert确定按钮的value
			picClass:"d_error",		//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
			notHaveClose:"xxx",     //不定义此属性则有“x”关闭按钮
			callback:function(){	//按确定后执行的函数
				alert("回调函数");
			}
		});
		*/
		
		/*
		 dm.desc(title,msg)
		  示例1：dm.desc("原因","出现异常");
		*/
		
		/*
		dm.confirm()
		 示例1:dm.confirm("您确定通过认证吗?")
		示例2:
		 dm.confirm("您确定通过认证吗?",{
			title:"询问",				//标题
			okName:"确定",			//如同confirm确定按钮的value
			cancleName:"取消",		//如同confirm取消按钮的value
			callback:function(){	//按确定的执行的函数
				alert("回调函数");
			}
		});
		示例3: 
		 dm.confirm("在未完成操作前请不要关闭此窗口<br>在完成操作后，请根据您操作的情况点击下面按钮",{
			title:"放款提示",			//标题	
			okName:"放款成功",			//如同confirm确定按钮的value
			otherName:"遇到问题",		//如同confirm另一个按钮的value
			callback:function(){	//确定按钮执行函数
				alert("回调函数");
			},
			otherCallback:function(){	//另一个按钮执行函数
				alert("回调函数");
			}
		});
		*/
		
		colse:function(){
			$("#bg,#duhua").remove();
			if(typeof(dm.alertOk)==='function'){
				dm.alertOk();
			}
		},
		colseAlert:function(){
			$("#bg,#duhua").remove();
		},
		alert:function(msg,option){
			if(typeof(option)!="undefined"){
				if(typeof(option.callback)!="undefined"){
					dm.alertOk=option.callback;
				}
				if(typeof(option.title)!="undefined"){
					dm.alertTitle=option.title;
				}
				if(typeof(option.okName)!="undefined"){
					dm.alertButtonName=option.okName;
				}
				if(typeof(option.picClass)!="undefined"){
					dm.alertPicClass=option.picClass;
				}
			}else{
				//默认给弹出框的图标为 感叹号
				dm.alertPicClass='d_doubt';
			}
			//判断 提示语中是否有成功的字样 有则出现 成功的图标
			if(msg.indexOf("成功") !=-1){
				dm.alertPicClass='d_succeed';
			}else if(msg.indexOf("失败") !=-1 || msg.indexOf("错误")!=-1 ||msg.indexOf("异常")!=-1||msg.indexOf("联系管理员")!=-1){
				dm.alertPicClass='d_error';
			}
						
			var dh="<div class=\"popup_bg\" id=\"bg\"></div>"+
			"<div class=\"dialog\" style=\"margin: -170px 0 0 -225px\" id=\"duhua\">"+
			  "<div class=\"clearfix\" >"+
			      "<div class=\"title\">";
			if(typeof(option)=="undefined" || typeof(option.notHaveClose)=="undefined"){
				dh +="<a href=\"#\" onClick=\"dm.colseAlert()\" class=\"out\"></a>";
			}
			dh += dm.alertTitle+"</div>"+
			      "<div class=\"cotent clearfix\">"+         
			         "<div class=\"conn\"><i class='"+dm.alertPicClass+"'></i>"+msg+"</div>"+
			         "<div class=\"btn\"><a href=\"#\" class=\"btn_cs\" onClick=\"dm.colse()\" >"+dm.alertButtonName+"</a></div>"+
			      "</div>"+     
			    "</div>"+
			"</div>";
			$("body").append(dh);
		},
		desc:function(title,msg){
			var dh = "<div class='popup_bg' id='bg'></div>";
			dh += "<div class='dialog' id='duhua'>";
			dh += "<div class='clearfix'>";
			dh += "<div class='title'><a href='javascript:void(0);' class='out' onclick='dm.colse();'></a>"+title+"</div>";
			dh += "<div class='cotent'>"+msg+"</div>";
			dh += "<div class='btn'><a href='javascript:void(0);' class='btn_cs' onclick='dm.colse();'>确定</a><a href='javascript:void(0);' class='btn_cs ml20' onclick='dm.colse();'>取消</a></div> ";
			dh += "</div>";
			dh += "</div>";
			$("body").append(dh);
		},
		confirm:function(msg,option){
			dm.alertPicClass = "d_perfect";
			if(typeof(option)!="undefined"){
				if(typeof(option.callback)!="undefined"){
					dm.confirmOkCallback=option.callback;
				}
				if(typeof(option.title)!="undefined"){
					dm.confirmTitle=option.title;
				}
				if(typeof(option.okName)!="undefined"){
					dm.confirmOkButton=option.okName;
				}
				
				if(typeof(option.cancleName)!="undefined"){
					dm.confirmCancleButton =option.cancleName;
				}
			}

			var dh="<div class=\"popup_bg\" id=\"bg2\"></div>"+
			"<div class=\"dialog\" style=\"margin: -170px 0 0 -225px\" id=\"duhua2\">"+
			  "<div class=\"clearfix\" >"+
			      "<div class=\"title\"><a href=\"#\" onClick=\"dm.closeConfirm()\" class=\"out\"></a>"+dm.confirmTitle+"</div>"+
			      "<div class=\"cotent clearfix\">"+         
			         "<div class=\"conn\"><i class='"+dm.alertPicClass+"'></i>"+msg+"</div>"+
			         "<div class=\"btn\"><a href=\"#\" class=\"btn_cs\" onClick=\"dm.confirmOk()\" >"+dm.confirmOkButton+"</a>" +
			         		"<a href=\"#\" onClick=\"dm.confirmCancle()\"  class=\"btn_cs ml20\">"+dm.confirmCancleButton+"</a></div>"+
			      "</div>"+     
			    "</div>"+
			"</div>";

			$("body").append(dh);
		},
		confirmOtherOk:function(msg,option){
			if(typeof(option)!="undefined"){
				if(typeof(option.callback)!="undefined"){
					dm.confirmOkCallback=option.callback;
				}
				if(typeof(option.title)!="undefined"){
					dm.confirmTitle=option.title;
				}
				if(typeof(option.okName)!="undefined"){
					dm.confirmOkButton=option.okName;
				}
				if(typeof(option.otherCallback)!="undefined"){
					dm.confirmOtherCallback=option.otherCallback;
				}
				if(typeof(option.otherName)!="undefined"){
					dm.confirmOtherButton =option.otherName;
				}
			}
			var dh = "<div class='popup_bg' id='bg2'></div>";
			dh += "<div class='dialog' style='margin: -80px 0 0 -225px' id='duhua2'>";
			dh += "<div class='clearfix'>";
			dh += "<div class='title'>"+dm.confirmTitle+"</div>";
			dh += "<div class='cotent clearfix'>";   
			dh += "<div class='conn'><i class='"+dm.alertPicClass+"'></i>"+msg+"</div>"; 
			dh += "<div class='btn'><a href='javascript:void(0);' onclick='dm.confirmOk()' class='btn_cs'>"+dm.confirmOkButton+"</a>" +
	        		"<a href='javascript:void(0);' onclick='dm.confirmOther()' class='btn_cs ml20'>"+dm.confirmOtherButton+"</a></div>";
			dh += "</div>";     
			dh += "</div>";
			dh += "</div>";

			$("body").append(dh);
		},
		confirmOk:function(){
			$("#bg2,#duhua2").remove();
			if(typeof(dm.confirmOkCallback)==='function'){
				dm.confirmOkCallback();
			}
		},
		confirmCancle:function(){
			$("#bg2,#duhua2").remove();
				return false;
		},
		confirmOther:function(){
			$("#bg2,#duhua2").remove();
			if(typeof(dm.confirmOtherCallback)==='function'){
				dm.confirmOtherCallback();
			}
		},
		closeConfirm:function(){
			$("#bg2,#duhua2").remove();
		},
		//对话框的图标
		alertPicClass:"d_perfect",
		alertOk:null,
		alertTitle:"提示",
		alertButtonName:"确定",
		ok:null,
		
		confirmOkCallback:null,
		confirmOtherCallback:null,
		confirmTitle:"询问",
		confirmOkButton:"确定",
		confirmCancleButton:"取消",
		confirmOtherButton:"遇到问题"
	};


//----显示修改密码UI----
function xgmmDialog(){
	$("body").append(modifyPwdFrame);
	$("#xgmmDialog").show();
}
//----显示修改密码UI----
function xgmmDialogHide(){
	$("#xgmmDialog").remove();
}
function xgmmSubmit(){
	
	var oldpassword = $("#xgmmForm input[name=oldpassword]").val();
	if(!oldpassword){
		$("#modifypwdmsgTD").html("原密码为空！").show();
		return false;
	}
	
	var newpassword = $("#xgmmForm input[name=newpassword]").val();
	if(!newpassword){
		$("#modifypwdmsgTD").html("密码为空！").show();
		return false;
	}
	
	if(!checkPwd(newpassword)){
		$("#modifypwdmsgTD").html("密码须为6~16个字符，区分大小写！").show();
		return false;
	}
	
	if(newpassword == oldpassword){
		$("#modifypwdmsgTD").html("新密码不能与原密码相同！").show();
		return false;
	}
	
	var repassword = $("#xgmmForm input[name=repassword]").val();
	if(!repassword || repassword != newpassword){
		$("#modifypwdmsgTD").html("两次输入的密码不一致！").show();
		return false;
	}
	
	$.ajax( { 
      type : "POST", 
      url : basePath+"updatePWD.do", 
      data : $("#xgmmForm").serialize(), 
      dataType:"json",
      success : function(result) {
      	if(result.code == "000000"){
      		$("#xgmmDialog").hide();
      		dm.alert("修改成功！",{
      			title:"提示",				//弹窗的标提
      			okName:"确定",			//如同alert确定按钮的value
      			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
      			callback:function(){	//按确定后执行的函数
      	      		setTimeout('window.location.reload();', 1000);
      			}
      		});
    	}else{
    		var obj = null;
    		if(result.code == "e01" || result.code == "e03"){
    			obj = $("#xgmmForm input[name='oldpassword']");
	   		}else if(result.code == "e04" || result.code == "e05"){
	   			obj = $("#xgmmForm input[name='newpassword']");
	   		}
			if(obj){
				tip(obj, result.description);
				obj.focus();
			}else{
				$("#modifypwdmsgTD").html(result.description).show();
			}
    	}
      } 
	});
  
}

var modifyPwdFrame ='<div id="xgmmDialog" style="display: none">'
			  +'<div class="popup_bg"></div>'
			  +'<div class="dialog">'
			  	+'<div class="clearfix">' 
			  		+'<div class="title"><a href="javascript:void(0);" class="out" onclick="xgmmDialogHide();"></a>修改密码</div>'
			  		+'<div class="cotent">'
			  			+'<form id="xgmmForm">'
			  				+'<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">'
			  					+'<tr>'
			  						+'<td valign="top" align="right"><span style="color:red;">*&nbsp;</span>原密码：</td>'
		  							+'<td><input name="oldpassword" type="password" class="input yhgl_input" /></td>'
	  							+'</tr>'
	  							+'<tr>'
	  								+'<td valign="top" align="right"><span style="color:red;">*&nbsp;</span>密码：</td>'
  									+'<td><input name="newpassword" type="password" class="input yhgl_input" /></td>'
								+'</tr>'
								+'<tr>'
									+'<td valign="top" align="right"><span style="color:red;">*&nbsp;</span>确认密码：</td>'
									+'<td><input name="repassword" type="password" class="input yhgl_input" /></td>'
								+'</tr>'
								+'<tr><td colspan="2" id="modifypwdmsgTD" style="display: none; text-align: center; color: red;"></td></tr>'
							+'</table>'
						+'</form>'
					  +'</div>'
					  +'<div class="btn"><a href="javascript:void(0);" class="btn_cs" onclick="xgmmSubmit();">提交</a><a href="javascript:void(0);" class="btn_cs ml20" onclick="xgmmDialogHide();">取消</a></div>' 
				  +'</div>'
			    +'</div>'
		      +'</div>';


function exportData(formid, url){
	if(!formid || !$("#"+formid))	return;
	var action = $("#"+formid).attr("action");
	$("#"+formid).attr("action",url).submit().attr("action",action);
//	$("#"+formid).attr("action",url).attr("target","_blank").submit().attr("action",action).attr("target","_self");
}

function tip(obj, tip){
	$("span.pop-con").remove();
	//$(obj).after('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">' + '<span class="red">'+tip + '</span>' + '</div></span>');
	$(obj).before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">' + tip + '</div></span>');
}

function clearTips(obj){
	var value =$("#"+obj).val();
	if(!isEmpty(value))
    {
		$("span.pop-con").remove();
    }
}

function clearTip(){
	$("span.pop-con").remove();
}

function addTip(obj, tip){
	$(obj).before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">' + '<span class="red">'+tip + '</span>' + '</div></span>');
	//$(obj).before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">' + tip + '</div></span>');
}

function clearCurrentTip(obj){
	if($(obj).prev().hasClass("pop-con")){
		$(obj).prev().remove();
	}
}

/*移除后台待办事项div
  var t=null;
  $("#taskDiv").live("mouseout",(function(){
	clearTimeout(t);  
	t=setTimeout(function(){$("#taskDiv").remove();},400);  
  })).live("mouseover",function(){ 
    if(t!=null) clearTimeout(t);  
    t=null;  
  }); 
  */
  
  /**
   * 首页待办事项跳转
   * @param topNo			顶级菜单序列
   * @param leftNo			左侧菜单序列
   * @param leftSubNo		左侧子菜单序列
   * @param urlLeft			左侧url
   * @param urlMain			右侧url
   * 
   */  
  function setMenu(topNo,leftNo,leftSubNo,urlLeft,urlMain){
	  topNo--;
	  leftNo--;
	  leftSubNo--;
	  parent.frames["bigFram"].cols= "210,*";
	  window.parent.frames["leftFrame"].location.href=urlLeft;
	  var topBody=$(window.parent.frames["topFrame"].document); 
	  topBody.find(".nav li a").removeClass("cur");
	  topBody.find(".nav li a").eq(topNo).addClass("cur"); 
	  setTimeout(function(){
		  var leftBody=$(window.parent.frames["leftFrame"].document);
		  if(leftBody.find(".main_nav .cell").eq(leftNo).find(".con").css("display")!="block"){
			  leftBody.find(".main_nav .cell").eq(leftNo).find(".til").click();
		  }
		  leftBody.find(".main_nav .cell").eq(leftNo).find(".con li").removeClass("hover");
		  leftBody.find(".main_nav .cell").eq(leftNo).find(".con li").eq(leftSubNo).addClass("hover");
		  window.location=urlMain;
	  },150);
  }
  
  var setCount=0;
  $(function(){
	setCount++;
	if(setCount==1){
		var win = window;
		var i=0;
		while(win.parent!=win){
			i++;
			win = win.parent;
		}
		if(i==1){
			if(window.name=="leftFrame"){
				 setTimeout(function(){
				 	var leftBody=$(window.parent.frames["leftFrame"].document);
				 	var elea=leftBody.find(".cell li a").eq(0);
				 	var til=elea.closest(".cell").find(".til");
				 	if(leftBody.find(".cell").length>0){
				 		if(leftBody.find(".cell .hover").length<1){
						 	if(elea.closest(".cell").find(".con").css("display")!="block"){
						 		til.click();
						 		window.parent.frames["mainFrame"].location.href=elea.attr("href");
						 		elea.closest("li").addClass("hover");
						 	}
				 		}
				 	}
				 },70);
			}
		}
	}
  });
  
  /*自定义属性 增加删除，鼠标移动效果*/
/*  $(function(){
  	 $('.infor .info').mouseover(function(){
            $(this).children().next().show();
  		  $(this).addClass("cur");
       }); 
  	 $('.infor .info').mouseout(function(){
            $(this).children().next().hide();
  		  $(this).removeClass("cur");
       }); 
  	 $('.header .user').mouseover(function(){
            $(this).children().next().show();
       }); 
  	 $('.header .user').mouseout(function(){
            $(this).children().next().hide();
       });
  });
*/
  
$(function() {
	var msg = $("#msg");
	if (msg && msg.html() != "") { //假如有消息，就显示，并且几秒钟后消息隐藏掉
	 	msg.fadeIn("slow");
	 	setTimeout(function() {
	 		msg.fadeOut("slow");
		}, 3000);
	}
}); 

function changeApplyCount() {
	try {
		var applyCount = parent.parent.parent.frames['topFrame'].document.getElementById('applyCount');
		if (applyCount) {
			$.ajax( { 
			      type : "POST", 
			      url : "getApplyCount.do", 
			      success : function(result) { 
			    	  applyCount.innerHTML = result;
			      } 
				});
		}
	} catch (e) {}
}

function mykeyDown(e){ 
	var ev = e ? e :event;    
	if(window.addEventListener){
	if(ev.keyCode==116){
	//F5的键盘常用ASCII码为116      
	parent.frames['mainFrame'].location.reload();   
	changeApplyCount();
	 ev.preventDefault();  
	     return false;      
	 }   
	}else{     
	 if(ev.keyCode==116){        
	 ev.keyCode=0;         
	 ev.returnValue=false;        
	  parent.frames('mainframe').location.reload();    
	  changeApplyCount();
	     return false;     
	  }   
	 } 
	}   //给每个frame都绑定onkeydown事件

	window.onload =function(){
		var win = window;
		var i=0;
		while(win.parent!=win){
			i++;
			win = win.parent;
		}
		if(i==1){
			document.onkeydown = mykeyDown;    
		    for(var i=0;i<frames.length;i++){    
			    if (typeof document.addEventListener != "undefined") {  
			    frames[i].document.addEventListener("keydown",mykeyDown,true);  
			    } else {    
			    	frames[i].document.attachEvent("onkeydown", mykeyDown);  
			    }   
		    } 
		}
	}; 

	$(function(){
		if(window.name=="leftFrame"){
			setTimeout(function(){
				var win = window;
				var i=0;
				while(win.parent!=win){
					i++;
					win = win.parent;
				}
				if(i==1){
					var leftBodyy=$(win.parent.frames["leftFrame"].document);
					leftBodyy.find(".cell").each(function(){
						if($(this).find("li a").length==0){
							$(this).remove();
						}
					});
				}
	
			},10);
		}
	});
	
	/**
	 * 查看图片
	 */
	function alertPicture(id){
		if(!id || id==''){
			dm.alert("图片不存在！");
		}
		$.ajax({
			type:"post",
			async: false,
			dataType:"json",
			url:basePath+"/common/findAttInfo.do",
			data:{"batchNumber":id},
			success:function(data){
				if(!data.data.url){
					dm.alert("图片不存在！");
					return;
				}
				var url = platformPath+"/ReadPic/pic/url?url="+data.data.url;
				var htm = "<div class=\"popup_bg\"></div>"+
				"<div class=\"dialog\" style='left:30%;width:1000px;top:30%;'>"+
				 " <div class=\"clearfix\">"+
				  "<div class=\"title\"><a href=\"#\" onclick='$.tbox.close();' class=\"out\"></a>查看</div>"+
				   "<div class=\"cotent\" style='max-height:600px;'>"+
				    "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"table\">"+ 
				     "<tr>"+            
				      "<td align=\"center\"><img src=\""+url+"\" style='height:580px;' class=\"see_img02\" /></td>"+
				       "</tr>"+
				        "</table>"+
				      "</div>"+
				      "<div class=\"btn\"><a href=\"#\" onclick='$.tbox.close();' class=\"btn_cs\">确认</a></div>"+ 
				    "</div>"+
				"</div>";
				$.tbox.showDiv(htm);
			}
		});
	}
