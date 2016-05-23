<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
<title>定期金明细</title>
<!-- 定期金明细显示模板 -->
<script id="allTemplate" type="text/x-jquery-tmpl">
	{{each(index) list}}
		<tr {{if index %2 == 0}}class="grey" {{/if}}>
			<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
			<td>{{= orderNo}}</td> 
    		<td>{{= productNo}}</td> 
	    	<td>{{= productName}}</td>
	    	<td>{{= loginName}}</td>
        	<td>{{= userName}}</td> 
	    	<td>{{= userTypeName}}</td>
			<td>{{= dueTime}}</td>
    		<td>{{= weight}}</td> 
	    	<td>{{= price}}</td>
	    	<td>{{= yearRate}}</td>
        	<td>{{= repaymentName}}</td> 
	    	<td>{{= waitAmount}}</td>
			<td>{{= startDate}}</td> 
	    	<td>{{= endDate}}</td>
			<td>{{= surplusDay}}</td>
		</tr>
 	{{/each}}
</script>
<script id="overTemplate" type="text/x-jquery-tmpl">
	{{each(index) list}}
		<tr {{if index %2 == 0}}class="grey" {{/if}}>
			<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
			<td>{{= orderNo}}</td> 
    		<td>{{= productNo}}</td> 
	    	<td>{{= productName}}</td>
	    	<td>{{= loginName}}</td>
        	<td>{{= userName}}</td> 
	    	<td>{{= userTypeName}}</td>
			<td>{{= dueTime}}</td>
    		<td>{{= weight}}</td> 
	    	<td>{{= price}}</td>
	    	<td>{{= yearRate}}</td>
        	<td>{{= repaymentName}}</td> 
	    	<td >{{= waitAmount}}</td>
			<td>{{= startDate}}</td> 
	    	<td>{{= endDate}}</td>
			<td>{{= statusName}}</td>
		</tr>
 	{{/each}}
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
		var dNum=${dNum};
		if(dNum != -1){
			$('#allTemplate').tmpl(data.pageResult).appendTo("#allGird");
		}else{
			$('#overTemplate').tmpl(data.pageResult).appendTo("#overTable");
		}
	    
	}
