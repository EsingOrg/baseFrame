<%@ page language="java" pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>修改系统用户</title>
    <script type="text/javascript">
    dmCheck.init("#publicForm");//增加校验模式
    function userEditCm(){
    	if(!dmCheck.check("#publicForm")){
			return false;
		}
    	//提交数据
  	    DMGold.ajax({"formId":"publicForm","serialize":true,"url":"updateSysUserAjax.do",
    		"success":function(data){
  				//显示提示信息
  				if("000000"==data.code){
  					dm.alert(data.description,{"picClass":"d_succeed"});
  				}else{
  					dm.alert(data.description,{"picClass":"d_error"});
  				}
  				//操作完成后刷新列表
  				search();
  				//关闭弹出框
  				$.tbox.close();
    	}});
    }
  </script>
  </head>
  <body>
	<div class="r_main clearfix">
	   <div id="popCon" class="dialog" style="width:600px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>修改用户</div>
	<div class="me_con">
	<form id="publicForm">
			<input type="hidden" name="id" value="${sysUser.singleResult.id}">
            <input type="hidden" name="token" value="${token}"> 
            <div class="part" id="con_one_1">
            <ul class="infor clearfix" style="margin-top: 30px">
                <li>
                    <div class="til">用户名：</div>
                    <div class="info">${sysUser.singleResult.loginName}</div>                   
                </li>
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>姓名：</div>
                    <div class="info"><input type="text" name="realName" class="yhgl_input w300" value="${sysUser.singleResult.realName}" validate="q" maxlength="20"/></div>
                </li>  
                <li>
                	<div class="til"><span style="color:red;">*&nbsp;</span>性别：</div>
                    <div class="info"><dim:radio enumType="Gender" name="gender" defaultValue="F" value="${sysUser.singleResult.gender}"/></div>
                </li>
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>状态：</div>
                    <div class="info"> <dim:radio name="status" enumType="SysUserStatus"  exclude="D" cssClass="yhgl_sel" value="${sysUser.singleResult.status}"></dim:radio></div>
                </li>  
            </ul>
            <div class="btn w600">
            <input name="input" type="button" onclick="userEditCm();" class="btn_cs ml10" value="提交" />
            <input type="button" class="btn_cs ml10" value="取消" onclick="javascript:$.tbox.close(); "/>
            </div>
            </div>
            </form>
	</div>
</div>
</div>
</div>
  </body>
</html>
