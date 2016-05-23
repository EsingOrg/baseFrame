<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>个人交易记录</title>

<!-- 系统用户显示模板 -->
<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
	{{each(i,record) msg}}
      <tr>
        <td>{{= i+1}}</td> 
		<td>{{= record.userName}}</td>
	    <td>{{= record.createTime}}</td>
	    <td>{{= record.type}}</td>
        <td>{{= record.inAmount}}</td> 
	    <td>{{= record.outAmount}}</td>
	    <td>{{= record.balanceAmount}}</td>
        <td>{{= record.remark}}</td>
       </tr>
	{{/each}}
	</script>
	<script id="tableTemplate" type="text/x-jquery-tmpl">
      <tr>
        <td>总计共{{= count}}条</td> 
		<td></td>
	    <td></td>
	    <td></td>
        <td>{{= inTotal}}</td> 
	    <td>{{= outTotal}}</td>
	    <td>{{= balanceTotal}}</td>
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
			<form action="<%=basePath%>finance/getFinancePersonTradingRecord.do"
				method="post" id="dataForm">
				<input type="hidden" name="userType" value="${transReq.userType }">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							用户名： <input type="text" name="userName" class="yhgl_input"
								value="${transReq.userName}" maxlength="20" />
						</p>
						<p>
							类型： 
							<dim:select name="type" enumType="TransType" headName="全部" headValue="" exclude="BORROW_MGMT,SAVE,TAKE,CHANGE,CHANGE_SAVE,CHANGE_TAKE" cssClass="yhgl_sel"></dim:select>
						</p>
						<p>
							时间： <input type="text" name="startTime"
								value="${transReq.startTime}" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								value="${transReq.endTime}" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
							<shiro:hasPermission name="CWGL_JYJL_GRJYJL_DC">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportPersonRecord.do');"/>
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
							<td>时间</td>
							<td>类型</td>
							<td>收入（元）</td>
							<td>支出（元）</td>
							<td>结余（元）</td>
							<td>备注</td>
						</tr>

					</table>
				</div>
				<!--分页-->
				<div style="margin-top: 25px;">
					<dim:page url="getFinancePersonTradingRecord.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
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