</script>
</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">定期金明细</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="<%=basePath%>treasury/getTreasuryTermGoldDetailList.do" method="post" id="allForm">
				<input type="hidden" name="flag" value="${flag}"/>
				<input type="hidden" name="dNum" value="${dNum}"/>
				<div class="main_con">
					<div class="admin_input clearfix">
					<p>
						订单号： <input type="text" name="orderNo" class="yhgl_input"
							value="${req.orderNo}" maxlength="23" />
					</p>
					<p>
						产品ID： <input type="text" name="productNo" class="yhgl_input"
							value="${req.productNo}" maxlength="20" />
					</p>
					<p>
						产品名称： <input type="text" name="productName" class="yhgl_input"
							value="${req.productName}" maxlength="20" />
					</p>
					<p>
							用户名： <input type="text" name="loginName" class="yhgl_input"
								value="${req.loginName}" maxlength="20" />
					</p>
					<p>
							名称： <input type="text" name="userName" class="yhgl_input"
								value="${req.userName}" maxlength="20" />
						</p>
						<c:if test="${flag == '1'}">
					<div class="all" >
						<p>
							类型：
							 <dim:select name="userType" enumType="UserType" headName="全部" headValue="" exclude="SYS" cssClass="yhgl_sel"></dim:select>
						</p>
						</div>
						</c:if>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索"  onclick="if(!dmCheck.check('#allForm')){return false;}" /> 
							<shiro:hasPermission  name="JKGL_JKCQGL_DQJMX_DC">
								<input	name="input" type="button" class="export ml10" value="导出" onclick="exportData('allForm','${dNum!=-1?'exportTermGoldDetail.do':'exportTermGoldOverDetail.do'}')"/>
							</shiro:hasPermission>
						
						</p>
					</div>
					
					
				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="menubox clearfix">
					<ul>
						<li class="${flag == '1' ? 'hover' : '' }" id="all"><a href="getTreasuryTermGoldDetailList.do?flag=1&dNum=0">全部定期金</a></li>
						<li class="${flag == '2' ? 'hover' : '' }"><a href="getTreasuryTermGoldDetailList.do?flag=2&dNum=0">个人定期金</a></li>
						<li class="${flag == '3' ? 'hover' : '' }"><a href="getTreasuryTermGoldDetailList.do?flag=3&dNum=0">店铺定期金</a></li>
					</ul>
				</div>
				<div class="menubox clearfix" style="border-bottom: 0px;  padding-left: 20px;">
					<ul>
						<li class="${dNum==0?'hover':'' } days"  style="width: 80px;height: 30px;color: #fff;padding-left: 16px;cursor: pointer;border-radius: 5px;"><a href="getTreasuryTermGoldDetailList.do?dNum=0&flag=${flag}">全部</a></li>
						<c:forEach items="${dayData.data.list}" var="dt" varStatus="st">
							<c:if test="${dNum==st.count }">
								<input type="hidden" name="productId" value="${dt.productId }"/>
							</c:if>
							<li class="${dNum==st.count?'hover':'' } days"  style="width: 80px;height: 30px;color: #fff;padding-left: 16px;cursor: pointer;border-radius: 5px;"><a href="getTreasuryTermGoldDetailList.do?productId=${dt.productId }&dNum=${st.count}&flag=${flag}">${dt.dueTime }天</a></li>
						</c:forEach>
						<li class="${dNum==-1?'hover':'' } days" style="width: 80px;height: 30px;color: #fff;padding-left: 16px;cursor: pointer;border-radius: 5px;"><a href="getTreasuryTermGoldDetailList.do?dNum=-1&flag=${flag}">已到期</a></li>
					</ul>
				</div>
				
				<div style="display: ${dNum==-1?'none':''}">
				<div class="lb_content_table all befortable" >
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc">
						<thead>
							<tr class="title">
								<td align="center">序号</td>
								<td align="center">订单号</td>
								<td align="center">产品ID</td>
								<td align="center">产品名称</td>
								<td align="center">用户名</td>
								<td align="center">名称</td>
								<td align="center">类型</td>
								<td align="center">期限（天）</td>
								<td align="center">定期金（克）</td>
								<td align="center">价值（元）</td>
								<td align="center">年化利率</td>
								<td align="center">结息方式</td>
								<td align="center">应付（元）</td>
								<td align="center">开始时间</td>
								<td align="center">到期时间</td>
								<td align="center">距离下次结息天数（天）</td>
							</tr>
						</thead>
						<tbody id="allGird"></tbody>
					</table>
					</div>
					
					<div style="font-size: 16px;" class="all befortable">
					<ul >
						<li style="width: 290px;text-align: inherit; float: left;">
							定期金合计: &nbsp;&nbsp;&nbsp;&nbsp;
								<span class="f24 yellow">${data.columnStatResult.weightTotal }</span>克
							
							
						</li>
						<li style="width: 290px;text-align: inherit;float: left;">
							 &nbsp;&nbsp;&nbsp;&nbsp;应付合计 :&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="f24 yellow">${data.columnStatResult.waitAmountTotal }</span>元
						</li>
					</ul>
				</div>
				</div>	
				<div style="display: ${dNum!=-1?'none':''}">
				<div class="lb_content_table all befortable" >
				
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc" id="overTable">
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">产品ID</td>
							<td align="center">产品名称</td>
							<td align="center">用户名</td>
							<td align="center">名称</td>
							<td align="center">类型</td>
							<td align="center">期限（天）</td>
							<td align="center">定期金（克）</td>
							<td align="center">价值（元）</td>
							<td align="center">年化利率</td>
							<td align="center">结息方式</td>
							<td align="center">已赚（元）</td>
							<td align="center">开始时间</td>
							<td align="center">完结时间</td>
							<td align="center">备注</td>
						</tr>
					</table>
					</div>
					<div style="font-size: 16px;" class="balancecusdiv">
					<ul >
						<li style="width: 290px;text-align: inherit; float: left;">
							定期金合计: &nbsp;&nbsp;&nbsp;&nbsp;
								<span class="f24 yellow">${data.columnStatResult.weightTotal }</span>克
							
							
						</li>
						<li style="width: 290px;text-align: inherit;float: left;">
							 &nbsp;&nbsp;&nbsp;&nbsp;已赚合计 :&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="f24 yellow">${data.columnStatResult.waitAmountTotal }</span>元
							
							
						</li>
					</ul>
				</div>
				</div>
					<!--分页-->
					<br/>
					<div style="margin-top: 25px;" id="pageId">
						<dim:page url="getTreasuryTermGoldDetailList.do" totalCount="${data.pageResult.recordCount }" formId="allForm" showPages="${data.pageResult.pageSize }"
									curPage="${data.pageResult.pageIndex }" totalPages="${data.pageResult.pageTotal }" />
					</div>
					<!--分页  --END-->	
			</div>
			</form>
		</div>
	</div>
</body>
</html>
							