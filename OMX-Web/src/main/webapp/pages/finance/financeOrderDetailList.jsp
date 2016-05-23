<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>订单明细列表</title>

<!-- 系统用户显示模板 -->
<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
	{{each(i,order) msg}}
      <tr>
        <td>{{= i+1}}</td> 
	    <td>{{= order.orderNo}}</td>
	    <td>{{= order.userName}}</td>
        <td>{{= order.orderTypeName}}</td> 
	    <td>{{= order.weight}}</td>
	    <td>{{= order.dealPrice}}</td>
        <td>{{= order.amount}}</td> 
		<td>{{= order.inWeight}}</td> 
		<td>{{= order.outWeight}}</td> 
		<td>{{= order.balanceWeight}}</td> 
		<td>{{= order.createTime}}</td>
		<td>{{= order.createTime}}</td>
		
		<td>{{if order.status == 'SUCCESS'}}{{= order.updateTime}}{{/if}}</td>
		<td>{{= order.statusName}}</td>
       </tr>
	{{/each}}
	</script>
<script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  sysUserListLoad();//jquery 模板demo
        });
        var sysUserListLoad = function(){
        	//造的测试数据，实际应用时，将ajax返回的json数据替换这里的data即可
       	 var data = ${pageList.data.pageResult.list};
       	//清空模板类容
       	 $('#sysUserListTemplate').tmpl({msg:data}).appendTo("#sysUserListGrid");
       }
    
    </script>

</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!-- 搜索框 -->
			<form action="getFinanceOrderDetail.do" method="post" id="dataForm">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							用户名： <input type="text" name="userName" class="yhgl_input"
								value="${fr.userName}" maxlength="20" />
						</p>
						<p>
							订单类型：
							<dim:select name="orderType" enumType="OrderType" headName="全部" headValue="" exclude="" cssClass="yhgl_sel"></dim:select>
						</p>
						<p>
							状态：
							<dim:select name="status" enumType="OrderStatus" headName="全部" headValue="" exclude="" cssClass="yhgl_sel"></dim:select>							 
						</p>
						<p>
							创建时间：
							<input type="text" name="startCreateTime" class="yhgl_input date"  value="${fr.startCreateTime }"id="createTime1" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'createTime2\')}'})" />
							<span class="mr5">至</span> 
							<input type="text" name="endCreateTime" class="yhgl_input date"  value="${fr.endCreateTime }" id="createTime2" onclick="WdatePicker({minDate: '#F{$dp.$D(\'createTime1\')}'})" />
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
							<shiro:hasPermission name="CWGL_DDMX_DDMX_DC">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportOrderDetailInfo.do');"/>
							</shiro:hasPermission>
						</p>
					</div>
				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="menu_bd clearfix">
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc" id="sysUserListGrid">
						<tr class="title">
							<td>序号</td>
							<td>订单编号</td>
							<td>用户名</td>
							<td>订单类型</td>
							<td>成交克重（克）</td>
							<td>成交金价（元）</td>
							<td>成交金额（元）</td>
							<td>收入（克）</td>
							<td>支出（克）</td>
							<td>结余（克）</td>
							<td>创建时间</td>
							<td>提交时间</td>
							<td>完成时间</td>
							<td>状态</td>
						</tr>

					</table>
				</div>
				<!--分页-->
				<div style="margin-top: 25px;">
					<dim:page url="getFinanceOrderDetail.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
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
