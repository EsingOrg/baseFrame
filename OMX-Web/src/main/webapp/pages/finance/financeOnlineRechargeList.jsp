<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>线上充值</title>

<!-- 系统用户显示模板 -->
<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
	{{each(i,recharge) msg}}
      <tr>
        <td>{{= i+1}}</td> 
	    <td>{{= recharge.orderNo}}</td>
	    <td>{{= recharge.userName}}</td>
        <td>{{= recharge.userFullName}}</td> 
	    <td>{{= recharge.userPhone}}</td>
	    <td>{{= recharge.amount}}</td>
        <td>{{= recharge.actualAmount}}</td> 
		<td>{{= recharge.toReceivingFee}}</td>
		<td>{{= recharge.actualFee}}</td>
		<td>{{= recharge.createTime}}</td>
		
		<td>{{= recharge.status}}</td>
		<td>
			{{if recharge.terminal=='android' || recharge.terminal=='ad'}}
				安卓
			{{else recharge.terminal=='ios'}}
				苹果
			{{else recharge.terminal=='pc'}}
				前端
			{{/if}}
		</td>	
		<td>{{= recharge.billNo}}</td>
       </tr>
	{{/each}}
	</script>
	
	<script id="tableTemplate" type="text/x-jquery-tmpl">
      <tr>
        <td colspan="2">总计共{{= countTotal}}笔</td>
	    <td></td>
        <td></td> 
	    <td></td>
	    <td>{{= rechargeTotal}}</td>
        <td>{{= actualTotal}}</td> 
		<td>{{= feeTotal}}</td>
		<td>{{= actualFeeTotal}}</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
       </tr>
	</script>
<script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  sysUserListLoad();//jquery 模板demo
        });
        var sysUserListLoad = function(){
        	//造的测试数据，实际应用时，将ajax返回的json数据替换这里的data即可
       	 var data = ${pageList.data.pageResult.list};
       	 
       	var data2 = ${pageList.data.columnStatResult};
       	//清空模板类容
       	 $('#sysUserListTemplate').tmpl({msg:data}).appendTo("#sysUserListGrid");
       	 
       	 $('#tableTemplate').tmpl(data2).appendTo("#sysUserListGrid");
       }
    
    </script>

</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!-- 搜索框 -->
			<form action="<%=basePath%>finance/getFinanceOnlineRecharge.do"
				method="post" id="dataForm">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
			                                        用户名：
			                 <input type="text" name="userName"  class="yhgl_input" value="${financeOnlineRechargeReq.userName}" maxlength="20"/>
	           			</p>
	           			<p>
			                                       订单号：
			                 <input type="text" name="orderNo"  class="yhgl_input" value="${financeOnlineRechargeReq.orderNo}" maxlength="23"/>
	           			</p>
	           			<p>
			                                       流水号：
			                 <input type="text" name="billNo"  class="yhgl_input" value="${financeOnlineRechargeReq.billNo}" maxlength="20"/>
	           			</p>
	           			
						<p>充值时间：
						   <input type="text" name="startTime" value="${financeOnlineRechargeReq.startTime}" class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
						   <span class="mr5">至</span> 
						   <input type="text" name="endTime" value="${financeOnlineRechargeReq.endTime}" class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
						</p>
						<p>
							充值状态： 
							<dim:select name="status" enumType="RechargeOnlineStatus" headName="全部" headValue="" exclude="" cssClass="yhgl_sel"></dim:select>
						</p>
						<p>
							来源：<form:select path="financeOnlineRechargeReq.source" cssClass="yhgl_sel">
								<option value="">全部</option>
								<form:option value="PC">前端</form:option>
								<form:option value="AD">安卓</form:option>
								<form:option value="IOS">苹果</form:option>
							</form:select>
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
							<shiro:hasPermission name="CWGL_CZJL_XSCZ_DC">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportOnline.do');"/>
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
							<td>订单号</td>
							<td>用户名</td>
							<td>姓名</td>
							<td>手机号</td>
							<td>充值金额（元）</td>
							<td>实到金额（元）</td>
							<td>应收手续费（元）</td>
							<td>实收手续费（元）</td>
							<td>充值时间</td>
							<td>充值状态</td>
							<td>来源</td>
							<td>流水单号</td>
						</tr>

					</table>
				</div>
				<!--分页-->
				<div style="margin-top: 25px;">
					<dim:page url="getFinanceOnlineRecharge.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
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
