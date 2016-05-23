<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>${role.id!=null?'修改':'新增'}系统角色</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  </head>
  <body>
   <div class="r_main clearfix">
	<div id="popCon" class="dialog" style="width:600px;margin: -260px 0 0 -400px">
	  <div class="clearfix"> 
	    <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>${role.id ne null?'修改':'新增'}用户组</div>
	    <div class="me_con">
	     <form id="publicForm">
	        <input type="hidden" name="id" value="${role.id}">
	        <input type="hidden" name="token" value="${token}">
            <div class="part" id="con_one_1">
              <ul class="infor clearfix" style="margin-top: 30px;">
                <li>
                  <div class="til"><span class="red">*&nbsp;</span>角色名称：</div>
                  <div class="info"><input type="text" name="name" validate="q" maxlength="20" class="yhgl_input w300" value="${role.name}"/></div>                   
                </li>
                <li>
                   <div class="til">描述：</div>
                   <div class="info"><input type="text" name="desc" maxlength="50" class="yhgl_input w300" value="${role.desc}"/></div>
                </li>  
              </ul>
            <div class="btn w600">
              <input name="input" type="button" onclick="commitForm();"  class="btn_cs ml10" value="提交" />
              <input name="input" type="button" class="btn_cs ml10" value="取消" onclick="$.tbox.close();"/>
            </div>
            </div>
          </form>
	</div>
</div>
</div>
</div>
  </body>
   <script type="text/javascript">
    dmCheck.init("#publicForm");
    //提交
    function commitForm(){
    	if(!dmCheck.check("#publicForm")){
    		return false;
    	}
    	DMGold.ajax({"formId":"publicForm","serialize":true,"url":"<%=basePath %>system/consoleAccountMgt/${role.id ne null?'updateSysRoleAjax':'addSysRoleAjax'}.do",
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
    
  </script>
</html>
