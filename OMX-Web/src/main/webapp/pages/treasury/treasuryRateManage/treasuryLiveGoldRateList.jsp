<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>活金利率管理</title>
<script type="text/javascript">
	//增加校验模式
	dmCheck.init("#allForm");
</script>
</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">活金利率管理</div>
			<div class="main_con clearfix">
				<div class="user_con">
					<ul class="user_now clearfix">
						<li>
							<p class="yellow">
								<span class="f24"><fmt:formatNumber value="${data.singleResult == null ? '0' : data.singleResult.nowRate == null ? '0' : data.singleResult.nowRate}" maxFractionDigits="2" type="percent" /> </span>
							</p>
							<p>当前活金利率</p>
						</li>
					</ul>
				</div>
			</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="<%=basePath%>treasury/getTreasuryLiveGoldRateList.do" method="post" id="dataForm">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							修改时间： <input type="text" name="startTime"
								value="${req.startTime}" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								value="${req.endTime}" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
							<shiro:hasPermission name="JKGL_LLGL_HJLL_DC">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportRateList.do');"/>
							</shiro:hasPermission>
							<shiro:hasPermission name="JKGL_LLGL_HJLL_XGHJLL">
							<c:if test="${data.pageResult.list != null && data.pageResult != null && data!= null}">
							<a style="margin-left: 10px;" onclick="popDiv('<%=basePath %>treasury/updateLiveGoldRateBox.do')" href="javascript:void(0)" class="btn_cs">修改活金利率</a>
							</c:if>
							</shiro:hasPermission>
							
						</p>
					</div>
				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="menu_bd clearfix" id="todaytCont">
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc">
						<thead>
							<tr class="title">
								<td align="center">序号</td>
								<td align="center">活金利率</td>
								<td align="center">开始时间</td>
								<td align="center">结束时间</td>
								<td align="center">修改人</td>
								<td align="center">修改时间</td>
							</tr>
						</thead>
						
						<c:forEach items="${data.pageResult.list }" var="rate" varStatus="st">
							<tr>
								<td>${st.count }</td>
					    		<td>
					    		<fmt:formatNumber value="${rate.yearRate}" maxFractionDigits="2" type="percent" />
					    		</td> 
						    	<td>${ rate.startTime}</td>
						    	<td>${ rate.endTime}</td>
					        	<td>${ rate.updateBy}</td> 
						    	<td>${ rate.updateTime}</td>
					    	</tr>
						</c:forEach>
					</table>
					<!--分页-->
				<div style="margin-top: 25px;" id="pageId">
					<dim:page url="getTreasuryLiveGoldRateList.do" totalCount="${data.pageResult.recordCount }" formId="dataForm" showPages="${data.pageResult.pageSize }"
								curPage="${data.pageResult.pageIndex }" totalPages="${data.pageResult.pageTotal }" />
				</div>
				<!--分页  --END-->
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
 <script type="text/javascript">
 
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
 	function openDivPwd(id,loginName){
 		loginNames = encodeURIComponent(encodeURIComponent(loginName));
 		popDiv('<%=basePath %>system/sysuser_modify_pwd.jsp?id='+id+'&ln='+loginNames+'&t=<%=Math.random() %>');
 	}
 </script>
</html>
							