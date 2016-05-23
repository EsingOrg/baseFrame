<%@ page language="java" pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
 <!DOCTYPE html>
<html>
  <head>
    <title>修改系统用户密码</title>
  </head>
  <body>
	<div class="r_main clearfix">
	<div id="popCon" class="dialog" style="width:600px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>修改密码</div>
	
	<div class="me_con">
	<form id="publicForm" action="<%=basePath %>system/consoleAccountMgt/modifyPassword.do" method="post">
	<input type="hidden" name="id" value="${param.id}">
	<input type="hidden" name="token" value="${token}">
            <div class="part" id="con_one_1">
            <ul class="infor clearfix" >
                <li>
                    <div class="til">登录名：</div>
                    <div id="loginName" class="info"></div>                   
                </li>
                <!--  li>
                    <div class="til">原密码：</div>
                    <div class="info"><input type="password" name="oldPswd" class="yhgl_input w300" validate="q|leng"  leng="6,16" maxlength="16"/></div>
                </li -->  
                <li>
                    <div class="til">新密码：</div>
                    <div class="info"><input type="password" id="newPswd" name="password" class="yhgl_input w300" validate="q|leng"  leng="6,16" maxlength="16"/></div>
                </li>
                 <li>
                    <div class="til">重输新密码：</div>
                    <div class="info"><input type="password" id="newPswd2" name="newPswd2" class="yhgl_input w300" validate="q|leng"  leng="6,16" maxlength="16"/></div>
                </li>
            </ul>
            <div class="btn w600">
            <input name="input" type="button" class="btn_cs ml10" value="提交" onclick="addUser()"/>
            <input type="button" class="btn_cs ml10" value="取消" onclick="$.tbox.close();"/>
            </div>
            </div>
            
            </form>
	</div>
</div>
  </body>
   <script type="text/javascript">
   //增加校验模式
   dmCheck.init("#publicForm");
   function addUser(){
	  if(!dmCheck.check("#publicForm")){
			return false;
		}
	  if($("#newPswd").val() != $("#newPswd2").val()){
		  tip($("#newPswd2"),"两次密码不一致");
		  return false;
	  }
	  //提交数据
	  DMGold.ajax({"formId":"publicForm","serialize":true,"url":"modifyPassword.do",
  		"success":function(data){
				//显示提示信息
				if("000000"==data.code){
					dm.alert(data.description,{"picClass":"d_succeed"});
				}else{
					dm.alert(data.description,{"picClass":"d_error"});
				}
				//刷新列表
				search();
				//关闭弹出框
				$.tbox.close();
  	}});
  }
  $(function(){
  	var zh = decodeURIComponent("${param.ln}");
  	$("#loginName").text(zh);
  })
  </script>
</html>
