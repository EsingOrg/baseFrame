<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>店铺审核信息</title>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
</head>
<body>

  <!---------------列表内容开始--------------->
  <div class="r_main clearfix">
  
    <!-- 搜索表框  -->
    <form id="dataForm" action="auditList.do" method="post">
    	<div class="main_con">
          <div class="admin_input clearfix">
	           <input type="hidden" name="type" value="${type }"/>
	          <p>店铺名称： 
			  	<input type="text" name="shopFullName" class="yhgl_input" value="${shopreg.shopFullName}" maxlength="40"/>
	          </p>
	          <p>法人： 
			  	<input type="text" name="corporation" class="yhgl_input" value="${shopreg.corporation}" maxlength="40"/>
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
	          <p class="lo_btn"> 
	            <input name="input" type="submit" class="search" value="搜索" onclick="$('#dataForm_currPage').attr('value',0)"/>
	            <shiro:hasPermission name="YHGL_DPSQ_SHTG_DC">
	            	<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportAuditShop.do');"/>
	            </shiro:hasPermission>
			  </p>
		  </div>
       </div>     
    <!-- 搜索表框END -->  
         
    <!-- 列表框  --> 
	<div class="main_con">
		<div class="menu_bd clearfix">
		  <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
			<tr class="title">
			  <td>序号</td>
			  <td>店铺名称</td> 
			  <td>法人</td> 
			  <td>手机号码</td> 
			  <td>所在省份</td> 
			  <td>所在市区</td> 
			  <td>申请时间</td> 
			  <td>处理人</td> 
			  <td>处理时间</td> 
			  <td>状态</td> 
			  <td>操作</td>                
			</tr>
			<c:forEach items="${pageList.data.pageResult.list}" var="user" varStatus="st">
		    <tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
		      <td>${st.count}</td>
		      <td>${user.name}</td>
		      <td>${user.corporation}</td>
	    	  <td>${user.corporatePhone}</td>
	    	  <td>${user.provinces}</td>
	    	  <td>${user.city}</td>
	    	  <td>${user.applyTime}</td>
	    	  <td>${user.handlerName}</td>
	    	  <td>${user.handleTime}</td>
	    	  <td>${user.statusCN}</td>
	    	  <td>
	    		<a class="orange" href="javascript:void(0);" onclick="window.location.href='auditShopShow.do?applyId=${user.id}&isshow=0&type=${type }';">查看</a>
	    		<shiro:hasPermission name="YHGL_DPSQ_SHTG_XZZH">
	    		<c:if test="${user.status == 'PASS'}">
	    			<a class="orange" href="javascript:void(0);" onclick="addPerUser(${user.id})">新增账号</a>
	    		</c:if>
	    		</shiro:hasPermission>
	    	  </td>
		    </tr>
		    </c:forEach>
		  </table>
		</div>             
	  <!-- 分页 -->    
	  <div style="margin-top: 25px;">
					<dim:page url="auditList.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
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
      	<input type="hidden" name="id" id="shopId"/>
      	<input type="hidden" name="password"/>
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
          <tr>
            <td valign="top" width="30%"  align="right"><span style="color:red;">*&nbsp;</span>店铺用户名：</td>
            <td id="loginName"></td>
          </tr>
          <tr>
            <td valign="top" align="right">店铺管理员账号：</td>
            <td>admin</td>
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
  
    <script type="text/javascript">
    //增加店铺用户弹框
  	function addPerUser(id){
  		$("#loginName").html('DP<input name="shopUserId" type="text" id="username" class="yhgl_input" onblur="isExitUserName(this.value)" validate="q|leng" leng="6" maxlength="6" reg="/^[a-zA-Z0-9]{6}$/" warning="格式不正确,6个字符，不含特殊字符"/><p class="gray9">6个字符，只支持字母和数字</p>');
  		$("#shopId").val(id);
  		dmCheck.initForAjax("#addForm");
  		$("#addDialog").show();
  	}
    //新增弹框提交
	function addPerUserSubmit(){
  		if((obj = dmCheck.returnObj("#addForm")))	return obj.focus();
  		if(!checkRepassword())	return false;
  		$("#addForm input[name='password']").val(hex_md5($("#addForm input[name='passw']").val()));
  		$("#addForm").submit();
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
	$(function(){
		//获取所有省
		getAllProvince();
	});
	
	//获取所有省
	function getAllProvince(){
		var pro='${shopreg.provinces}';
		$.ajax({
			type:"POST",
			url:"getProvince.do",
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
	
	//获取市
	function changeProvince(pid){
		var pro='${shopreg.city}';
		if(pid =='' || pid == null){
			$("#city").empty();
			$("#city").append("<option value=''>全部</option>");
		}else{
			$.ajax({
				type:"POST",
				url:"getProvince.do",
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