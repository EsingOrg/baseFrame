<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>订单异常日志</title>

<!-- 系统用户显示模板 -->
<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
	{{each(i,record) msg}}
      <tr>
        <td>{{= i+1}}</td> 
	    <td>{{= record.orderNo}}</td>
        <td>{{= record.orderType}}</td>
		<td>{{= record.createTime}}</td>
		<td>
           <a onclick="popDiv('{{= i}}')" href="javascript:void(0)" class="orange" >查看</a>
        </td>
       </tr>
	{{/each}}
	</script>
<script type="text/javascript">
		var data = [];
        //页面加载时调用
        $(function(){
    	  sysUserListLoad();//jquery 模板demo
        });
        var sysUserListLoad = function(){
        	//造的测试数据，实际应用时，将ajax返回的json数据替换这里的data即可
       	data = ${pageList.data.pageResult.list};
       	 $('#sysUserListTemplate').tmpl({msg:data}).appendTo("#sysUserListGrid");
       };
        //弹出框
        function popDiv(index){
     	   $("#showDialog span").text(data[index].remark);
     	   $("#showDialog").show();
        }
    </script>

</head>
<body>


	<div class="systemUser">
		<div class="r_main clearfix ">
			<!-- 搜索框 -->
			<form action="<%=basePath%>finance/getFinanceOrderExceptions.do"
				method="post" id="dataForm">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							订单编号： <input type="text" name="orderNo" class="yhgl_input"
								value="${exception.orderNo}" maxlength="20" />
						</p>
						<p>
							订单类型： 
							<dim:select name="orderType" enumType="OrderType" headName="全部" headValue="" exclude="" cssClass="yhgl_sel"></dim:select>
						</p>
						<p>
							发生时间： <input type="text" name="startTime"
								value="${exception.startTime }" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								value="${exception.endTime }" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
							<shiro:hasPermission name="CWGL_DDMX_YCRZ_DC">
							<input name="input" type="button" class="export ml10" onclick="exportData('dataForm','exportOrderException.do')" value="导出" />
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
							<td>订单类型</td>
							<td>发生时间</td>
							<td>操作</td>
						</tr>

					</table>
				</div>
				<!--分页-->
				<div style="margin-top: 25px;" id="pageId">
					<dim:page url="getFinanceOrderExceptions.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
								curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
				</div>
				<!--分页  --END-->
			</div>
			</form>
		</div>
	</div>
<div id="showDialog" style="display: none">
<div class="popup_bg"></div>
<div class="dialog">
  <div class="clearfix">
      <div class="title"><a href="javascript:;" onClick="$('#showDialog').hide();" class="out"></a>原因</div>
      <div class="cotent">
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table"> 
          <tr>            
            <td><span></span></td>
          </tr>
        </table>
      </div>
      <div class="btn"><a href="#" class="btn_cs" onClick="$('#showDialog').hide();" class="out" >确认</a></div> 
    </div>
</div>
</div>
</body>
</html>
