<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>店铺信息</title>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>

</head>
<body>

  <!---------------列表内容开始--------------->
  <div class="r_main clearfix">
  
    <!-- 搜索表框  -->
    <form id="dataForm" action="shopPerList.do" method="post">
    	<div class="main_con">
          <div class="admin_input clearfix">
	          <p>用户名：  
	              <input type="text" name="userName" class="yhgl_input" value="${shopreg.userName}" maxlength="20"/>
	          </p>
	          <p>店铺名称： 
			  	<input type="text" name="shopFullName" class="yhgl_input" value="${shopreg.shopFullName}" maxlength="40"/>
	          </p>
	          <p>注册时间： 
			  	<input type="text" name="regStartTime" class="yhgl_input date" id="createTime1" onclick="WdatePicker({readOnly:true,maxDate: '#F{$dp.$D(\'createTime2\')}'})" value="${shopreg.regStartTime}"/>
				<span class="mr5">至</span>
				<input type="text" name="regEndTime" class="yhgl_input date" id="createTime2" onclick="WdatePicker({readOnly:true,minDate: '#F{$dp.$D(\'createTime1\')}'})" value="${shopreg.regEndTime}"/>
	          </p>
	          <p>
			            所在省份： 
			            <select name="provinces" id="provinces" class="yhgl_sel" onchange="changeProvince(this.value)">
			            </select>
	          </p>
	          <p>
			  	所在市区： 
			  	<select name="city" id="city" class="yhgl_sel">
				<option value="">全部</option>
	            </select>
			  </p>
	          <p>
			  	状态： 
			  	<form:select path="shopreg.lockFlag" class="yhgl_sel">
	            	<form:option value="">全部</form:option>
	            	<form:option value="N">正常</form:option>
	            	<form:option value="Y">锁定</form:option>
	            </form:select>
			  </p>
	          <p class="lo_btn"> 
	            <input name="input" type="submit" class="search" value="搜索" onclick="$('#dataForm_currPage').attr('value',0)"/>
	            <shiro:hasPermission name="YHGL_YHXX_DPXX_DC">
	            	<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportshop.do');"/>
	            </shiro:hasPermission>
	            <shiro:hasPermission name="YHGL_YHXX_DPXX_XZDPXX">
	            	<a href="javascript:void(0);" class="btn_cs ml10" onclick="addPerUser();"><i class="newly"></i>新增店铺信息</a>
	            </shiro:hasPermission>
			  </p>
		  </div>
       </div>
 
         
    <!-- 列表框  --> 
	<div class="main_con">
		<div class="menu_bd clearfix">
		  <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
			<tr class="title">
			  <td>序号</td>
			  <td>用户名</td> 
			  <td>店铺名称</td> 
			  <td>法人</td> 
			  <td>手机号</td> 
			  <td>座机号</td> 
			  <td>所在省份</td> 
			  <td>所在市区</td> 
			  <td>注册时间</td> 
			  <td>状态</td> 
			  <td>操作</td>                
			</tr>
			<c:forEach items="${pageList.data.pageResult.list}" var="user" varStatus="st">
		    <tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
		      <td>${st.count}</td>
		      <td>${user.shopUserId}</td>
		      <td>${user.name}</td>
		      <td>${user.corporation}</td>
		      <td>${user.phone}</td>
	    	  <td>${user.tel}</td>
	    	  <td>${user.provinces}</td>
	    	  <td>${user.city}</td>
	    	  <td>${user.createTime}</td>
	    	  <td>
				<c:if test="${user.lockFlag=='Y' }">
					锁定
				</c:if>
				<c:if test="${user.lockFlag=='N' }">
					正常
				</c:if>
			  </td>
	    	  <td>
	    	  	<shiro:hasPermission name="YHGL_YHXX_DPXX_SD">
	    	  	<c:if test="${user.lockFlag=='Y' }">
	    	  		<a class="orange" href="javascript:void(0);" onclick="lockinfo('${user.shopId}','${user.lockFlag}','${user.shopUserId}')">解锁</a>
	    	  	</c:if>
	    	  	<c:if test="${user.lockFlag=='N' }">
	    	  		<a class="orange" href="javascript:void(0);" onclick="lockinfo('${user.shopId}','${user.lockFlag}','${user.shopUserId}')">锁定</a>
	    	  	</c:if>
	    	  	</shiro:hasPermission>
	   		    <a class="orange" href="javascript:void(0);" onclick="window.location.href='shopPerShow.do?key=${user.shopId}&name=${user.shopUserId}';">查看</a>
	   		    <shiro:hasPermission name="YHGL_YHXX_DPXX_XG">
	    			<a class="orange" href="javascript:void(0);" onclick="window.location.href='shopPerShow.do?isEdit=true&key=${user.shopId}&name=${user.shopUserId}';">修改</a>
	    		</shiro:hasPermission>
	    	  </td>
		    </tr>
		    </c:forEach>
		  </table>
		</div>             
	  <!-- 分页 -->    
	   <div style="margin-top: 25px;" id="pageId">
			<dim:page url="shopPerList.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
						curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
		</div>
      <!-- 分页END -->           
    </div>
    <!-- 列表框END  --> 
       </form>
  </div>
  <!---------------列表内容结束--------------->
  <!-- 增加用户信息弹出框start -->
  <div id="addDialog" style="display: none">
  <div class="popup_bg"></div>
  <div class="dialog">
    <div class="clearfix"> 
	  <div class="title"><a href="javascript:void(0);" class="out" onclick="$('#addDialog').hide();"></a>新增店铺账号</div>
      <div class="cotent">
      	<form id="addForm" action="toSaveShop.do">
      	<input type="hidden" name="password"/>
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
          <tr>
            <td valign="top" width="30%"  align="right"><span style="color:red;">*&nbsp;</span>店铺用户名：</td>
            <td id="loginName">DP<input name="shopUserId" type="text" id="username" class="yhgl_input" onblur="isExitUserName(this.value)" validate="q|leng" leng="6" reg="/^[a-zA-Z0-9]{6}$/" warning="格式不正确,6个字符，不含特殊字符" maxlength="6"/><p class="gray9">6个字符，只支持字母和数字</p></td>
          </tr>
          <tr>
            <td valign="top" align="right">店铺管理员账号：</td>
            <td>admin</td>
          </tr>
          <tr>
            <td valign="top" align="right"><span style="color:red;">*&nbsp;</span>是否三证合一：</td>
            <td><input type="radio" name="flag" value ="Y" checked="checked"/>是&nbsp;&nbsp;<input type="radio" name="flag" value ="N"/>否</td>
          </tr>
          <tr>
            <td valign="top" align="right"><span style="color:red;">*&nbsp;</span>密码：</td>
            <td><input name="passw" type="password" class="yhgl_input" validate="q|leng" leng="6,20" maxlength="20"/><p class="gray9">6~20个字符，区分大小写。</p></td>
          </tr>
          <tr>
            <td valign="top" align="right"><span style="color:red;">*&nbsp;</span>确认密码：</td>
            <td><input name="repassword" type="password" class="yhgl_input" onchange="clearTip();" onblur="checkRepassword(null,true);" /></td>
          </tr>
          
          <tr><td colspan="2" id="msgTD" style="display: none; text-align: center; color: red;"></td></tr>
        </table>
        </form>
      </div>
      <div class="btn"><a href="javascript:void(0);" class="btn_cs" onclick="addPerUserSubmit();">下一步</a><a href="javascript:void(0);" class="btn_cs ml20" onclick="$('#addDialog').hide();">取消</a></div> 
    </div>
  </div>
  </div>
  <!-- 增加用户信息弹出框end -->
  <!-- 锁定用户弹出框start -->
  <div id="lockDialog" style="display: none"> 
	<div class="popup_bg"></div>
	<div class="dialog">
	  <div class="clearfix"> 
	      <div class="title"><a href="javascript:void(0);" class="out" onclick="$('#lockDialog').hide();"></a>确认<span id="lockid"></span>用户</div>
	      <div class="cotent clearfix">
	         <div class="conn">
	         	<input type="hidden" id="hd_userid"/>
	         	<input type="hidden" id="hd_islock"/>
	             <p class="tl f16 mt10" style="text-align:center">确定<span id="lockuser"></span>吗？</p>
	         </div> 
	         <div class="btn"><a href="javascript:void(0);" class="btn_cs" onclick="islock()">确定</a><a href="#" class="btn_hs ml20" onclick="$('#lockDialog').hide();">取消</a></div>
	      </div>     
	    </div>
	</div>
  </div>
  <!-- 锁定用户弹出框end -->
  <script type="text/javascript">
  //锁定/解锁弹出框
 	function lockinfo(userid,islock,loginname){
 		
 		if(islock=='N'){
 			$("#lockid").text("锁定");
 			$("#lockuser").text("锁定"+loginname);
 			$("#hd_islock").val("Y");
 		}else{
 			$("#lockid").text("解锁");
 			$("#lockuser").text("解锁"+loginname);
 			$("#hd_islock").val("N");
 		}
 		$("#hd_userid").val(userid);
		
 		dmCheck.initForAjax("#lockDialog");
  		$("#lockDialog").show();
 	}	
  	//解锁/锁定
 	function islock(){
 		var userid=$("#hd_userid").val();
 		var islock=$("#hd_islock").val();
 		$.ajax({ 
            type : "POST", 
            url : "<%=basePath%>user/per/userPerShowLock.do", 
            data : {"userId":userid,"lockFlag":islock}, 
            success : function(result) {
            	$('#lockDialog').hide();
            	if(result.statu.code == "000000"){
            		dm.alert("操作成功！",{
            			title:"提示",				//弹窗的标提
            			okName:"确定",			//如同alert确定按钮的value
            			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
            			notHaveClose:"xxx",
            			callback:function(){	//按确定后执行的函数
            				window.location.href="shopPerList.do";
            			}
            		});
              	}else{
              		dm.alert("操作失败！");
              	}
            } 
        });
 	}
  //弹出店铺新增框
  	function addPerUser(){
  		dmCheck.initForAjax("#addForm");
  		$("#addDialog").show();
  	}
  	//判断密码和确认密码是否相同
  	function checkRepassword(msg, isFocus) {
		var repassword =  $("#addForm input[name='repassword']");	  
		if (msg) {
			tip(repassword, msg);
		} else {
			if (!repassword.val() || repassword.val() != $("#addForm input[name='passw']").val()) {
				tip(repassword, "两次输入的密码不一致！");
			} else {
				return true;
			}
		}
		if (!isFocus)	repassword.focus();
		return false;
  	}
  	
  	//店铺新增弹框提交
  	function addPerUserSubmit(){
  		if((obj = dmCheck.returnObj("#addForm"))){	return obj.focus();}
  		if(!checkRepassword())	return false;
  		$("#addForm input[name='password']").val(hex_md5($("#addForm input[name='passw']").val()));
  		$("#addForm").submit();
  	}
  	dmCheck.init("#addForm");
	$(function(){
		//获取所有省
		getAllProvince();
		
	});
	//获取所有省
	function getAllProvince(){
		var pro='${shopreg.provinces}';
		$.ajax({
			type:"POST",
			url:"<%=basePath%>audit/getProvince.do",
			data:{"subRegionId":0},
			success:function(msg){
				var list=msg.data.data.list;
				$("#provinces").empty();
				$("#provinces").append("<option value=''>全部</option>");
				for(var i=0;i<list.length;i++){
					if(list[i].id==pro){
						$("#provinces").append("<option value='"+list[i].id+"' selected>"+list[i].name+"</option>");
						changeProvince(list[i].id);
					}else{
						$("#provinces").append("<option value='"+list[i].id+"'>"+list[i].name+"</option>");
					}
				}
			}
		});
	}
	
	//获取省下市
	function changeProvince(pid){
		var pro='${shopreg.city}';
		if(pid =='' || pid == null){
			$("#city").empty();
			$("#city").append("<option value=''>全部</option>");
		}else{
			$.ajax({
				type:"POST",
				url:"<%=basePath%>audit/getProvince.do",
				data:{"subRegionId":pid},
				success:function(msg){
					var list=msg.data.data.list;
					$("#city").empty();
					$("#city").append("<option value=''>全部</option>");
					for(var i=0;i<list.length;i++){
						if(list[i].id==pro){
							$("#city").append("<option value='"+list[i].id+"' selected>"+list[i].name+"</option>");
						}else{
							$("#city").append("<option value='"+list[i].id+"'>"+list[i].name+"</option>");
						}
					}
				}
			});
		}
		
	}
	//判断用户名是否存在
	function isExitUserName(username){
		if(username!=''){
			username='DP'+username;
			$.ajax({ 
	            type : "POST", 
	            url : "<%=basePath %>finance/getUserid.do", 
	            data : {"userName":username}, 
	            success : function(result) {
	            	if(result.user.code=='000000'){
	            		$("#username").focus();
	            		$("#username").before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">店铺用户名已存在</div></span>');
	            	}
	            }
			});
		}
	}
  </script>

</body>
</html>