<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>新增系统用户</title>
  </head>
  
  <body>
	<div class="r_main clearfix">
	<div id="popCon" class="dialog" style="width:600px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>新增用户</div>
	<div class="me_con">
	<form id="publicForm" action="<%=basePath %>system/consoleAccountMgt/saveSysUser.do" method="post">
            <input type="hidden" name="token" value="${token}">
            <div class="part" id="con_one_1">
            <ul class="infor clearfix" style="margin-top: 30px;">
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>用户名：</div>
                    <div class="info"><input type="text" name="loginName" class="yhgl_input w300" validate="q" maxlength="30"/></div>                   
                </li>
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>密码：</div>
                    <div class="info"><input type="password" name="password"  autocomplete="off"  id="password" class="yhgl_input w300" validate="q|leng" leng="6,16" maxlength="16"/></div>
                </li>  
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>重输密码：</div>
                    <div class="info"><input type="password" name="password2" id="password2" class="yhgl_input w300" validate="q|leng" leng="6,16" maxlength="16"/></div>
                </li>  
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>姓名：</div>
                    <div class="info"><input type="text" name="realName" class="yhgl_input w300" maxlength="20" validate="q"/></div>
                </li>  
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>性别：</div>
                    <div class="info"><dim:radio enumType="Gender" name="gender" defaultValue="M" /></div>
                </li>
            </ul>
            <div class="btn w600">
            <input name="input" type="button" class="btn_cs ml10" value="提交" onclick="addUser()"/>
            <input type="button" class="btn_cs ml10" value="取消" onclick="$.tbox.close(); "/>
            </div>
            </div>
            </form>
	</div>
	</div>
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
	  if($("#password").val() != $("#password2").val()){
		  tip($("#password2"),"两次密码不一致");
		  return false;
	  }
	  var flag = true;
	  //校验用户名是否唯一
	  $.ajax({
				cache: true,
	            type: "POST",
	            url:"isExsitOfSysUser.do",
	            data:$('#publicForm').serialize(),// 提交的form表单对象 
	            async: false,
	            dataType:"json",
	            error: function(request) {
	                $("#returnIdTr").show();
	            },
	            success: function(data) {
	            	if(data.data.singleResult=='Y')
	            		{
		            		flag = false;
		            		$("span.pop-con").remove();
		            		$("input[name='loginName']").before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">用户名已存在！ </div></span>');
	            		}
	            	}
			});
	  if(!flag){
		  return;
	  }
	//提交数据
	  DMGold.ajax({"formId":"publicForm","serialize":true,"url":"saveSysUser.do",
  		"success":function(data){
				//显示提示信息
				if("000000"==data.code){
					dm.alert(data.description,{"picClass":"d_succeed"});
				}else{
					dm.alert(data.description,{"picClass":"d_error"});
				}
				//操作完成后刷新用户列表
				search();
				//关闭弹出框
				$.tbox.close();
  	}});
  }
  </script>
</html>
