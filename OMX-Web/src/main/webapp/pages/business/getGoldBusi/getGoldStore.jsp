<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>店铺提金</title>
<script id="allTemp" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= orderNo}}</td>
	    <td>{{= shopName}}</td>
        <td>{{= shopFullName}}</td> 
	    <td>{{= bookWeight}}</td>
	    <td>{{= netWeight}}</td>
        <td>{{= minusSave}}</td> 
		<td>{{= minusBuy}}</td>
		<td>{{= fee}}</td>
		<td>{{= remainSave}}</td>
		<td>{{= remainBuy}}</td>
		<td>{{= createBy}}</td>
		<td>{{= createTime}}</td>
		<td>{{= updateTime}}</td>
		<td>{{= statusName}}</td>
		<td>
			<a  href="goldStoreDetail.do?id={{= id}}" class="orange">订单详情</a>
		</td>
       </tr>
	{{/each}}
</script>
<script type="text/javascript">
    $(function(){
  	 search();
    });
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
    //初始加载数据
	function search(){
		DMGold.ajax({"formId":"form","serialize":true,"url":"getGoldStoreAjax.do","success":pageTagCallBack});
	}
	function pageTagCallBack(data){
 		//清空表格数据
 		$("#allTable").empty();
 		//填充数据
		 $('#allTemp').tmpl(data.pageResult).appendTo("#allTable");
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"getGoldStoreAjax.do","toPageCallBack":pageTagCallBack});
		//统计字段
		DMGold.PageTag.initStat({"totalBookWeight":null,"totalMinusSave":null,"totalMinusBuy":null,
			"totalRemainSave":null,"totalRemainBuy":null,"totalNetWeight":null},data.statResult,'0.000');
    	DMGold.PageTag.initStat({"totalFee":null},data.statResult,'0.00');
 	}
    </script>

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
			<div class="main_title">店铺提金</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="getGoldStore.do" method="post" id="form">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							订单号：
							<input type="text" name="orderNo" class="yhgl_input"  maxlength="23"/>
						</p>
						<p>
							用户名：<input type="text" name="shopName" class="yhgl_input" maxlength="20"/>
						</p>
						
						<div class="all">
							<p>
								店铺名称： <input type="text" name="shopFullName" class="yhgl_input" maxlength="20" />
							</p>
							
					         <p>提交时间：
								<input type="text" name="startCreateTime" class="yhgl_input date" id="createTime1" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'createTime2\')}'})" />
							    <span class="mr5">至</span> 
							    <input type="text" name="endCreateTime" class="yhgl_input date" id="createTime2" onclick="WdatePicker({minDate: '#F{$dp.$D(\'createTime1\')}'})" />
							</p>
							<p>
					                                        状态：
					            	<dim:select name="status" enumType="TakeGoldStatus" headName="全部" headValue="" exclude="BOOK,PERSONAL_CANCEL,SCENE_CANCEL,PERSONAL_CONFIRM,PERSONAL_RECEIVE" cssClass="yhgl_sel"></dim:select>
					        </p>
						</div>

						<p class="lo_btn">
							<input type="button" onclick="search();" class="search" value="搜索" /> 
							 <shiro:hasPermission name="YWGL_TJYW_DPTJ_DC">
							 <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('form','exportShopTakeGold.do');"/>
							</shiro:hasPermission>
						</p>
					</div>
				</div>
			<!--搜索表框  --END-->
			<div class="main_con">
				<!-- 全部 -->
					<table width="100%" border="0" cellspacing="0" cellpadding="3" 
						class="main_table tc">
						<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">店铺名</td>
							<td align="center">店铺名称</td>
							<td align="center">提金克重(克)</td>
							<td align="center">实发净重(克)</td>
							<td align="center">扣除存源(克)</td>
							<td align="center">扣除买源(克)</td>
							<td align="center">手续费(元)</td>
							<td align="center">剩余存源(克)</td>
							<td align="center">剩余买源(克)</td>
							<td align="center">店铺操作人</td>
							<td align="center">提交时间</td>
							<td align="center">最后操作时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr></thead><tbody id="allTable"></tbody>
					</table>
				<div class="mt10 all">
		          	<p class="stat fl">提金克重合计：<span class="yellow f24" id="totalBookWeight"></span>克</p>
		          	<p class="stat fl">扣除存源合计：<span class="yellow f24" id="totalMinusSave"></span>克</p>
		          	<p class="stat fl">扣除买源合计：<span class="yellow f24" id="totalMinusBuy"></span>克</p>
		          	<p class="stat fl">剩余存源合计：<span class="yellow f24" id="totalRemainSave"></span>克</p>
		          	<p class="stat fl">剩余买源合计：<span class="yellow f24" id="totalRemainBuy"></span>克</p>
		          	<p class="stat fl">手续费合计：<span class="yellow f24" id="totalFee"></span>元</p>
		          	<p class="stat fl">实发净重合计：<span class="yellow f24" id="totalNetWeight"></span>克</p>
		          	<p class="stat fl"></p><p class="stat fl"></p><p class="stat fl"></p>
		        </div>
				<div  class="paging" id="pageTag"></div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
