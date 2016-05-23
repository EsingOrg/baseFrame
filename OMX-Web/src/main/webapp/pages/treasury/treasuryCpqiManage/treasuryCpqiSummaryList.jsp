<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
<title>存期总览</title>

<!-- 存期总览显示模板 -->
<script id="allTemplate" type="text/x-jquery-tmpl">
	{{each(index) list}}
		<tr {{if index %2 == 0}}class="grey" {{/if}}>
			<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
    		<td>{{= loginName}}</td> 
	    	<td>{{= realName}}</td>
	    	<td>{{= userTypeName}}</td>
        	<td>{{= availableWeight}}</td> 
	    	<td>{{= frozenWeight}}</td>
			<td>{{= frozenSaveWeight}}</td>
	    	<td>{{= termWeight}}</td>
        	<td>{{= allWeight}}</td>
		</tr>
 	{{/each}}
</script>
<!-- 存期总览合计显示模板 -->
<script id="allTotalTemplate" type="text/x-jquery-tmpl">
	<tr class="yellow" >
		<td> </td>
    	<td> </td> 
	   	<td>合计</td>
		<td> </td>       	
		<td>{{= availableWeight}}</td> 
	   	<td>{{= frozenWeight}}</td>
		<td>{{= frozenSaveWeight}}</td>
	   	<td>{{= termWeight}}</td>
       	<td>{{= allWeightTotal}}</td>
	</tr>
</script>
<script type="text/javascript">
	//增加校验模式
	dmCheck.init("#allForm");
	$(function(){
		findAllList();
		
	});
	//加载页面数据
	var findAllList=function(){
		var data = ${data};
		//填充数据模板数据
	    $('#allTemplate').tmpl(data.pageResult).appendTo("#allGird");
		//填充合计数据
	    $('#allTotalTemplate').tmpl(data.columnStatResult).appendTo("#allTotalGird");
	}
</script>
</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">存期总览</div>
			<div class="main_con clearfix">
			<div style="font-size: 20px;">全部累计 &nbsp;&nbsp;&nbsp;&nbsp;  <span class="f24 yellow">${data.statResult == null ? '0.000' : data.statResult.allWeightTotal == null ? '0.000' : data.statResult.allWeightTotal}</span>克</div><br/><br/>
			
				<div class="user_con">
					<ul class="user_now clearfix">
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.availableWeightTotal == null ? '0.000' : data.statResult.availableWeightTotal}
								</span>克
							</p>
							<p>活金统计</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.frozenWeightTotal == null ? '0.000' : data.statResult.frozenWeightTotal}
								</span>克
							</p>
							<p>冻结金统计</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.frozenSaveWeight == null ? '0.000' : data.statResult.frozenSaveWeight}
								</span>克
							</p>
							<p>冻结存金统计</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.termWeightTotal == null ? '0.000' : data.statResult.termWeightTotal}
								</span>克
							</p>
							<p>定期金统计</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.00' : data.statResult.yesterdayGoldRate == null ? '0.00' : data.statResult.yesterdayGoldRate}
								</span>元
							</p>
							<p>昨日活金利息</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24">
								${data.statResult == null ? '0.000' : data.statResult.goldProductRate == null ? '0.000' : data.statResult.goldProductRate}
								</span>元
							</p>
							<p>定期金待付利息</p>
						</li>
					</ul>
				</div>
			</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="<%=basePath%>treasury/getTreasuryCpqiList.do" method="post" id="allForm">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							用户名： <input type="text" name="loginName" class="yhgl_input" maxlength="20" value="${req.loginName }"/>
						</p>
						<p>
							角色：
							<dim:select name="userType" enumType="UserType" headName="全部" headValue="" exclude="SYS" cssClass="yhgl_sel"></dim:select>
						</p>
						<p>
							活金： <input type="text" name="startAvailableWeight" class="yhgl_input" value="${req.startAvailableWeight }" validate="weight" maxlength="20" />-
							<input type="text" name="endAvailableWeight" class="yhgl_input" value="${req.endAvailableWeight }" validate="weight" maxlength="20" />
						</p>
						<p>
							冻结活金： <input type="text" name="startFrozenWeight" class="yhgl_input"  value="${req.startFrozenWeight }" validate="weight" maxlength="20" />-
							<input type="text" name="endFrozenWeight" class="yhgl_input" value="${req.endFrozenWeight }" validate="weight" maxlength="20" />
						</p>
						<p>
							冻结存金： <input type="text" name="startFrozenSaveWeight" class="yhgl_input"  value="${req.startFrozenSaveWeight }" validate="weight" maxlength="20" />-
							<input type="text" name="endFrozenSaveWeight" class="yhgl_input" value="${req.endFrozenSaveWeight }" validate="weight" maxlength="20" />
						</p>
						<p>
							定期金： <input type="text" name="startTermWeight" class="yhgl_input" value="${req.startTermWeight }" validate="weight" maxlength="20" />-
							<input type="text" name="endTermWeight" class="yhgl_input" value="${req.endTermWeight }" validate="weight" maxlength="20" />
						</p>
						<p>
							累计： <input type="text" name="startAllWeight" class="yhgl_input" value="${req.startAllWeight }" validate="weight" maxlength="20" />-
							<input type="text" name="endAllWeight" class="yhgl_input" value="${req.endAllWeight }" validate="weight" maxlength="20" />
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" onclick="if(!dmCheck.check('#allForm')){return false;}" /> 
							<shiro:hasPermission  name="JKGL_JKCQGL_CQZL_DC">
							<input name="input" type="button" class="export ml10" onclick="exportData('allForm','exportSaveDetail.do')" value="导出" />
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
								<td align="center">用户名</td>
								<td align="center">名称</td>
								<td align="center">类型</td>
								<td align="center">活金（克）</td>
								<td align="center">冻结活金（克）</td>
								<td align="center">冻结存金（克）</td>
								<td align="center">定期金（克）</td>
								<td align="center">累计（克）</td>
							</tr>
						</thead>
						<tbody id="allGird"></tbody>
						<tbody id="allTotalGird"></tbody>
					</table>
					<!--分页-->
				<div style="margin-top: 25px;" id="pageId">
					<dim:page url="getTreasuryCpqiList.do" totalCount="${data.pageResult.recordCount }" formId="allForm" showPages="${data.pageResult.pageSize }"
								curPage="${data.pageResult.pageIndex }" totalPages="${data.pageResult.pageTotal }" />
				</div>
				<!--分页  --END-->
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>
							