<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>待审核</title>

<!-- 系统用户显示模板 -->
<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
	{{each(i,wd) msg}}
      <tr>
        <td>{{= i+1}}</td> 
	    <td>{{= wd.userName}}</td>
	    <td>{{= wd.userFullName}}</td>
        <td>{{= wd.userPhone}}</td> 
	    <td>{{= wd.bankName}}</td>
	    <td>{{= wd.branchName}}</td>
        <td>{{= wd.cardNo}}</td> 
		<td>{{= wd.amount}}</td>
		<td>{{= wd.acturalAmount}}</td>
		<td>{{= wd.fee}}</td>
		<td>{{= wd.thirdFee}}</td>
		<td>{{= wd.applyTime}}</td>
		<td>
			{{if wd.source=='ANDROID' || wd.source=='AD'}}
				安卓
			{{else wd.source=='IOS'}}
				苹果
			{{else wd.source=='PC'}}
				前端
			{{/if}}
		</td>
        <td>
			<shiro:hasPermission name="CWGL_TX_DSH_TG">
           <a onclick="popDiv('<%=basePath %>finance/cashout.do?id={{= wd.id}}&status=PASS&userId={{= wd.userId}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange cashout "  >  通过</a>
           </shiro:hasPermission>
			<shiro:hasPermission name="CWGL_TX_DSH_BTG">
			<a onclick="popDiv('<%=basePath %>finance/cashOutNot.do?id={{= wd.id}}&status=NOPASS&userId={{= wd.userId}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange" >不通过</a>
			</shiro:hasPermission>
        </td>
       </tr>
	{{/each}}
	</script>
	<script id="tableTemplate" type="text/x-jquery-tmpl">
      <tr>
        <td colspan="3">总计共{{= count}}笔</td> 
        <td></td> 
	    <td></td>
	    <td></td>
        <td></td> 
		<td>{{= withdrawAmountTotal}}</td>
		<td>{{= actualAmountTotal}}</td>
		<td>{{= toRecivingFeeTotal}}</td>
		<td>{{= receivedFeeTotal}}</td>
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
			<form action="<%=basePath%>finance/getFinancePeingList.do"
				method="post" id="dataForm">
				<input type="hidden" name="status" value="${financePeing.status}">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							用户名： <input type="text" name="userName" class="yhgl_input"
								value="${financePeing.userName}" maxlength="20" />
						</p>
						<p>
							来源： 
							<form:select path="financePeing.source" class="yhgl_sel">
								<option value="">全部</option>
								<form:option value="AD">安卓</form:option>
								<form:option value="IOS">苹果</form:option>
								<form:option value="PC">前端</form:option>
							</form:select>
						</p>
						<p>
							申请时间： <input type="text" name="applyStartTime"
								value="${financePeing.applyStartTime}" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="applyEndTime"
								value="${financePeing.applyEndTime}" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" />
							<shiro:hasPermission name="CWGL_TX_DSH_DC">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportAuditInfo.do');"/>
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
							<td>用户名</td>
							<td>姓名</td>
							<td>手机号</td>
							<td>银行</td>
							<td>所在支行</td>
							<td>银行卡号</td>
							<td>提现金额（元）</td>
							<td>实到金额（元）</td>
							<td>应收手续费（元）</td>
							<td>实收手续费（元）</td>
							<td>申请时间</td>
							<td>来源</td>
							<td>操作</td>
						</tr>

					</table>
				</div>
				<!--分页-->
				<div style="margin-top: 25px;">
					<dim:page url="getFinancePeingList.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
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
