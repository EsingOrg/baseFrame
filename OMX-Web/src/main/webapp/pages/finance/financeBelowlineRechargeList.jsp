<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>线下充值</title>

<!-- 系统用户显示模板 -->
<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
	{{each(i,recharge) msg}}
      <tr>
        <td>{{= i+1}}</td>
	    <td>{{= recharge.userName}}</td>
        <td>{{= recharge.userFullName}}</td> 
	    <td>{{= recharge.userPhone}}</td>
	    <td>{{= recharge.amount}}</td>
        <td>{{= recharge.createBy}}</td> 
		<td>{{= recharge.createTime}}</td>
		<td>{{= recharge.approver}}</td>
		<td>{{= recharge.approverTime}}</td>
		{{if recharge.status == 'APPROVING'}}
		<td>待审核</td>
		{{else recharge.status=='PASS'}}
		<td>审核通过</td>
		{{else}}
		<td>审核不通过</td>
		{{/if}}
		<td style="WORD-WRAP: break-word">{{= recharge.remark}}</td>
		<td>
		{{if recharge.status == 'APPROVING'}}
			<shiro:hasPermission name="CWGL_DDMX_YCRZ_TG">
		 		<a  class="orange" href="javascript:void(0);" onclick="popDiv('<%=basePath %>finance/auditPass.do?id={{= recharge.id}}&t=<%=Math.random() %>&userId={{= recharge.userId}}')">通过</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="CWGL_DDMX_YCRZ_BTG">
		  		<a  class="orange" href="javascript:void(0);" onclick="popDiv('<%=basePath %>finance/auditNoPass.do?id={{= recharge.id}}&t=<%=Math.random() %>&userId={{= recharge.userId}}')" >不通过</a>
			</shiro:hasPermission>
		{{/if}}
        </td>
       </tr>
	{{/each}}
	</script>
	<script id="tableTemplate" type="text/x-jquery-tmpl">
      <tr>
        <td colspan="2">总计共{{= countTotal}}笔</td>
        <td></td> 
	    <td></td>
	    <td>{{= rechargeTotal}}</td>
        <td></td> 
		<td></td>
		<td></td>
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
       	 //统计数据
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
			<form action="<%=basePath%>finance/getFinanceBelowlineRecharge.do"
				method="post" id="dataForm">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							用户名： <input type="text" name="userName" class="yhgl_input"
								value="${financeBelowlineRecharge.userName}" maxlength="20" />
						</p>
						<p>
			                                       姓名：
			                 <input type="text" name="userFullName"  class="yhgl_input" value="${financeBelowlineRecharge.userFullName}" maxlength="20"/>
	           			</p>
	           			<p>
							状态：
							<dim:select name="status" enumType="RechargeOfflineStatus" headName="全部" headValue="" exclude="" cssClass="yhgl_sel"></dim:select>
						</p>
						<p>
			                                       创建人：
			                 <input type="text" name="createBy"  class="yhgl_input" value="${financeBelowlineRecharge.createBy}" maxlength="20"/>
	           			</p>
	           			<p>
			                                       审核人：
			                 <input type="text" name="approver"  class="yhgl_input" value="${financeBelowlineRecharge.approver}" maxlength="20"/>
	           			</p>
	           			<p>审核时间：
						   <input type="text" name="startUpdateTime" value="${ financeBelowlineRecharge.startUpdateTime}" class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
						   <span class="mr5">至</span> 
						   <input type="text" name="endUpdateTime" value="${ financeBelowlineRecharge.endUpdateTime}" class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
						</p>
						<p>创建时间：
						   <input type="text" name="startCreateTime"  value="${ financeBelowlineRecharge.startCreateTime}" class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
						   <span class="mr5">至</span> 
						   <input type="text" name="endCreateTime"  value="${ financeBelowlineRecharge.endCreateTime}" class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" />
							<shiro:hasPermission name="CWGL_CZJL_XXCZ_DC">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportOffline.do');"/>
							</shiro:hasPermission>
							<shiro:hasPermission name="CWGL_CZJL_XXCZ_XZ">
							<a href="#" onclick="popDiv('<%=basePath %>finance/financeaddBelowlineRechargeBox.do?id={{= id}}&t=<%=Math.random() %>')"  class="btn_cs ml10"><i class="newly"></i>新增</a>
							</shiro:hasPermission>
						</p>
					</div>
				</div>
			
			<!--搜索表框  --END-->
			
			<div class="main_con">
				<div class="menu_bd clearfix">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" style="TABLE-LAYOUT: fixed" cellpadding="3"
						class="main_table tc" id="sysUserListGrid">
						<tr class="title">
							<td>序号</td>
							<td>用户名</td>
							<td>姓名</td>
							<td>手机号</td>
							<td>充值金额（元）</td>
							<td>创建人</td>
							<td>创建时间</td>
							<td>审核人</td>
							<td>审核时间</td>
							<td>状态</td>
							<td>备注</td>
							<td>操作</td>
						</tr>

					</table>
				</div>
				<!--分页-->
				<div style="margin-top: 25px;">
					<dim:page url="getFinanceBelowlineRecharge.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
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
