<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
<title>金库总览</title>

<!-- 平台总部模板 -->
<script id="sysStockListTemplate" type="text/x-jquery-tmpl">
	{{each(index) list}}
		<tr {{if index %2 == 0}}class="grey" {{/if}}>
			<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
    		<td>{{= statDate}}</td> 
	    	<td>{{= beginGold}}</td>
	    	<td>{{= inWeight}}</td>
        	<td>{{= receiveWeight}}</td> 
	    	<td>{{= sendWeight}}</td>
	    	<td>{{= outWeight}}</td>
        	<td>{{= endGold}}</td> 
		</tr>
 	{{/each}}
</script>
<script id="ssListTotalTemplate" type="text/x-jquery-tmpl">
	<tr class="yellow">
		<td> </td>
	   	<td> </td> 
	    <td>合计：</td>
	    <td>
		{{if inWeightTotal!=null}}
			{{= inWeightTotal}}
		{{else}}
			0.000
		{{/if}}
		</td>
	    <td>
		{{if receiveWeightTotal!=null}}
			{{= receiveWeightTotal}}
		{{else}}
			0.000
		{{/if}}
		</td> 
	    <td>
		{{if sendWeightTotal!=null}}
			{{= sendWeightTotal}}
		{{else}}
			0.000
		{{/if}}
		</td>
	    <td>
		{{if outWeightTotal!=null}}
			{{= outWeightTotal}}
		{{else}}
			0.000
		{{/if}}
		</td>
	    <td> </td> 
	</tr>
</script>
<!-- 平台店铺模板 -->
<script id="shopStockListTemplate" type="text/x-jquery-tmpl">
	{{each(index) list}}
		<tr {{if index %2 == 0}}class="yellow" {{/if}}>
			<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
    		<td>{{= statDate}}</td> 
	    	<td>{{= beginGold}}</td>
	    	<td>{{= saveWeight}}</td>
        	<td>{{= getWeight}}</td> 
	    	<td>{{= takeWeight}}</td>
	    	<td>{{= sendWeight}}</td>
			<td>{{= checkWeight}}</td>
        	<td>{{= sysReceiveWeight}}</td> 
	    	<td>{{= shopReceiveWeight}}</td>
	    	<td>{{= adjustWeight}}</td>
        	<td>{{= endGold}}</td> 
		</tr>
 	{{/each}}
</script>
<script id="shopListTotalTemplate" type="text/x-jquery-tmpl">
	<tr class="yellow">
		<td> </td>
   		<td> </td> 
    	<td>合计：</td>
    	<td>
		{{if saveWeight!=null}}
			{{= saveWeight}}
		{{else}}
			0.000
		{{/if}}
		</td>
       	<td>
		{{if getWeight!=null}}
			{{= getWeight}}
		{{else}}
			0.000
		{{/if}}
		</td> 
    	<td>
		{{if takeWeight!=null}}
			{{= takeWeight}}
		{{else}}
			0.000
		{{/if}}
		</td>
    	<td>
		{{if sendWeight!=null}}
			{{= sendWeight}}
		{{else}}
			0.000
		{{/if}}
		</td>
		<td>
		{{if checkWeight!=null}}
			{{= checkWeight}}
		{{else}}
			0.000
		{{/if}}
		</td>
       	<td>
		{{if sysReceiveWeight!=null}}
			{{= sysReceiveWeight}}
		{{else}}
			0.000
		{{/if}}
		</td> 
    	<td>
		{{if shopReceiveWeight!=null}}
			{{= shopReceiveWeight}}
		{{else}}
			0.000
		{{/if}}
		</td>
    	<td>
		{{if adjustWeight!=null}}
			{{= adjustWeight}}
		{{else}}
			0.000
		{{/if}}
		</td>
       	<td> </td> 
	</tr>
