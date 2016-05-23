<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>平台入库</title>
</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">平台入库</div>
			<div class="main_con clearfix">
			<div class="user_con">
                <ul class="user_now clearfix">
                    <li>
                        <p class="yellow"><span class="f24" id="totalWeight"></span>克</p>
                        <p>累计采购克重</p>
                    </li>
                    <li>
                        <p class="yellow"><span class="f24" id=totalCount></span>笔</p>
                        <p>累计采购笔数</p>
                    </li>
                    <li>
                        <p class="yellow"><span class="f24" id="todayWeight"></span>克</p>
                        <p>今日采购克重</p>
                    </li>
                    <li>
                        <p class="yellow"><span class="f24" id="todayCount"></span>笔</p>
                        <p>今日采购笔数</p>
                    </li>
                </ul>
          	</div>
          	</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form id="searchBox">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							订单号： <input type="text" name="orderNo" class="yhgl_input" maxlength="23" />
						</p>
						<p>
							入库克重： <input type="text" name="minWeight"  validate="weight" class="yhgl_input" maxlength="20" />克  
							至<input type="text" name="maxWeight"  validate="weight" class="yhgl_input" maxlength="20" />克  
						</p>
						<p>
							新增人： <input type="text" name="realName" class="yhgl_input"maxlength="20" />
						</p>
						<p>新增时间： 
							  	<input type="text" name="startTime" class="yhgl_input date" id="createTime1" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'createTime2\')}'})" />
								<span class="mr5">至</span>
								<input type="text" name="endTime" class="yhgl_input date" id="createTime2" onclick="WdatePicker({minDate: '#F{$dp.$D(\'createTime1\')}'})" />
	          			</p>
						<p class="lo_btn">
							<input type="button" onclick="search();" class="search" value="搜索" /> 
							<shiro:hasPermission name="YWGL_PTCRK_PTRK_DC">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportInbound.do');" />
						    </shiro:hasPermission>
						    <shiro:hasPermission name="YWGL_PTCRK_PTRK_XZRK">
						    <a style="margin-left: 10px;" onclick="popDiv('<%=basePath%>business/platFormWarehouse/addInboundBox.do')"
								href="javascript:void(0)" class="btn_cs">新增入库</a>
							</shiro:hasPermission>
						</p>
						<shiro:hasPermission name="YWGL_PTCRK_PTRK_CKMJMX">
						<p style="width: 310px;"><a href="javascript:void(0);" onclick="setMenu(4,1,5,'<%=basePath %>menu/busMenu.do','<%=basePath %>business/purcGoldBusi/purcGoldList.do');" target="mainFrame"class="yellow" style="margin-top:10px;  float: right;" >查看买金明细</a></p>
						</shiro:hasPermission>
					</div>
				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<!-- 全部 -->
				<div class=" all">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" 
						class="main_table tc">
						<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">入库克重(克)</td>
							<td align="center">单价(元/克)</td>
							<td align="center">金额(元)</td>
							<td align="center">入库类型</td>
							<td align="center">备注</td>
							<td align="center">新增人</td>
							<td align="center">新增时间</td>
						</tr>
						</thead>
						<tbody id="allTable"></tbody>
					</table>
				</div>
				<!-- 全部  END -->
					<!--分页-->
					<div id="pageTag"></div>
					</div>
					<!--分页  --END-->
			</div>
			</form>
		</div>
	</div>
<c:if test="${errMsg ne null}">
<script type="text/javascript">
  //错误提示
  dm.alert(decodeURIComponent('${errMsg}'));
</script>
</c:if>
</body>
<!-- 映射模板（列表） -->
<script id="allTemp" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= orderNo}}</td>
	    <td>{{= weight}}</td>
	    <td>{{= price}}</td>
        <td>{{= amount}}</td> 
		<td>{{= type}}</td> 
		<td>{{= remark}}</td>
		<td>{{= realName}}</td>
		<td>{{= handleTime}}</td>
       </tr>
	{{/each}}
</script>
<!-- 映射模板（统计） -->
<script id="totalTemp" type="text/x-jquery-tmpl">
      <tr>
        <td>总计</td> 
	    <td></td>
	    <td>{{= queryTotalWeight}}</td>
	    <td>{{= queryAvgPrice}}</td>
        <td>{{= queryTotalAmount}}</td> 
		<td></td> 
		<td></td>
		<td></td>
		<td></td>
       </tr>
</script>

<script type="text/javascript">
//增加校验模式
dmCheck.init("#searchBox");
//页面加载时调用
	$(function(){
	  search();//加载数据
	});
 //查询
	function search(){
		if(!dmCheck.check("#searchBox")){
			return false;
		}
		DMGold.ajax({"formId":"searchBox","serialize":true,"url":"inboundAjax.do","success":pageTagCallBack});
	}
	//分页跳转回调
	function pageTagCallBack(data){
		//清空表格数据
		$("#allTable").empty();
		//填充数据,根据具体的数据结构
		$('#allTemp').tmpl(data.pageResult).appendTo("#allTable");
		$('#totalTemp').tmpl(data.statResult).appendTo("#allTable");
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox",
			"curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			"pageCount":data.pageResult.pageTotal,"url":"inboundAjax.do",
			"toPageCallBack":pageTagCallBack});
		init(data);
	}
	//弹出框
	 function popDiv(url)
		    {
		     	$.tbox.popup(url);
		    }
	//初始化统计信息
	function init(data){
		DMGold.PageTag.initStat({"totalWeight":null,"todayWeight":null},data.statResult,'0.000');
		DMGold.PageTag.initStat({"totalCount":null,"todayCount":null},data.statResult,'0');
	}
</script>

</html>
				