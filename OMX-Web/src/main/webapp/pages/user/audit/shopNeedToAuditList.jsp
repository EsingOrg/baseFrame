<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>审核店铺</title>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
 
  <link rel="stylesheet" type="text/css" href="<%=basePath %>css/common.css"/>
  <script type="text/javascript" src="<%=basePath %>js/date/WdatePicker.js"></script>
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
						<select name="provinces" class="yhgl_sel" id="provinces" onchange="changeProvince(this.value)">
			            </select>
	          </p>
	          <p>
			  	所在市区： 
				<select name="city" class="yhgl_sel" id="city">
					<option value="">全部</option>
			    </select>
			  </p>
	          <p class="lo_btn"> 
	            <input name="input" type="submit" class="search" value="搜索" onclick="$('#dataForm_currPage').attr('value',0)"/>
	            <shiro:hasPermission name="YHGL_DPSQ_DSH_DC">
	            	<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportNeedAuditShop.do');"/>
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
	    	  <td>${user.statusCN}</td>
	    	  <td>
	    	  	<shiro:hasPermission name="YHGL_DPSQ_DSH_SH">
	   		    	<a class="orange" href="javascript:void(0);" onclick="window.location.href='auditShopShow.do?applyId=${user.id}&isshow=1&type=${type}';">审核</a>
	   		    </shiro:hasPermission>
	    		<a class="orange" href="javascript:void(0);"  onclick="window.location.href='auditShopShow.do?applyId=${user.id}&isshow=0&type=${type}';">查看</a>
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
</body>

<script type="text/javascript"> 
	
	$(function(){
		getAllProvince();//获取所有省
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
</script>   
</html>