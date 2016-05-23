<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
<title>查看交易记录</title>

<!-- 系统用户显示模板 -->
<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) msg}}
      <tr>
        <td>{{= i+1}}</td> 
	    <td>{{= data.orderNo}}</td>
	    <td>{{= data.orderTypeName}}</td>
        <td>{{= data.businessWeight}}</td> 
	    <td>{{= data.businessPrice}}</td>
	    <td>{{= data.businessAmount}}</td>
        <td>{{= data.businessTime}}</td>
       </tr>
	{{/each}}
	</script>
	<script id="totalTemplate" type="text/x-jquery-tmpl">
      <tr>
        <td></td> 
	    <td></td>
	    <td>合计</td>
        <td>{{= businessWeight}}</td> 
	    <td>{{= businessPrice}}</td>
	    <td>{{= businessAmount}}</td>
        <td></td>
       </tr>
	</script>
<script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  document.getElementById("")
    	  sysUserListLoad();//jquery 模板demo
        });
        var sysUserListLoad = function(){
        	//造的测试数据，实际应用时，将ajax返回的json数据替换这里的data即可
       	 var data = ${pageList.data.pageResult.list};
       	var data2 = ${pageList.data.columnStatResult};
       	//清空模板类容
       	 $('#sysUserListTemplate').tmpl({msg:data}).appendTo("#sysUserListGrid");
       	 
       	$('#totalTemplate').tmpl(data2).appendTo("#sysUserListGrid");
       }
    
    </script>

</head>
<body>

	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">查看交易记录</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="visitLiveGoldDealRecord.do" method="post"
				id="searchBox">
				<input type="hidden" name="userId" value="${req.userId }">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p style="margin-top: 3px;">
							用户名：${req.loginName }
							<input type="hidden" name="loginName" value="${req.loginName }">
						</p>
						<p>
							订单号： <input type="text" name="orderNo" class="yhgl_input"
								value="${req.orderNo}" maxlength="23" />
						</p>
						<p>
							类型： 
							 <dim:select name="orderType" enumType="OrderType" headName="全部" headValue="" exclude="SALE,TAKE,CHANGE,CHANGE_SAVE,CHANGE_TAKE" cssClass="yhgl_sel"></dim:select>
						</p>
						<p>
							成交金重： <input type="text" name="startBusinessWeight" class="yhgl_input"
								value="${req.startBusinessWeight}" maxlength="20" />-
								<input type="text" name="endBusinessWeight" class="yhgl_input"
								value="${req.endBusinessWeight}" maxlength="20" />
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportLiveGoldExcRecord.do')"/>
						</p>
						<p><a href="<%=basePath %>treasury/getTreasuryLiveGoldDetailList.do?flag=1" class="btn_cs" >返回</a></p>
					</div>
				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="menu_bd clearfix" id="todaytCont">
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc" id="sysUserListGrid">
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">类型</td>
							<td align="center">成交金重（克）</td>
							<td align="center">成交金价（元/克）</td>
							<td align="center">成交额（元）</td>
							<td align="center">交易时间</td>
						</tr>
					</table>
				</div>
					<!--分页-->
					<div style="margin-top: 25px;" id="pageId">
						<dim:page url="visitLiveGoldDealRecord.do" totalCount="${pageList.data.pageResult.recordCount }" formId="searchBox" showPages="${pageList.data.pageResult.pageSize }"
									curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
					</div>
					<!--分页  --END-->
			</div>
			</form>
		</div>
	</div>
	
</body>
</html>
							