</script>
<script type="text/javascript">
	//增加校验模式
	dmCheck.init("#sysStockForm");
	dmCheck.init("#shopStockForm");
	//页面加载时调用
	$(function(){
		findSysStockList();
		$("#shopStockTab").click(function(){
	 		$(this).addClass("hover");
	 		$("#sysStockTab").removeClass("hover"); 
	 		$("#sysStocktCont").css("display","none");
	 		$("#shopStocktCont").css("display","block");
	 		$("#sysStockForm").css("display","none");
	 		$("#shopStockForm").css("display","block");
	 		
	 		findShopStockListAjax();
	 	});
	 	$("#sysStockTab").click(function(){
	 		$(this).addClass("hover");
	 		$("#shopStockTab").removeClass("hover"); 
	 		$("#shopStocktCont").css("display","none");
	 		$("#sysStocktCont").css("display","block");
	 		$("#shopStockForm").css("display","none");
	 		$("#sysStockForm").css("display","block");
	 		findSysStockListAjax();
	 	});
	});
	var findSysStockList=function(){
		var data = ${data};
	    $('#sysStockListTemplate').tmpl(data.pageResult).appendTo("#sysStockGird");
	    $('#ssListTotalTemplate').tmpl(data.columnStatResult).appendTo("#sysStockTotalGird");
	    
	  //初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"sysStockForm","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"getSysStockListAjax.do","toPageCallBack":sysPageTagCallBack});
	}
	//平台总部分页跳转回调
 	function sysPageTagCallBack(data){
 		//清空表格数据
 		$("#sysStockGird").empty();
 		$("#sysStockTotalGird").empty();
 		//填充数据
 		$('#sysStockListTemplate').tmpl(data.pageResult).appendTo("#sysStockGird");
 		$('#ssListTotalTemplate').tmpl(data.columnStatResult).appendTo("#sysStockTotalGird");
 		setTotalData(data);
		//初始化分页标签
		 DMGold.PageTag.init({"divId":"pageTag","formId":"sysStockForm","curPage":data.pageResult.pageIndex,
								"totalCount":data.pageResult.recordCount,"pageCount":data.pageResult.pageTotal,
									"url":"getSysStockListAjax.do","toPageCallBack":sysPageTagCallBack}); 
 	}
 	//平台店铺分页跳转回调
 	function shopPageTagCallBack(data){
 		//清空表格数据
 		$("#shopStockGird").empty();
 		$("#shopStockTotalGird").empty();
 		//填充数据
 		$('#shopStockListTemplate').tmpl(data.pageResult).appendTo("#shopStockGird");
 		$('#shopListTotalTemplate').tmpl(data.columnStatResult).appendTo("#shopStockTotalGird");
 		setTotalData(data);
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"shopStockForm","curPage":data.pageResult.pageIndex,
								"totalCount":data.pageResult.recordCount,"pageCount":data.pageResult.pageTotal,
									"url":"getShopStockListAjax.do","toPageCallBack":shopPageTagCallBack});
 	}
	function findSysStockListAjax(){
		//添加验证
		if(!dmCheck.check("#sysStockForm")){
			return false;
		}
		$("#pageId").css("display","none");
		DMGold.ajax({"formId":"sysStockForm","serialize":true,
    		"url":"getSysStockListAjax.do","success":sysPageTagCallBack});
	}
	function findShopStockListAjax(){
		//添加验证
		if(!dmCheck.check("#shopStockForm")){
			return false;
		}
		$("#pageId").css("display","none");
		DMGold.ajax({"formId":"shopStockForm","serialize":true,
    		"url":"getShopStockListAjax.do","success":shopPageTagCallBack});
	}
	
	//更新统计数据
 	function setTotalData(data){
 		//$("#weightTotal").text(data.statResult == null ? '0' : data.statResult.weightTotal == null ? '0' : data.statResult.weightTotal);
 		$("#saveWeight").text(data.singleResult == null ? '0.000' : data.singleResult.saveWeight == null ? '0.000' : data.singleResult.saveWeight);
 		$("#takeWeight").text(data.singleResult == null ? '0.000' : data.singleResult.takeWeight == null ? '0.000' : data.singleResult.takeWeight);
 		$("#receiveWeight").text(data.singleResult == null ? '0.000' : data.singleResult.receiveWeight == null ? '0.000' : data.singleResult.receiveWeight);
 		$("#sendWeight").text(data.singleResult == null ? '0.000' : data.singleResult.sendWeight == null ? '0.000' : data.singleResult.sendWeight);
 		$("#inWeight").text(data.singleResult == null ? '0.000' : data.singleResult.inWeight == null ? '0.000' : data.singleResult.inWeight);
 		$("#outWeight").text(data.singleResult == null ? '0.000' : data.singleResult.outWeight == null ? '0.000' : data.singleResult.outWeight);
 		$("#saveWeightTotal").text(data.statResult == null ? '0.000' : data.statResult.saveWeight == null ? '0.000' : data.statResult.saveWeight);
 		$("#takeWeightTotal").text(data.statResult == null ? '0.000' : data.statResult.takeWeight == null ? '0.000' : data.statResult.takeWeight);
 		$("#receiveWeightTotal").text(data.statResult == null ? '0.000' : data.statResult.receiveWeight == null ? '0.000' : data.statResult.receiveWeight);
 		$("#sendWeightTotal").text(data.statResult == null ? '0.000' : data.statResult.sendWeight == null ? '0.000' : data.statResult.sendWeight);
 		$("#inWeightTotal").text(data.statResult == null ? '0.000' : data.statResult.inWeight == null ? '0.000' : data.statResult.inWeight);
 		$("#outWeightTotal").text(data.statResult == null ? '0.000' : data.statResult.outWeight == null ? '0.000' : data.statResult.outWeight);
 		//$("#systemEndGold").text(data.statResult == null ? '0.000' : data.statResult.systemEndGold == null ? '0.000' : data.statResult.systemEndGold);
 		//$("#shopEndGold").text(data.statResult == null ? '0.000' : data.statResult.shopEndGold == null ? '0.000' : data.statResult.shopEndGold);
 		$("#receiveAllWeight").text(data.statResult == null ? '0.000' : data.statResult.receiveAllWeight == null ? '0.000' : data.statResult.receiveAllWeight);
 	}
