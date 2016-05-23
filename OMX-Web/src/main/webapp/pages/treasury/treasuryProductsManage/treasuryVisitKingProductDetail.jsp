<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>查看黄金制品的详情</title>

<!-- 系统用户显示模板 -->
<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) msg}}
      <tr>
        <td>{{= i+1}}</td> 
	    <td>{{= data.orderId}}</td>
	    <td>{{= data.loginName}}</td>
        <td>{{= data.realName}}</td> 
	    <td>{{= data.productName}}</td>
	    <td>{{= data.productSize}}</td>
        <td>{{= data.productCount}}</td> 
		<td>{{= data.productAmount}}</td>
		<td>{{= data.createTime}}</td>
		<td>{{= data.logisticCompany}}</td>
		<td>{{= data.orderStatusName}}</td>
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
       	 $('#sysUserListTemplate').tmpl({msg:data}).appendTo("#tableData");
       }
    
    </script>

</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">查看制品</div>
			<div class="main_con clearfix" >
            <ul class="accumulat clearfix">
                <li style="width: 50%;">制品ID：${pageList.data.singleResult.productNo }</li>
                <li style="width: 50%;">制品名称：${pageList.data.singleResult.productName }</li>
                <li style="width: 50%;">新建人：${pageList.data.singleResult.createBy }</li>
                <li style="width: 50%;">新建时间：${pageList.data.singleResult.createTime }</li>
                <li style="width: 50%;">最后操作人：${pageList.data.singleResult.updateBy }</li>
                <li style="width: 50%;">最后操作时间：${pageList.data.singleResult.updateTime }</li>
                <li style="width: 50%;">发布人：${pageList.data.singleResult.publishBy }</li>
                <li style="width: 50%;">发布时间：${pageList.data.singleResult.publishTime }</li>
                <li style="width: 50%;">下架人：${pageList.data.singleResult.offlineBy }</li>
                <li style="width: 50%;">下架时间：${pageList.data.singleResult.offlineTime }</li>                
            </ul>
            <a href="javascript:void(0);" onclick="window.location.href='<%=basePath%>treasury/getTreasuryKingProductList.do';" class="btn_cs fr mr20">返回</a>
          </div> 
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="<%=basePath%>treasury/visitKingProductDetail.do" method="post" id="searchBox">
				<input type="hidden" name="productNo" value="${findProduct.productNo }">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							提交时间： <input type="text" name="startTime"
								value="${findProduct.startTime}" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								value="${findProduct.endTime}" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>
						<p>
							制品名称： <input type="text" name="name" class="yhgl_input"
								value="${findProduct.name}" maxlength="20" />
						</p>
						<p>
							状态： 
								<dim:select name="orderStatus" enumType="OrderStatus" headName="全部" headValue="" exclude="SUCCESSFUL,BOOK,SYS_RECEIVE,PERSONAL_CONFIRM,SHOP_SEND,SHOP_RECEIVE,SYS_CHECK,SHOP_CONFIRM,SCENE_CANCEL,PERSONAL_CANCEL,SYS_CANCEL,SHOP_CANCEL" cssClass="yhgl_sel"></dim:select>
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportProductDetail.do');"/>
						</p>
					</div>
				</div>
			
			<!--搜索表框  --END-->
			
			<div class="main_con">
				<div class="menu_bd clearfix" id="todaytCont">
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc" id="tableData">
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">用户名</td>
							<td align="center">姓名</td>
							<td align="center">制品名称</td>
							<td align="center">规格（克）</td>
							<td align="center">成交（件）</td>
							<td align="center">成交总计（克）</td>
							<td align="center">提交时间</td>
							<td align="center">物流方</td>
							<td align="center">状态</td>
						</tr>
					</table>
					<!--分页-->
				<div style="margin-top: 25px;">
					<dim:page url="visitKingProductDetail.do" totalCount="${pageList.data.pageResult.recordCount }" formId="searchBox" showPages="${pageList.data.pageResult.pageSize }"
									curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
				</div>
				<!--分页  --END-->
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>
							