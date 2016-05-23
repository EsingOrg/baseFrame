<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
<title>查看天息记录</title>

<!-- 系统用户显示模板 -->
<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) msg}}
      <tr>
        <td>{{= i+1}}</td> 
	    <td>{{= data.createTime}}</td>
	    <td>{{= data.price}}</td>
        <td>{{= data.weight}}</td> 
	    <td>{{= data.amount}}</td>
	    <td>{{= data.yearRate}}</td>
        <td>{{= data.dayAmount}}</td> 
       </tr>
	{{/each}}
	</script>
	<script id="totalTemplate" type="text/x-jquery-tmpl">

      <tr>
        <td></td> 
	    <td></td>
	    <td>合计</td>
        <td></td> 
	    <td></td>
	    <td></td>
        <td>{{= dayAmountTotal}}</td> 
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
           	 var data2 = ${pageList.data.statResult};
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
			<div class="main_title">历史活金利息统计</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="visitHistoryLiveGoldCount.do" method="post"
				id="searchBox">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p style="margin-top: 3px;">
							天息合计：<span class="yellow">${pageList.data.statResult.dayAmountTotal }</span>元
						</p>
						<p>
							计息时间： <input type="text" name="startTime"
								value="${req.startTime}" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								value="${req.endTime}" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
							<shiro:hasPermission  name="JKGL_JKCQGL_HJMX_LSHJLXTJ_DC">
							<input	name="input" type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportLiveGoldOldDayRecord.do')"/>
							</shiro:hasPermission>
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
							<td align="center">计息时间</td>
							<td align="center">当天金价（元/克）</td>
							<td align="center">我的活金（克）</td>
							<td align="center">价值（元）</td>
							<td align="center">当天利率</td>
							<td align="center">天息（元）</td>
						</tr>
					</table>
				</div>
					<!--分页-->
					<div style="margin-top: 25px;" id="pageId">
						<dim:page url="visitHistoryLiveGoldCount.do" totalCount="${pageList.data.pageResult.recordCount }" formId="searchBox" showPages="${pageList.data.pageResult.pageSize }"
									curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
					</div>
					<!--分页  --END-->
			</div>
			</form>
		</div>
	</div>
	
</body>
</html>
							