</script>

</head>
<body>
<c:if test="${param.errMsg ne null}">
	<script type="text/javascript">
  		dm.alert(decodeURIComponent(''));
	</script>
</c:if>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">金库总览</div>
			<div class="main_con clearfix">
			<div style="font-size: 20px;" >平台金库总量 &nbsp;&nbsp;&nbsp;&nbsp;  <span class="f24 yellow" id="weightTotal">
			<fmt:formatNumber  minFractionDigits="3"
								value= ""/>
			</span>克</div><br/><br/>
			
				<div class="user_con">
					<ul class="user_now clearfix">
						<li>
							<p class="yellow">
								<span class="f24" id="saveWeight">
								${data.singleResult == null ? '0.000' : data.singleResult.saveWeight == null ? '0.000' : data.singleResult.saveWeight}
								</span>克
							</p>
							<p>今日存入克重</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24" id="takeWeight">
								${data.singleResult == null ? '0.000' : data.singleResult.takeWeight == null ? '0.000' : data.singleResult.takeWeight}
								</span>克
							</p>
							<p>今日提取克重</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24" id="receiveWeight">
								${data.singleResult == null ? '0.000' : data.singleResult.receiveWeight == null ? '0.000' : data.singleResult.receiveWeight}
								</span>克
							</p>
							<p>今日平台已收货克重</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24" id="sendWeight">
								${data.singleResult == null ? '0.000' : data.singleResult.sendWeight == null ? '0.000' : data.singleResult.sendWeight}
								</span>克
							</p>
							<p>今日平台已发货克重</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24" id="inWeight">
								${data.singleResult == null ? '0.000' : data.singleResult.inWeight == null ? '0.000' : data.singleResult.inWeight}
								</span>克
							</p>
							<p>今日平台入库克重</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24" id="outWeight">
								${data.singleResult == null ? '0.000' : data.singleResult.outWeight == null ? '0.000' : data.singleResult.outWeight}
								</span>克
							</p>
							<p>今日平台出库克重</p>
						</li>
					</ul>
					<ul class="user_now clearfix">
						<li>
							<p class="yellow">
								<span class="f24" id="saveWeightTotal">
								${data.statResult == null ? '0.000' : data.statResult.saveWeight == null ? '0.000' : data.statResult.saveWeight}
								</span>克
							</p>
							<p>累计存入克重</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24" id="takeWeightTotal">
								${data.statResult == null ? '0.000' : data.statResult.takeWeight == null ? '0.000' : data.statResult.takeWeight}
								</span>克
							</p>
							<p>累计提取克重</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24" id="receiveWeightTotal">
								${data.statResult == null ? '0.000' : data.statResult.receiveWeight == null ? '0.000' : data.statResult.receiveWeight}
								</span>克
							</p>
							<p>累计平台已收货克重</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24" id="sendWeightTotal">
								${data.statResult == null ? '0.000' : data.statResult.sendWeight == null ? '0.000' : data.statResult.sendWeight}
								</span>克
							</p>
							<p>累计平台已发货克重</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24" id="inWeightTotal">
								${data.statResult == null ? '0.000' : data.statResult.inWeight == null ? '0.000' : data.statResult.inWeight}
								</span>克
							</p>
							<p>累计平台入库克重</p>
						</li>
						<li>
							<p class="yellow">
								<span class="f24" id="outWeightTotal">
								${data.statResult == null ? '0.000' : data.statResult.outWeight == null ? '0.000' : data.statResult.outWeight}
								</span>克
							</p>
							<p>累计平台出库克重</p>
						</li>
					</ul>
				</div>
				<br/>
				<div style="font-size: 20px;">
					<ul >
						<li style="text-align: inherit; float: left;">
							平台总部库存: &nbsp;&nbsp;&nbsp;&nbsp;
								<span class="f24 yellow" id="systemEndGold">
								<fmt:formatNumber  minFractionDigits="3"
								value= ""/>
								</span>克
						</li>
						<li style="text-align: inherit;float: left;">
							 &nbsp;&nbsp;&nbsp;&nbsp;平台店铺库存 :&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="f24 yellow" id="shopEndGold">
								<fmt:formatNumber minFractionDigits="3"
								value =""
								/>
								
								</span>克
						</li>
						<li style="text-align: inherit;float: left;">
							 &nbsp;&nbsp;&nbsp;&nbsp;物流中: &nbsp;&nbsp;&nbsp;&nbsp;
								<span class="f24 yellow" id="receiveAllWeight">
								${data.statResult == null ? '0.000' : data.statResult.receiveAllWeight == null ? '0.000' : data.statResult.receiveAllWeight}
								</span>克
						</li>
					</ul>
				</div>
			</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="<%=basePath%>treasury/getSysStockListAjax.do" method="post" id="sysStockForm">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							时间： <input type="text" name="startTime" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>
						<p>
							平台入库： <input type="text" name="startInWeight" class="yhgl_input" validate="weight" maxlength="20" /> 
							-<input type="text" name="endInWeight" class="yhgl_input" validate="weight" maxlength="20" />
						</p>
						<p>
							平台出库： <input type="text" name="startOutWeight" class="yhgl_input" validate="weight" maxlength="20" />
							-<input type="text" name="endOutWeight" class="yhgl_input" validate="weight" maxlength="20" />
						</p>
						<p>
							平台已收货： <input type="text" name="startReceiveWeight" class="yhgl_input" validate="weight" maxlength="20" /> 
							-<input type="text" name="endReceiveWeight" class="yhgl_input" validate="weight" maxlength="20" />
						</p>
						<p>
							平台已发货： <input type="text" name="startSendWeight" class="yhgl_input" validate="weight" maxlength="20" />
							-<input type="text" name="endSendWeight" class="yhgl_input" validate="weight" maxlength="20" />
						</p>
						<p class="lo_btn">
							<input type="button" onclick="findSysStockListAjax();" class="search" value="搜索" /> 
							<shiro:hasPermission name="JKGL_JKGL_JKZL_ZB_DC">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('sysStockForm','sysStockListExport.do')"/>
							</shiro:hasPermission>
							
						</p>
					</div>
				</div>
			</form>
			<form action="<%=basePath%>treasury/getShopStockListAjax.do" 
				method="post" id="shopStockForm" style="display: none">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							时间： <input type="text" name="startTime" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>
						<p>
							存入： <input type="text" name="startSaveWeight" class="yhgl_input" validate="weight" maxlength="20" />
							-<input type="text" name="endSaveWeight" class="yhgl_input" validate="weight" maxlength="20" />
						</p>
						<p>
							提取： <input type="text" name="startGetWeight" class="yhgl_input" validate="weight" maxlength="20" />
							-<input type="text" name="endGetWeight" class="yhgl_input" validate="weight" maxlength="20" />
						</p>
						<p>
							平台已收货： <input type="text" name="startTakeWeight" class="yhgl_input" validate="weight" maxlength="20" />
							-<input type="text" name="endTakeWeight" class="yhgl_input" validate="weight" maxlength="20" />
						</p>
						<p>
							平台已发货： <input type="text" name="startSendWeight" class="yhgl_input" validate="weight" maxlength="20" />
							-<input type="text" name="endSendWeight" class="yhgl_input" validate="weight" maxlength="20" />
						</p>
						<p class="lo_btn">
							<input type="button" class="search" onclick="findShopStockListAjax();" value="搜索" />
							<shiro:hasPermission name="JKGL_JKGL_JKZL_DP_DC">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('sysStockForm','shopStockListExport.do')"/>
							</shiro:hasPermission>
						</p>
					</div>
				</div>
			</form>
			<!--搜索表框  --END-->
			<div class="main_con">
				<div class="menubox clearfix">
					<ul>
						<li class="hover" id="sysStockTab"><a href="#">平台总部库存</a></li>
						<li id="shopStockTab"><a href="#">平台店铺库存</a></li>
					</ul>
				</div>
				<div class="menu_bd clearfix" id="sysStocktCont">
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc">
						<thead>
							<tr class="title">
								<td align="center">序号</td>
								<td align="center">时间</td>
								<td align="center">期初（克）</td>
								<td align="center">平台入库（克）</td>
								<td align="center">平台已收货（克）</td>
								<td align="center">平台已发货（克）</td>
								<td align="center">平台出库（克）</td>
								<td align="center">期末（克）</td>
							</tr>
						</thead>
						<tbody id="sysStockGird"></tbody>
						<tbody id="sysStockTotalGird"></tbody>
					</table>
				
				</div>
				<div class="menu_bd clearfix" style="display: none" id="shopStocktCont">
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc">
						<thead>
							<tr class="title">
								<td align="center">序号</td>
								<td align="center">时间</td>
								<td align="center">期初（克）</td>
								<td align="center">存入（克）</td>
								<td align="center">平台已收货（克）</td>
								<td align="center">提取（克）</td>
								<td align="center">平台已发货（克）</td>
								<td align="center">平台待检测（克）</td>
								<td align="center">平台待收物流中（克）</td>
								<td align="center">店铺待收物流中（克）</td>
								<td align="center">调整克重（克）</td>
								<td align="center">期末（克）</td>
							</tr>
						</thead>
						<tbody id="shopStockGird"></tbody>
						<tbody id="shopStockTotalGird"></tbody>
					</table>
				</div>
				<div id="pageTag">
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
							