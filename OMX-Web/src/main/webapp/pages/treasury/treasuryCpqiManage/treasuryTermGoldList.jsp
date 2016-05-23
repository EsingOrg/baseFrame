<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
<title>定期金金库</title>
<!-- 定期金金库显示模板 -->
<script id="allTemplate" type="text/x-jquery-tmpl">
	{{each(index) list}}
		<tr {{if index %2 == 0}}class="grey" {{/if}}>
			<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
    		<td>{{= loginName}}</td> 
	    	<td>{{= userName}}</td>
	    	<td>{{= userTypeName}}</td>
        	<td>{{= weight}}</td> 
	    	<td>{{= waitAmount}}</td>
		</tr>
 	{{/each}}
</script>
<!-- 定期金金库合计显示模板 -->
<script id="allTotalTemplate" type="text/x-jquery-tmpl">
	<tr class="yellow" >
		<td> </td>
    	<td> </td> 
		<td> </td> 
	   	<td>合计</td>
		<td>{{= weightTotal}}</td> 
	   	<td>{{= waitAmountTotal}}</td>
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
<c:if test="${param.errMsg ne null}">
	<script type="text/javascript">
		dm.alert(decodeURIComponent(''));
	</script>
</c:if>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">定期金金库</div>
			<div class="main_con clearfix" >
          	<div><span class="f16">定期金累积：</span><span class="f24 yellow">${data.statResult == null ? '0.000' : data.statResult.weightTotal == null ? '0.000' : data.statResult.weightTotal}</span>克</div>
            <ul class="accumulat clearfix">
            	<c:forEach items="${data.statResult.weightAmountList}" var="dt" varStatus="st">
            		 <li>${dt.dueTime }天定期金克重：${dt.weight == null ? '0.000' : dt.weight}克</li>
            	</c:forEach>               
            </ul>
            <div><span class="f16">定期金待付利息：</span><span class="f24 yellow">${data.statResult == null ? '0.000' : data.statResult.waitAmountTotal == null ? '0.000' : data.statResult.waitAmountTotal}</span>元</div>
            <ul class="accumulat clearfix">
            	<c:forEach items="${data.statResult.weightAmountList}" var="dt" varStatus="st">
            		 <li>${dt.dueTime }天待付利息：${dt.waitAmount == null ? '0.00' : dt.waitAmount}元</li>
            	</c:forEach>             
            </ul>
          </div> 
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form  action="<%=basePath%>treasury/getTreasuryTermGoldList.do" method="post" id="allForm">
				<input type="hidden" value="${flag }" name="flag"/>
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							用户名： <input type="text" name="loginName" class="yhgl_input"
								value="${req.loginName}" maxlength="20" />
						</p>
						<p>
							类型： 
							<dim:select name="userType" enumType="UserType" headName="全部" headValue="" exclude="SYS" cssClass="yhgl_sel"></dim:select>
						</p>
						<p>
							定期金克重： <input type="text" name="startWeight"  validate="weight" value="${req.startWeight}" class="yhgl_input" validate="weight" maxlength="20" />-
							<input type="text" name="endWeight" validate="weight"  value="${req.endWeight}" class="yhgl_input" validate="weight" maxlength="20" />
						</p>
						<p>
							用户待赚利息： <input type="text"  validate="amount" name="startWaitAmount" value="${req.startWaitAmount}" class="yhgl_input" validate="amount" maxlength="20" />-
							 <input type="text" validate="amount"  name="endWaitAmount"  value="${req.endWaitAmount}" class="yhgl_input" validate="amount" maxlength="20" />
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索"   onclick="if(!dmCheck.check('#allForm')){return false;}"/> 
							<shiro:hasPermission  name="JKGL_JKCQGL_DQJJK_DC">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('allForm','exportTermGoldList.do')"/>
							</shiro:hasPermission>
						</p>
					</div>
				</div>
			
			<!--搜索表框  --END-->
			<div class="main_con">
				<div class="menubox clearfix">
					<ul>
						<li class="${flag==0?'hover':'' } days" style="width: 80px;height: 30px;color: #fff;padding-left: 16px;cursor: pointer;border-radius: 5px;"><a href="getTreasuryTermGoldList.do?flag=0">全部</a></li>
						<c:forEach items="${dayData.data.list}" var="dt" varStatus="st">
							<c:if test="${flag==st.count }">
								<input type="hidden" name="productId" value="${dt.productId }"/>
							</c:if>
							<li class="${flag==st.count?'hover':'' } days"  style="width: 80px;height: 30px;color: #fff;padding-left: 16px;cursor: pointer;border-radius: 5px;"><a href="getTreasuryTermGoldList.do?productId=${dt.productId }&flag=${st.count}">${dt.dueTime }天</a></li>
						</c:forEach>
						
					</ul>
				</div>
				<div class="menu_bd clearfix" id="todaytCont">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
						<thead>
						<tr class="title">
							<td name="test">序号</td>
							<td>用户名</td>
							<td>名称</td>
							<td>类型</td>
							<td>定期金克重（克）</td>
							<td>用户待赚利息（元）</td>
						</tr>
				        </thead>
				        <tbody id="allGird"></tbody>
				        <tbody id="allTotalGird"></tbody>
					</table>
				<!--分页-->
				<div style="margin-top: 25px;" id="pageId">
						<dim:page url="getTreasuryTermGoldList.do" totalCount="${data.pageResult.recordCount }" formId="allForm" showPages="${data.pageResult.pageSize }"
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
							