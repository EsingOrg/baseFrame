<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>提金总表</title>

<script id="allTemp" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= orderNo}}</td>
	    <td>{{= allUserName}}</td>
        <td>{{= allUserFullName}}</td>
        <td>{{= userTypeName}}</td> 
	    <td>{{= bookWeight}}</td>
	    <td>{{= takeWeight}}</td>
        <td>{{= netWeight}}</td> 
	    <td>{{= minusSave}}</td>
        <td>{{= minusBuy}}</td> 
		<td>{{= fee}}</td>
		<td>{{= processFee}}</td>
  		<td>{{= postFee}}</td>
        <td>{{= remainSave}}</td>
		<td>{{= remainBuy}}</td>
		<td>{{= createTime}}</td>
		<td>{{= updateTime}}</td>
		<td>{{= statusName}}</td>
		<td>
		<a  href="takeGoldDetail.do?id={{= id}}&url=getGoldList.do&orderType={{= orderType}}&userType={{= userType}}&takeType={{= takeType}}" class="orange">订单详情</a>
		</td>
       </tr>
	{{/each}}
</script>

<script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  document.getElementById("")
    	  search();//表格加载
        });
      //初始加载数据
    	function search(){
    		DMGold.ajax({"formId":"form","serialize":true,"url":"getGoldListAjax.do","success":pageTagCallBack});
    	}
    	function pageTagCallBack(data){
     		//清空表格数据
     		$("#allTable").empty();
     		//填充数据
    		 $('#allTemp').tmpl(data.pageResult).appendTo("#allTable");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"getGoldListAjax.do","toPageCallBack":pageTagCallBack});
    		//统计字段
    		DMGold.PageTag.initStat({"totalTakeWeight":null,"totalMinusSave":null,"totalMinusBuy":null,
    			"totalRemainSave":null,"totalRemainBuy":null,"totalBookWeight":null,
    			"totalNetWeight":null,"totalProcessFee":null},data.statResult,'0.000');
        	DMGold.PageTag.initStat({"totalFee":null,"totalPostFee":null,},data.statResult,'0.00');
     	}
    </script>

</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">提金总表</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="getGoldList.do" method="post" id="form">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							订单号： <input type="text" name="orderNo" class="yhgl_input" maxlength="23"/>
						</p>
						<p>
							用户名：  <input type="text" name="allUserName" class="yhgl_input" maxlength="20"/>
						</p>
						
						<p>
							名称：  <input type="text" name="allUserFullName" class="yhgl_input" maxlength="20"/>
						</p>
						<p>
			                                        角色：
			            	 <dim:select name="userType" enumType="UserType" headName="全部" headValue="" exclude="SYS" cssClass="yhgl_sel"></dim:select>
			            	 
				        </p>
						<p>
			                                        状态：
			            	 <dim:select name="status" enumType="TakeGoldStatus" headName="全部" headValue="" exclude="SYS_CANCEL" cssClass="yhgl_sel"></dim:select>
			            	 
				        </p>
				        <p>提交时间：
							<input type="text" name="startCreateTime" class="yhgl_input date"  value="${order.startCreateTime }"id="createTime1" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'createTime2\')}'})" />
						   <span class="mr5">至</span> 
						   <input type="text" name="endCreateTime" class="yhgl_input date"  value="${order.endCreateTime }" id="createTime2" onclick="WdatePicker({minDate: '#F{$dp.$D(\'createTime1\')}'})" />
						</p>

						<p class="lo_btn">
							<input type="button" onclick="search();" class="search" value="搜索" />
							<shiro:hasPermission name="YWGL_TJYW_TJZB_DC">
							 <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('form','exportAllTakeGold.do');"/>
							</shiro:hasPermission>
						</p>
					</div>
				</div>
			</form>
			<!--搜索表框  --END-->

			<div class="main_con">
				<!-- 全部 -->
					<table width="100%" border="0" cellspacing="0" cellpadding="3" 
						class="main_table tc">
						<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">用户名</td>
							<td align="center">名称</td>
							<td align="center">角色</td>
							<td align="center">提金克重(克)</td>
							<td align="center">实提克重(克)</td>
							<td align="center">实发净重(克)</td>
							<td align="center">扣除存源(克)</td>
							<td align="center">扣除买源(克)</td>
							<td align="center">手续费(元)</td>
							<td align="center">加工费(元)</td>
							<td align="center">邮保费(元)</td>
							<td align="center">剩余存源(克)</td>
							<td align="center">剩余买源(克)</td>
							<td align="center">提交时间</td>
							<td align="center">最后操作时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr></thead><tbody id="allTable"></tbody>
					</table>
				<div class="all">
		          	<p class="fl stat">实提克重合计：<span class="yellow f24" id="totalTakeWeight"></span>克</p>
		          	<p class="stat fl">扣除存源合计：<span class="yellow f24" id="totalMinusSave"></span>克</p>
		          	<p class="stat fl">扣除买源合计：<span class="yellow f24" id="totalMinusBuy"></span>克</p>
		          	<p class="stat fl">手续费合计：<span class="yellow f24" id="totalFee"></span>元</p>
		          	<p class="stat fl">加工费合计：<span class="yellow f24" id="totalProcessFee"></span>元</p>
		          	<p class="stat fl">邮保费合计：<span class="yellow f24" id="totalPostFee"></span>元</p>
		          	<p class="stat fl">剩余存源合计：<span class="yellow f24" id="totalRemainSave"></span>克</p>
		          	<p class="stat fl">剩余买源合计：<span class="yellow f24" id="totalRemainBuy"></span>克</p>
		          	<p class="stat fl">提金克重合计：<span class="yellow f24" id="totalBookWeight"></span>克</p>
		          	<p class="stat fl">实发净重合计：<span class="yellow f24" id="totalNetWeight"></span>克</p>
		        </div>
				<div class="paging" id="pageTag"></div>
				</div>
					<!--分页  --END-->
			</div>
		</div>
</body>
</html>
