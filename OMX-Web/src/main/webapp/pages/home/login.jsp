<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<title>易森后台登录</title>  
<script type="text/javascript">
  dmCheck.init("#loginForm");  
  function login(){
	  if(!dmCheck.check("#loginForm")){
			//return false;
		}
	  DMGold.ajax({"formId":"loginForm","serialize":true,"url":"doLogin.do","success":loginCallBack,"error":function(data){
		  dm.alert("系统异常，请联系管理员！");
	  }});
  }
  function loginCallBack(data){
	  if(data.success){
		  window.location.href="main.do";
	  }else{
		  changeCaptcha('captchaId');
		  dm.alert(data.msg);
	  }
  }
  if (window.parent.frames.length > 1) { // avoid login form display in frameset
		window.parent.location.href = "login.do";
	}
	document.onkeydown=function(event){
    var e = event || window.event || arguments.callee.caller.arguments[0];          
     if(e && e.keyCode==13){ // enter 
     	$("#loginBtn").click();
     }
};
</script> 

</head>
<body style="background:#147d9d">

<div class="login_bg clearfix">
	<div class="login">
    	<div class="login_logo">
    	<img id src="/platform/ReadPic/pic/url?url"/>
        <p>后台管理系统</p>
    </div>
    <form id="loginForm" action="doLogin.do" method="post">
    <div class="con">
    	<div class="cell clearfix">
            <div class="title">用户名：</div>
            <div class="info"><input name="accountName"   id="userName"  type="text" class="text" validate="q"  />
            <p class="prompt" id="userNameMess"></p></div><!-- 用户名不能为空 -->
        </div>
        <div class="cell clearfix">
            <div class="title">密&nbsp;&nbsp;&nbsp;&nbsp;码：</div>
            <div class="info"><input name="password" id="pw"  validate="q" type="password" class="text text2" />
            <p class="prompt" id="pwMess"></p></div><!-- 密码不正确，请重新输入 -->
        </div>
        <div class="cell clearfix">
            <div class="title">验证码：</div>
            <div class="info yz_l"><input name="code" validate="q" id="code" type="text" class="code" />
            <p class="prompt" id="codeMess"></p></div><!-- 验证码不能为空 -->
          <div class="login_yzm" onclick="changeCaptcha('captchaId')">
				<img src="<%=basePath%>captcha"
									 id="captchaId" class="yzm"
									width="93" height="32" style="cursor: pointer;" />
			</div>
            <div class="login_ico" onclick="changeCaptcha('captchaId')"></div>
        </div>       
        <div class="tr"><input id="loginBtn" type="button" onclick="login()" class="btn" value="登 录"/></div>
      </div> 
      </form>
      <div class="clear"></div>
      <div class="end">xxx ▏xxx&nbsp;&nbsp;xxx</div>   
    </div>
</div>
</body>
</html>
