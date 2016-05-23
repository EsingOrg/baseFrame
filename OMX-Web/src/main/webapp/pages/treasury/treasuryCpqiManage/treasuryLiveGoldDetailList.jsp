<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
<title>活金明细</title>
<script type="text/javascript">
	//增加校验模式
	dmCheck.init("#allForm");

</script>
</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">活金明细</div>
			<div class="main_con clearfix">
				<div class="user_con">
					<ul class="user_now clearfix">
						<li>
							<p class="yellow">
								<span class="f24">
								<fmt:formatNumber value="${data.statResult == null ? '0.000' : data.statResult.yesterdayRate == null ? '0.000' : data.statResult.yesterdayRate}" maxFractionDigits="2" type="percent" />
								
								</span>
							</p>
							<p>昨日利率</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.yesterdayRateGoldPrice == null ? '0.000' : data.statResult.yesterdayRateGoldPrice}
								</span>元/克
							</p>
							<p>昨日计息金价</p>
						</li>

						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.yesterdayGoldRate == null ? '0.000' : data.statResult.yesterdayGoldRate}
								</span>元
							</p>
							<p>昨日活金利息</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.yesterdayGoldPriceTotal == null ? '0.000' : data.statResult.yesterdayGoldPriceTotal}
								</span>克
							</p>
							<p>昨日活金总计</p>
						</li>
					</ul>
					<ul class="user_now clearfix">
						<li>
							<p class="yellow">
								<span class="f24">
								<fmt:formatNumber value="${data.statResult == null ? '0.000' : data.statResult.newRate == null ? '0.000' : data.statResult.newRate}" maxFractionDigits="2" type="percent" />
								
								</span>
							</p>
							<p>当前利率</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.newGoldPriceTotal == null ? '0.000' : data.statResult.newGoldPriceTotal}
								</span>克
							</p>
							<p>当前活金总计</p>
						</li>
					</ul>
				</div>
			</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="<%=basePath%>treasury/getTreasuryLiveGoldDetailList.do" method="post" id="allForm">
				<input type="hidden" name="flag" value="${flag }"/>
				<div class="main_con">
					<div class="admin_input clearfix">
					<p>
						用户名： <input type="text" name="loginName" class="yhgl_input" maxlength="20" value="${req.loginName }" />
					</p>
					<p>
						姓名： <input type="text" name="realName" class="yhgl_input" maxlength="20" value="${req.realName }"/>
					</p>
					<div style="display: ${flag!=1 ?'none':''}">
						<p>
							角色： <dim:select name="userType" enumType="UserType" headName="全部" headValue="" exclude="SYS" cssClass="yhgl_sel"></dim:select>
						</p>

					</div>
					<div class="person" style="display: ${flag!=2 ?'none':''}">
							<p>
								手机号： <input type="text" name="phoneNumber" class="yhgl_input" maxlength="20" value="${req.phoneNumber }"/>
							</p>

					</div>
					<p>
						我的活金： <input type="text" name="startAvailableWeight" validate="weight"  class="yhgl_input" maxlength="20" value="${req.startAvailableWeight }"/>-
						 <input type="text" name="endAvailableWeight" validate="weight"  class="yhgl_input" maxlength="20" value="${req.endAvailableWeight }"/>
					</p>
					<p class="lo_btn">
						<input type="submit" class="search" value="搜索"  onclick="if(!dmCheck.check('#allForm')){return false;}"/> 
						<shiro:hasPermission  name="JKGL_JKCQGL_HJMX_QB_DC">
						<c:if test="${flag  == 1}">
						<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('allForm','exportLiveGoldDetail.do')"/>
						</c:if>
						</shiro:hasPermission>
						<shiro:hasPermission  name="JKGL_JKCQGL_HJMX_GR_DC">
						<c:if test="${flag  == 2}">
						<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('allForm','exportLiveGoldDetail.do')"/>
						</c:if>
						</shiro:hasPermission>
						<shiro:hasPermission  name="JKGL_JKCQGL_HJMX_DP_DC">
						<c:if test="${flag  == 3}">
						<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('allForm','exportLiveGoldDetail.do')"/>
						</c:if>
						</shiro:hasPermission>
					</p>
				</div>
					
					
				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="menubox clearfix">
					<ul>
						<li class="${flag == 1 ? 'hover' : ''}" ><a href="getTreasuryLiveGoldDetailList.do?flag=1">全部活金</a></li>
						<li class="${flag == 2 ? 'hover' : ''}" ><a href="getTreasuryLiveGoldDetailList.do?flag=2">个人活金</a></li>
						<li class="${flag == 3 ? 'hover' : ''}" ><a href="getTreasuryLiveGoldDetailList.do?flag=3">店铺活金</a></li>
					</ul>
					<shiro:hasPermission  name="JKGL_JKCQGL_HJMX_LSHJLXTJ">
					<a href="<%=basePath %>treasury/visitHistoryLiveGoldCount.do" target="mainFrame"class="yellow" style="  float: right;padding-right: 25px;" >历史活金利息统计</a>
					</shiro:hasPermission>
				</div>
				<div class="menu_bd clearfix all" style="display: ${flag!=1 ?'none':''}">
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc">
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">用户名</td>
							<td align="center">姓名</td>
							<td align="center">角色</td>
							<td align="center">我的活金（克）</td>
							<td align="center">持有活金（克）</td>
							<td align="center">冻结活金（克）</td>
							<td align="center">冻结存金（克）</td>
							<td align="center">用户已挣利息（元）</td>
							<td align="center">最近更新时间</td>
							<td align="center">操作</td>
						</tr>
						<c:forEach items="${data.pageResult.list}" var="dt" varStatus="st">
							<tr>
								<td>${st.count}</td>
					    		<td>${dt.loginName}</td> 
						    	<td>${dt.realName}</td>
						    	<td>${dt.userTypeName}</td>
					        	<td>${dt.allWeight}</td> 
						    	<td>${dt.availableWeight}</td>
						    	<td>${dt.frozenWeight}</td>
						    	<td>${dt.frozenSaveWeight}</td>
					        	<td>${dt.interest}</td>
								<td>${dt.updateTime}</td>
								<td align="center">
									<a href="<%=basePath %>treasury/visitLiveGoldAccrualRecord.do?userId=${dt.userId}&loginName=${dt.loginName}" target="mainFrame"class="yellow" >天息记录</a>
									<a href="<%=basePath %>treasury/visitLiveGoldDealRecord.do?userId=${dt.userId}&loginName=${dt.loginName}" target="mainFrame"class="yellow" >交易记录</a>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td></td><td></td>
							<td >合计：</td>
							<td></td>
							<td align="center">${data.columnStatResult.allWeight }</td>
							<td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td>
							<td align="center">${data.columnStatResult.interest }</td>
							<td>&nbsp;</td><td >&nbsp;</td>
						</tr>
						
					</table>
					</div>
					<div class="menu_bd clearfix ps" style="display: ${flag!=2 ?'none':''}">
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc">
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">用户名</td>
							<td align="center">姓名</td>
							<td align="center">手机号</td>
							<td align="center">我的活金（克）</td>
							<td align="center">持有活金（克）</td>
							<td align="center">冻结活金（元）</td>
							<td align="center">冻结存金（克）</td>
							<td align="center">用户已挣利息（元）</td>
							<td align="center">最近更新时间</td>
							<td align="center">操作</td>
						</tr>
						<c:forEach items="${data.pageResult.list}" var="dt" varStatus="st">
							<tr>
								<td>${st.count}</td>
					    		<td>${dt.loginName}</td> 
						    	<td>${dt.realName}</td>
						    	<td>${dt.phoneNumber}</td>
					        	<td>${dt.allWeight}</td> 
						    	<td>${dt.availableWeight}</td>
						    	<td>${dt.frozenWeight}</td>
						    	<td>${dt.frozenSaveWeight}</td>
					        	<td>${dt.interest}</td>
								<td>${dt.updateTime}</td>
								<td align="center">
									<a href="<%=basePath %>treasury/visitLiveGoldAccrualRecord.do?userId=${dt.userId}&loginName=${dt.loginName}" target="mainFrame"class="yellow" >天息记录</a>
									<a href="<%=basePath %>treasury/visitLiveGoldDealRecord.do?userId=${dt.userId}&loginName=${dt.loginName}" target="mainFrame"class="yellow" >交易记录</a>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td></td><td></td>
							<td >合计：</td>
							<td></td>
							<td align="center">${data.columnStatResult.allWeight }</td>
							<td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td>
							<td align="center">${data.columnStatResult.interest }</td>
							<td>&nbsp;</td><td >&nbsp;</td>
						</tr>
					</table>
					</div>
					<div class="menu_bd clearfix cus" style="display: ${flag!=3 ?'none':''}" id="histCont">
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc">
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">用户名</td>
							<td align="center">店铺名</td>
							<td align="center">我的活金（克）</td>
							<td align="center">持有活金（克）</td>
							<td align="center">冻结活金（元）</td>
							<td align="center">冻结存金（克）</td>
							<td align="center">用户已挣利息（元）</td>
							<td align="center">最近更新时间</td>
							<td align="center">操作</td>
						</tr>
						<c:forEach items="${data.pageResult.list}" var="dt" varStatus="st">
							<tr>
								<td>${st.count}</td>
					    		<td>${dt.loginName}</td> 
						    	<td>${dt.realName}</td>
					        	<td>${dt.allWeight}</td> 
						    	<td>${dt.availableWeight}</td>
						    	<td>${dt.frozenWeight}</td>
						    	<td>${dt.frozenSaveWeight}</td>
					        	<td>${dt.interest}</td>
								<td>${dt.updateTime}</td>
								<td align="center">
									<a href="<%=basePath %>treasury/visitLiveGoldAccrualRecord.do?userId=${dt.userId}&loginName=${dt.loginName}" target="mainFrame"class="yellow" >天息记录</a>
									<a href="<%=basePath %>treasury/visitLiveGoldDealRecord.do?userId=${dt.userId}&loginName=${dt.loginName}" target="mainFrame"class="yellow" >交易记录</a>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td></td><td></td>
							<td >合计：</td>
							<td align="center">${data.columnStatResult.allWeight }</td>
							<td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td>
							<td align="center">${data.columnStatResult.interest }</td>
							<td>&nbsp;</td><td >&nbsp;</td>
						</tr>
					</table>
					</div><br/>
						<!--分页-->
					<div style="margin-top: 25px;" id="pageId">
						<dim:page url="getTreasuryLiveGoldDetailList.do" totalCount="${data.pageResult.recordCount }" formId="allForm" showPages="${data.pageResult.pageSize }"
									curPage="${data.pageResult.pageIndex }" totalPages="${data.pageResult.pageTotal }" />
					</div>
					<!--分页  --END-->
			</div>
			</form>
		</div>
	</div>
</body>
</html>
							