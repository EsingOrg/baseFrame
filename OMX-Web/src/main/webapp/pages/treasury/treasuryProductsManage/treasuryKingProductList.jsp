<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>黄金制品</title>

<!-- 活金利率显示模板 -->
<script id="allTemplate" type="text/x-jquery-tmpl">
	{{each(index) list}}
		<tr {{if index %2 == 0}}class="grey" {{/if}}>
			<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
    		<td>{{= productNo}}</td> 
	    	<td>{{= productName}}</td>
	    	<td>{{= productSize}}</td>
        	<td>{{= productCount}}</td> 
	    	<td>{{= statusName}}</td>
			<td>{{= loginName}}</td> 
	    	<td>{{= updateTime}}</td>
			<td align="center">
				<a href="<%=basePath %>treasury/visitKingProductDetail.do?productNo={{= productNo}}" target="mainFrame"class="yellow" >查看</a>
				{{if productStatus == 'UNPUBLISH'}}
					<shiro:hasPermission name="JKGL_ZPGL_HJZP_BJ">
					<a onclick="popDiv('<%=basePath %>treasury/updateKingProductBox.do?productNo={{= productNo}}')" href="javascript:void(0)"   target="mainFrame"class="yellow" >编辑</a>
					</shiro:hasPermission>					
					<shiro:hasPermission name="JKGL_ZPGL_HJZP_FB">
					<a onclick="popDiv('<%=basePath %>treasury/publishTheKingProduct.do?productNo={{= productNo}}')" href="javascript:void(0)" target="mainFrame"class="yellow" >发布</a>
					</shiro:hasPermission>					
					<shiro:hasPermission name="JKGL_ZPGL_HJZP_ZF">
					<a onclick="popDiv('<%=basePath %>treasury/cancelTheKingProduct.do?productNo={{= productNo}}')" href="javascript:void(0)" target="mainFrame"class="yellow" >作废</a>
					</shiro:hasPermission>
				{{/if}}
				<shiro:hasPermission name="JKGL_ZPGL_HJZP_XJ">
				{{if productStatus == 'PUBLISH'}}
					<a onclick="popDiv('<%=basePath %>treasury/removeTheKingProduct.do?productNo={{= productNo}}')" href="javascript:void(0)" target="mainFrame"class="yellow" >下架</a>
				{{/if}}
				</shiro:hasPermission>
			</td>
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
	    $('#allTemplate').tmpl(data.pageResult).appendTo("#allGird");
	}
</script>
</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">黄金制品</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="<%=basePath%>treasury/getTreasuryKingProductList.do" method="post" id="dataForm">
				<div class="main_con">
					<div class="admin_input clearfix">
					<p>
						制品ID： <input type="text" name="productNo" class="yhgl_input"
							value="${req.productNo}" maxlength="20" />
						<p>
							制品名称： <input type="text" name="name" class="yhgl_input"
								value="${req.name}" maxlength="20" />
						</p>
						<p>
							状态：<dim:select name="status" enumType="ProductStatus" headName="全部" headValue="" exclude="" cssClass="yhgl_sel"></dim:select>
						</p>
						<p>
							操作时间： <input type="text" name="startTime"
								value="${req.startTime}" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								value="${req.endTime}" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>
						
						
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
							<shiro:hasPermission name="JKGL_ZPGL_HJZP_DC">
								<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportGoldProduct.do');"/>
							</shiro:hasPermission>
							<shiro:hasPermission name="JKGL_ZPGL_HJZP_XJZP">
								<a style="margin-left: 10px;" onclick="popDiv('<%=basePath %>treasury/addProductBox.do')" href="javascript:void(0)" class="btn_cs">新建制品</a>
							</shiro:hasPermission>
						</p>
					</div>
					
					
				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="menu_bd clearfix all">
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc">
						<thead>
							<tr class="title">
								<td align="center">序号</td>
								<td align="center">制品ID</td>
								<td align="center">制品名称</td>
								<td align="center">规格（克）</td>
								<td align="center">已成交（件）</td>
								<td align="center">状态</td>
								<td align="center">操作人</td>
								<td align="center">最后操作时间</td>
								<td align="center">操作</td>
							</tr>
						</thead>
						<tbody id="allGird" ></tbody>
					</table>
					</div>
					
						<!--分页-->
					<div style="margin-top: 25px;" id="pageId">
						<dim:page url="getTreasuryKingProductList.do" totalCount="${data.pageResult.recordCount }" formId="dataForm" showPages="${data.pageResult.pageSize }"
									curPage="${data.pageResult.pageIndex }" totalPages="${data.pageResult.pageTotal }" />
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
 		popDiv('<%=basePath %>system/sysuser_modify_pwd.jsp?id='+id+'&ln='+loginNames+'&t=<%=Math.random() %>');
 	}
 </script>
</html>
							