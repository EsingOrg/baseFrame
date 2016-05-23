<%@ page language="java" pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>为角色分配系统用户</title>
    <script type="text/javascript">
    dmCheck.init("#updateForm");
    function confirm(){
    	 if(!dmCheck.check("#updateForm")){
 			return false;
 		}
    	 DMGold.ajax({"formId":"updateForm","serialize":true,"url":"assignSysUserSaveAjax.do",
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
    	$(function(){
    		//初始化显示角色用户信息
    		var roleUsers = ${roleUsers.pageResult};
    		$.each(roleUsers,function(i,n){
    			$("#ck"+n.id).attr("checked","checked");
    		});
    		var allUsers = ${users.pageResult.list};
    		if(roleUsers.length == allUsers.length){
    			$('#all').attr("checked", "checked");
    		}else {
    			$('#all').removeAttr("checked");
			}
    		
    	});
    	//全选，取消全选
	    function selectAll() {
		    var allObj = $("#all");
			var checkObjs = $(":checkbox").not("#all");
			if(allObj.attr("checked")) {
				checkObjs.attr("checked", "checked");
			} else {
				checkObjs.removeAttr("checked");
			}
			
		}
    	function isALl(){
    		var checkObjs = $(":checkbox").not("#all").not(":checked");
    		if(checkObjs.length == 0){
    			$('#all').attr("checked", "checked");
    		}else {
    			$('#all').removeAttr("checked");
			}
    	}
    	
    </script>
    <style type="text/css">
    	.info span{margin-right:20px;}
    </style>
  </head>
  <body>
	<div class="r_main clearfix">
	<div id="popCon" class="dialog" style="width:600px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <input id="popId" type="hidden" />
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>分配用户</div>
			<form  id="updateForm" >
			<div class="part" id="con_one_1">
			<input type="hidden" name="token" value="${token}">
			<ul class="infor clearfix" >
			<li>
				<div class="til"><span style="font-weight:bold;">当前角色：</span></div>
    			<div class="info">${role.singleResult.name}
    				<input type="hidden" value="${role.singleResult.id }" name="id">
    			</div>
    		</li>
    			<li>
    				<div class="til">
    					<input type="checkbox" id="all" onclick="selectAll();"><span style="font-weight:bold;">&nbsp;全选&nbsp;&nbsp;</span>
    				</div>
    				<div class="info">
    				 <c:forEach items="${users.pageResult.list}" var="user">
    				   <input type="checkbox" id="ck${user.id}" name="userIds" value="${user.id}" onclick ="isALl()">${user.realName}&nbsp;&nbsp;&nbsp;
    				 </c:forEach>
    				</div>
    			</li>
    		<li>
				<div class="til">&nbsp;</div>
    			<div class="info">
					<input type="button" onclick="confirm()" value="确 定" class="btn_cs ml10" >
					<input type="button" value="返 回" class="btn_cs ml10" onclick="$.tbox.close();">
				</div>
			</li>
			</ul>
			</div>
    </form>
</div>
</div>
</div>
  </body>
</html>
