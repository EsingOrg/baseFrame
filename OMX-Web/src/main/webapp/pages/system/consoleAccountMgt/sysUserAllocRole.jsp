<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>角色分配信息</title>
    <script type="text/javascript">
    	$(function(){
    		//初始化选中用户已拥有的角色
    		//用户用户的角色数据
    		var data = ${uRoles};
    		$(data).each(function(i,n){
				$("#cb"+n.id).attr("checked",true);    			
    		});
    	});
    	//提交
    	function allocRole(){
    		//提交数据
    		  DMGold.ajax({"formId":"updateForm","serialize":true,"url":"allocSysRole.do",
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
        //全选、取消全选
	    function selectAll() {
		    var allObj = $("#all");
			var checkObjs = $(":checkbox").not("#all");
			if(allObj.attr("checked")) {
				checkObjs.attr("checked", true);
			} else {
				checkObjs.removeAttr("checked");
			}
		};
		
    </script>
  </head>
<body>
 <div id="popCon" class="dialog" style="width:600px;margin: -260px 0 0 -400px">
  <div class="clearfix"> 
    <!--搜索表框  -->
    <form action="<%=basePath %>system/consoleAccountMgt/allocSysRole.do" id="updateForm" method="post">
       <input type="hidden" name="id" value="${user.id }">
       <input type="hidden" name="token" value="${token}">
       <div class="main_table">
         <table width="100%" cellspacing="0" cellpadding="3" border="0">
           <tr class="title">
            <td width="20%" align="center"><label><input type="checkbox" id="all" onclick="selectAll();">全选</label>选择</td>
            <td width="20%" align="center">角色名称</td>
            <td width="20%" align="center">角色描述</td>
           </tr>
          </table>
        </div>
        <div class="table_he">
          <table width="100%" cellspacing="0" cellpadding="3" border="0" class="main_table t"> 
            <c:forEach items="${sRoles}" var="sr" varStatus="st">
  		     <tr>	
  			  <td width="20%" align="center"><input type="checkbox" id="cb${sr.id}" value="${sr.id}" name="roleIds"></td>
              <td width="20%" align="center">${sr.name}</td>
   	          <td width="20%" align="center">${sr.desc}</td>
             </tr>
           </c:forEach>
	        <tr>
			  <td colspan="3" align="center">
				<input type="button" onclick="allocRole();" value="确 定" class="btn_cs ml10" >
				<input type="button" value="取消" class="btn_cs ml10" onclick="$.tbox.close();">
			  </td>
	        </tr>
          </table>
         </div>
      </form>
    </div>
   </div>
  </body>
</html>
