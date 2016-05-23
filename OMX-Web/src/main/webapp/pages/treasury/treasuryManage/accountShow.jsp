<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
<title>店铺历史台账</title>
<script type="text/javascript">
	//增加校验模式
	dmCheck.init("#sysStockForm");
</script>
</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<c:if test="${flag eq 1}">
			<div class="main_title">店铺历史全部业务</div>
			</c:if>
			<c:if test="${flag eq 2}">
			<div class="main_title">店铺历史处理个人业务</div>
			</c:if>
			<c:if test="${flag eq 3}">
			<div class="main_title">店铺历史自营业务</div>
			</c:if>
			
			<div class="main_con clearfix">
				<div class="user_con  all" id="allStat">
					<ul class="user_now clearfix">
						<li style="width: 290px;text-align: inherit; float: left;">
							用户名: &nbsp;&nbsp;&nbsp;&nbsp;
								<span class=" yellow">${req.userName }</span>
							
							
						</li>
						<li style="width: 290px;text-align: inherit;float: left;">
							 &nbsp;&nbsp;&nbsp;&nbsp;店铺名 :&nbsp;&nbsp;&nbsp;&nbsp;
								<span class=" yellow">${req.shopName }</span>
						</li>
						<li style="width: 290px;text-align: inherit;float: left;">
							<a href="getTreasuryStoreHistoryAccountList.do?flag=1" class="btn_cs" >返回</a>
						</li>
					</ul>
				</div>
			</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="accountShow.do" method="post"
				id="sysStockForm">
				<input type="hidden" name="userName" value="${req.userName }"/>
				<input type="hidden" name="shopName" value="${req.shopName }"/>
				<input type="hidden" name="flag" value="${flag }"/>
				<input type="hidden" value="${req.shopId }" name="shopId"/>
				<div class="main_con">
					<div class="admin_input clearfix">
						<div class="all">	
						<p>
							时间： <input type="text" name="startTime"
								value="${req.startTime}" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								value="${req.endTime}" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>
						</div>
						<p class="lo_btn" >
							<input  type="submit" class="search" value="搜索" /> 
							<input  name="input" type="button" class="export ml10" value="导出" onclick="exportData('sysStockForm','accountShowExport.do')" />
						</p>
					</div>
				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="lb_content_table all" id="allTable">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">

						<tr class="title">
							<td align="center">序号</td>
							<td align="center">时间</td>
							<td align="center">期初（克）</td>
							<td align="center">${flag == 1 ? '' : flag == 2 ? '客户':'店铺今日'}存入（克）</td>
							<td align="center">${flag == 1 ? '' : flag == 2 ? '客户':'店铺今日'}提取（克）</td>
							<td align="center">平台已收货（克）</td>
							<td align="center">平台已发货（克）</td>
							<c:if test="${flag != 2}">
							<td align="center">平台待检测（克）</td>
							</c:if>
							<td align="center">平台待收物流中（克）</td>
							<td align="center">店铺待收物流中（克）</td>
							<c:if test="${flag != 3}">
							<td align="center">调整克重（克）</td>
							</c:if>
							<td align="center">期末（克）</td>
						</tr>
						<c:forEach items="${data.pageResult.list}" var="dt" varStatus="st">
							<tr>
								<td>${st.count}</td>
						    	<td>${dt.statDate}</td>
						    	<td>${dt.beginGold}</td>
					        	<td>${dt.saveWeight}</td> 
						    	<td>${dt.takeWeight}</td>
						    	<td>${dt.getWeight}</td>
					        	<td>${dt.sendWeight}</td>
					        	<c:if test="${flag != 2}">
								<td>${dt.checkWeight}</td>
								</c:if>
					        	<td>${dt.sysReceiveWeight}</td> 
						    	<td>${dt.shopReceiveWeight}</td>
						    	<c:if test="${flag != 3}">
						    	<td>${dt.adjustWeight}</td>
						    	</c:if>
					        	<td>${dt.endGold}</td> 
							</tr>
						</c:forEach>
							<tr class="yellow" >
								<td> </td>
							   	<td>合计</td>
							   	<td> </td>
						       	<td>${data.columnStatResult.saveWeight}</td> 
							   	<td>${data.columnStatResult.takeWeight}</td>
							   	<td>${data.columnStatResult.getWeight}</td>
						       	<td>${data.columnStatResult.sendWeight}</td>
						       	<c:if test="${flag != 2}">
								<td> </td>
								</c:if>
						       	<td> </td> 
							   	<td> </td>
							   	<c:if test="${flag != 3}">
							   	<td>${data.columnStatResult.adjustWeight}</td>
							   	</c:if>
						       	<td> </td> 
							</tr>
					</table>
				</div>

				<div style="margin-top: 25px;" id="pageId">
					<dim:page url="accountShow.do" totalCount="${data.pageResult.recordCount }" formId="sysStockForm" showPages="${data.pageResult.pageSize }"
								curPage="${data.pageResult.pageIndex }" totalPages="${data.pageResult.pageTotal }" />
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>
