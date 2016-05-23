<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>查看定期金管理修改记录</title>

</head>
<body>

	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">查看定期金管理修改记录</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="<%=basePath%>treasury/updatePeriodicalGoldRecord.do" method="post" id="searchBox">
				<input type="hidden" name="termId" value="${ findReq.termId}"/>
				<input type="hidden" name="termNo" value="${ findReq.termNo}"/>
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							修改时间： <input type="text" name="startTime"
								value="${findReq.startTime}" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								value="${findReq.endTime}" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" />
								<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportUpdateRecord.do');"/>
								<a style="margin-left: 10px;"  href="<%=basePath %>treasury/getTreasuryPeriodicalGoldManageList.do" class="btn_cs">返回</a>
						</p>
					</div>
				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="lb_content_table" id="todaytCont">
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc" id="tableProduct">
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">产品ID</td>
							<td align="center">产品名称</td>
							<td align="center">期限（天）</td>
							<td align="center">转入克重（克）</td>
							<td align="center">年利率</td>
							<td align="center">转入克重（克）</td>
							<td align="center">年利率</td>
							<td align="center">转入克重大于（克）</td>
							<td align="center">年利率</td>
							<td align="center">投资管理费率</td>
							<td align="center">最少持有天数（天）</td>
							<td align="center">提前转出年利率</td>
							<td align="center">排序值</td>
							<td align="center">还款方式</td>
							<td align="center">起息日</td>
							<td align="center">是否在前台展示</td>
							<td align="center">修改人</td>
							<td align="center">修改时间</td>
						</tr>
						<c:forEach items="${pageList.data.pageResult.list }" var="data" varStatus="st">
							<tr>
						        <td>${st.count}</td> 
							    <td>${data.termGoldNo}</td>
							    <td>${data.termGoldName}</td>
						        <td>${data.dueTime}天</td>
								
								<c:if test="${data.stepRateFlag=='Y' }">
									<td>${data.weight1}</td> 
									<td><fmt:formatNumber value="${data.rate1}" maxFractionDigits="2" type="percent" /></td>
									<td>${data.weight2}</td> 
									<td><fmt:formatNumber value="${data.rate2}" maxFractionDigits="2" type="percent" /></td>
									<td>${data.weight3}</td> 
									<td><fmt:formatNumber value="${data.rate3}" maxFractionDigits="2" type="percent" /></td>
								</c:if>
								<c:if test="${data.stepRateFlag=='N' }">
									<td>-</td> 
									<td><fmt:formatNumber value="${data.yearRate}" maxFractionDigits="2" type="percent" /></td>
									<td>-</td> 
									<td>-</td>
									<td>-</td> 
									<td>-</td>
								</c:if>
							    <td><fmt:formatNumber value="${data.manageRate}" maxFractionDigits="2" type="percent" /></td>
							    <td>${data.minDay}天</td>
						        <td><fmt:formatNumber value="${data.preOutRate}" maxFractionDigits="2" type="percent" /></td>
								<td>${data.sort}</td> 
								<td>${data.repaymentName}</td>
								<td>${data.valueDate}</td>
								<td>
									${data.showFlag=='N' ? '否':'是'}
								</td>
								<td>${data.updateBy}</td>
								<td>${data.updateTime}</td>
						       </tr>
						</c:forEach>
					</table>
					
				</div>
				<!--分页-->
				<div >
					<dim:page url="updatePeriodicalGoldRecord.do" totalCount="${pageList.data.pageResult.recordCount }" formId="searchBox" showPages="${pageList.data.pageResult.pageSize }"
						curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
				</div>
				<!--分页  --END-->
			</div>
		</form>
		</div>
	</div>
</body>
</html>
							