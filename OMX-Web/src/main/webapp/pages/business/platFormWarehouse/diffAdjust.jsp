<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>店铺称差调整</title>
</head>
<body>
<c:if test="${errMsg ne null}">
<script type="text/javascript">
  //错误提示
  dm.alert(decodeURIComponent('${errMsg}'));
</script>
</c:if>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">店铺称差调整</div>
			<div class="main_con clearfix">
			<div class="user_con">
                <ul class="user_now clearfix">
                    <li>
                        <p class="yellow"><span class="f24" id="totalAdjustWeight"></span>克</p>
                        <p>累计调整克重</p>
                    </li>
                    <li>
                        <p class="yellow"><span class="f24" id="todayTotalAdjustWeight"></span>克</p>
                        <p>今日调整</p>
                    </li>
                </ul>
          	</div>
          	</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form id="form">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							订单号： <input type="text" name="orderNo" class="yhgl_input" maxlength="23" />
						</p>
						<p>
							店铺名称： <input type="text" name="shopName" class="yhgl_input" maxlength="20" />
						</p>
						<p>
							调整克重： <input type="text" name="startWeight"  validate="weight" class="yhgl_input"maxlength="20" />克 至
							<input type="text" name="endWeight"  validate="weight" class="yhgl_input"maxlength="20" />克
						</p>
						<p>
							新增人： <input type="text" name="realName" class="yhgl_input"maxlength="20" />
						</p>
						<p>新增时间： 
							  	<input type="text" name="startTime" class="yhgl_input date" id="createTime1" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'createTime2\')}'})" />
								<span class="mr5">至</span>
								<input type="text" name="endTime" class="yhgl_input date"  id="createTime2" onclick="WdatePicker({minDate: '#F{$dp.$D(\'createTime1\')}'})" />
						</p>
						<p class="lo_btn">
							<input type="button" onclick="search();" class="search" value="搜索" /> 
							<shiro:hasPermission name="YWGL_PTCRK_DPCCTZ_DC">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('form','exportDiffAdjust.do');" />
							</shiro:hasPermission><shiro:hasPermission name="YWGL_PTCRK_DPCCTZ_XZCC">
							<a style="margin-left:10px;" onclick="popDiv('addDiffAdjustBox.do')" href="javascript:void(0)" class="btn_cs">新增称差</a>
							</shiro:hasPermission>
						</p>
					</div>
				</div>
			</form>
			<!--搜索表框  --END-->

			<div class="main_con">
				<!-- 全部 -->
				<div class=" all">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
					<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">用户名</td>
							<td align="center">店铺名称</td>
							<td align="center">调整克重(克)</td>
							<td align="center">备注</td>
							<td align="center">新增人</td>
							<td align="center">新增时间</td>
						</tr>
						</thead><tbody id="grid"></tbody>
					</table>
				</div>
				<!-- 全部  END -->
					<!--分页-->
						<div id="pageTag"></div>
					<!--分页  --END-->
			</div>
		</div>
	</div>
</body>
<!-- 映射模板（列表） -->
<script id="allTemp" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
		<td>{{= orderNo}}</td> 
	    <td>{{= shopUserId}}</td>
		<td>{{= shopName}}</td> 
	    <td>{{= weight}}</td>
	    <td>{{= remark}}</td>
        <td>{{= realName}}</td> 
		<td>{{= createTime}}</td> 
       </tr>
	{{/each}}
</script>
<script type="text/javascript">
//增加校验模式
dmCheck.init("#form");
//页面加载时调用
$(function()
{
	search();
});
//弹出框
function popDiv(url)
{
 	$.tbox.popup(url);
}
//分页跳转回调
function pageTagCallBack(data){
	//清空表格数据
	$("#grid").empty();
	//填充数据
	$('#allTemp').tmpl(data.pageResult).appendTo("#grid");
	//初始化分页标签
	DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
	          "pageCount":data.pageResult.pageTotal,"url":"diffAdjustAjax.do","toPageCallBack":pageTagCallBack});
	//统计数据
	DMGold.PageTag.initStat({"totalAdjustWeight":null,"todayTotalAdjustWeight":null},data.statResult,"0.000");
}
//初始加载数据
function search(){
	DMGold.ajax({"formId":"form","serialize":true,"url":"diffAdjustAjax.do","success":pageTagCallBack});
}
 </script>
</html>
				