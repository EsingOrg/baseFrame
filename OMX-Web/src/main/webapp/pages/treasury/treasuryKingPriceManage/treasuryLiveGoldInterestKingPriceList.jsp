<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>活金日息金价</title>
<!-- 系统用户显示模板 -->
<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
	{{each(i,pc) msg}}
      <tr>
        <td>{{= i+1}}</td> 
	    <td>{{= pc.time}}</td>
	    <td>{{= pc.price}}</td>
        <td>{{= pc.updatePrice}}</td> 
	    <td>{{= pc.loginName}}</td>
	    <td>{{= pc.updateTime}}</td>
		<td align="center">
			<a href="<%=basePath %>treasury/liveGoldDetail.do?no={{= pc.no}}&priceDate={{= pc.time}}&price={{= pc.price}}&updatePrice={{= pc.updatePrice}}" target="mainFrame"class="yellow" >查看</a>
			<shiro:hasPermission name="JKGL_JJGL_HJJXJJ_XG">
			<a onclick="popDiv('<%=basePath %>treasury/updateLiveGoldInterestKingPriceBox.do?no={{= pc.no}}&price={{= pc.price}}&nowPrice={{= pc.updatePrice}}')" href="javascript:void(0)"   target="mainFrame"class="yellow" >修改</a>
			</shiro:hasPermission>
		</td>
       </tr>
	{{/each}}
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
       	 $('#sysUserListTemplate').tmpl({msg:data}).appendTo("#tableData");
       	 
       }
    
    </script>

</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">活金日息金价</div>
			<div class="main_con clearfix">
				<div style="font-size: 20px;">
					当前平台活金交易金价 &nbsp;&nbsp;&nbsp;&nbsp; <span class="f24 yellow">${pageList.data.statResult.newPrice}</span>元/克
				</div>
			</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="<%=basePath%>treasury/getLiveGoldInterestKingPrice.do"
				method="post" id="dataForm">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							修改人： <input type="text" name="loginName" class="yhgl_input"
								value="${price.loginName}" maxlength="20" />
						<p>
						<p>
							修改时间： <input type="text" name="startTime"
								value="${price.startTime}" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								value="${price.endTime}" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>


						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" />
							<shiro:hasPermission name="JKGL_JJGL_HJJXJJ_DC">
							 <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportLiveRestGoldPrice.do');"/>
							 </shiro:hasPermission>
						</p>
					</div>


				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="menu_bd clearfix">
						<table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" id= "tableData">
							<tr class="title">
								<td align="center">序号</td>
								<td align="center">日期</td>
								<td align="center">活息金价（元/克）</td>
								<td align="center">修改金价（元/克）</td>
								<td align="center">修改人</td>
								<td align="center">修改时间</td>
								<td align="center">操作</td>
							</tr>
							
						</table>
				</div>

				<!--分页-->
				<div style="margin-top: 25px;">
					<dim:page url="getLiveGoldInterestKingPrice.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
								curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
				</div>
				<!--分页  --END-->
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
 		popDiv('<%=basePath%>system/sysuser_modify_pwd.jsp?id='+id+'&ln='+loginNames+'&t=<%=Math.random()%>');
	}
</script>
</html>
