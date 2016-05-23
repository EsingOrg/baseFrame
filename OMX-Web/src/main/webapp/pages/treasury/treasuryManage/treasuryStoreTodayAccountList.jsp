<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
<title>店铺今日台账</title>
<script type="text/javascript">
	//增加校验模式
	dmCheck.init("#sysStockForm");
</script>
</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">店铺今日台账<span style="margin-left: 130px;">正欠负存</span></div>
			<div class="main_con clearfix">
				<div class="user_con  all" id="allStat">
					<ul class="user_now clearfix">
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.yeasterdayWeightTotal == null ? '0.000' : data.statResult.yeasterdayWeightTotal}
								</span>克
							</p>
							<p>昨天结余</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.saveWeight == null ? '0.000' : data.statResult.saveWeight}
								</span>克
							</p>
							<p>${flag == 1 ? '存入合计' : flag == 2 ? '客户存入':'店铺存入'}</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.takeWeight == null ? '0.000' : data.statResult.takeWeight}
								</span>克
							</p>
							<p>${flag == 1 ? '提取合计' : flag == 2 ? '客户提取':'店铺提取'}</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.sendWeight == null ? '0.000' : data.statResult.sendWeight}
								</span>克
							</p>
							<p>平台已发货</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.getWeight == null ? '0.000' : data.statResult.getWeight}
								</span>克
							</p>
							<p>平台已收货</p>
						</li>
					</ul>
				</div>
			</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="getTreasuryStoreTodayAccountList.do" method="post"
				id="sysStockForm">
				<input type="hidden" name="flag" value="${flag }">
				<div class="main_con">
					<div class="admin_input clearfix">
						<div class="all">
							<p>
								用户名： <input type="text" name="userName" class="yhgl_input" value="${req.userName}" maxlength="20" />
							</p>
							<p>
								店铺名： <input type="text" name="shopName" class="yhgl_input" value="${req.shopName}" maxlength="20" />
							</p>
							<p>
								${flag == 1 ? '' : flag == 2 ? '客户':'店铺'}存入： <input type="text" value="${req.startSaveWeight}" name="startSaveWeight" class="yhgl_input" validate="weight" maxlength="20" /> 
								-<input type="text" name="endSaveWeight" class="yhgl_input" value="${req.endSaveWeight}" validate="weight" maxlength="20" />
							</p>
							<p>
								${flag == 1 ? '' : flag == 2 ? '客户':'店铺'}提取： <input type="text" value="${req.startTakeWeight}" name="startTakeWeight" class="yhgl_input" validate="weight" maxlength="20" /> 
								-<input type="text" name="endTakeWeight" class="yhgl_input" value="${req.endTakeWeight}" validate="weight" maxlength="20" />
							</p>
							<p>
								平台已发货： <input type="text" name="startSendWeight" class="yhgl_input" value="${req.startSendWeight}" validate="weight" maxlength="20" />
								-<input type="text" name="endSendWeight" class="yhgl_input" value="${req.endSendWeight}" validate="weight" maxlength="20" />
							</p>
							
							<p>
								平台已收货： <input type="text" name="startGetWeight" class="yhgl_input" value="${req.startGetWeight}" validate="weight" maxlength="20" />
								-<input type="text" name="endGetWeight" class="yhgl_input" value="${req.endGetWeight}" validate="weight" maxlength="20" />
							</p>
							<c:if test="${flag != 3 }">
								<p>
									调整克重： <input type="text" name="startAdjustWeight" class="yhgl_input" value="${req.startAdjustWeight}" validate="weight" maxlength="20" /> 
									-<input type="text" name="endAdjustWeight" class="yhgl_input" value="${req.endAdjustWeight}" validate="weight" maxlength="20" />
								</p>
							</c:if>
							
						</div>
						<p class="lo_btn" >
							<input  type="submit" class="search" value="搜索"  onclick="if(!dmCheck.check('#sysStockForm')){return false;}"/> 
							<shiro:hasPermission  name="JKGL_JKGL_DPJRTZ_QB_DC">
							<c:if test="${flag == 1}">
							<input  name="input" type="button" class="export ml10" value="导出" onclick="exportData('sysStockForm','todayAccountExport.do')" />
							</c:if>
							</shiro:hasPermission>
							<shiro:hasPermission  name="JKGL_JKGL_DPJRTZ_GR_DC">
							<c:if test="${flag == 2}">
							<input  name="input" type="button" class="export ml10" value="导出" onclick="exportData('sysStockForm','todayAccountExport.do')" />
							</c:if>
							</shiro:hasPermission>
							<shiro:hasPermission  name="JKGL_JKGL_DPJRTZ_ZY_DC">
							<c:if test="${flag == 3}">
							<input  name="input" type="button" class="export ml10" value="导出" onclick="exportData('sysStockForm','todayAccountExport.do')" />
							</c:if>
							</shiro:hasPermission>
						</p>
					</div>
				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="menubox clearfix">
					<ul>
						<li class="${flag == 1 ? 'hover':'' }" id="allTab"><a href="getTreasuryStoreTodayAccountList.do?flag=1">店铺今日全部业务</a></li>
						<li class="${flag == 2 ? 'hover':'' }" id="personalTab"><a href="getTreasuryStoreTodayAccountList.do?flag=2">店铺今日处理个人业务</a></li>
						<li class="${flag == 3 ? 'hover':'' }" id="shopTab"><a href="getTreasuryStoreTodayAccountList.do?flag=3">店铺今日自营业务</a></li>
					</ul>
				</div>
				<div class="lb_content_table all" id="allTable">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">

						<tr class="title">
							<td align="center">序号</td>
							<td align="center">用户名</td>
							<td align="center">店铺名</td>
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
					    		<td>${dt.userName}</td> 
						    	<td>${dt.shopName}</td>
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
					<dim:page url="getTreasuryStoreTodayAccountList.do" totalCount="${data.pageResult.recordCount }" formId="sysStockForm" showPages="${data.pageResult.pageSize }"
								curPage="${data.pageResult.pageIndex }" totalPages="${data.pageResult.pageTotal }" />
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>
