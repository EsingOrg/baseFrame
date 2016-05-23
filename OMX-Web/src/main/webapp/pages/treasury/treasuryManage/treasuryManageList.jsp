<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>业务总览</title>
</head>
<body>
	<di>
	<div class="r_main clearfix ">
		<!--文本框 -->
		<div class="main_title">业务总览</div>
		<div class="main_con clearfix">
			<div style="font-size: 20px;">
				业务库存 &nbsp;&nbsp;&nbsp;&nbsp; <span class="f24 yellow" id="allWeight">${data.statResult == null ? '0.000' : data.statResult.allWeight == null ? '0.000' : data.statResult.allWeight}</span>克
			</div>
			<br />
			<br />
			<div class="user_con">
				<ul class="user_now clearfix">
					<li>
						<p class="yellow">
							<span class="f24" id="totalBuyWeight">
							${data.singleResult == null ? '0.000' : data.singleResult.totalBuyWeight == null ? '0.000' : data.singleResult.totalBuyWeight}
							</span>克
						</p>
						<p>今日买入克重</p>
					</li>
					<li>
						<p class="yellow">
							<span class="f24" id="totalSaleWeight">
							${data.singleResult == null ? '0.000' : data.singleResult.totalSaleWeight == null ? '0.000' : data.singleResult.totalSaleWeight}
							</span>克
						</p>
						<p>今日卖出克重</p>
					</li>
					<li>
						<p class="yellow">
							<span class="f24" id="totalSaveWeight">
							${data.singleResult == null ? '0.000' : data.singleResult.totalSaveWeight == null ? '0.000' : data.singleResult.totalSaveWeight}
							</span>克
						</p>
						<p>今日存入克重</p>
					</li>
					<li>
						<p class="yellow">
							<span class="f24" id="totalTakeWeight">
							${data.singleResult == null ? '0.000' : data.singleResult.totalTakeWeight == null ? '0.000' : data.singleResult.totalTakeWeight}
							</span>克
						</p>
						<p>今日提取克重</p>
					</li>
					<li>
						<p class="yellow">
							<span class="f24" id="personalChangeWeight">
							${data.singleResult == null ? '0.000' : data.singleResult.personalChangeWeight == null ? '0.000' : data.singleResult.personalChangeWeight}
							</span>克
						</p>
						<p>今日换金克重</p>
					</li>
				</ul>
				<ul class="user_now clearfix">
					<li>
						<p class="yellow">
							<span class="f24" id="allTotalBuyWeight">
							${data.statResult == null ? '0.000' : data.statResult.allTotalBuyWeight == null ? '0.000' : data.statResult.allTotalBuyWeight}
							</span>克
						</p>
						<p>累计买入克重</p>
					</li>
					<li>
						<p class="yellow">
							<span class="f24" id="allTotalSaleWeight">
							${data.statResult == null ? '0.000' : data.statResult.allTotalSaleWeight == null ? '0.000' : data.statResult.allTotalSaleWeight}
							</span>克
						</p>
						<p>累计卖出克重</p>
					</li>
					<li>
						<p class="yellow">
							<span class="f24" id="allTotalSaveWeight">
							${data.statResult == null ? '0.000' : data.statResult.allTotalSaveWeight == null ? '0.000' : data.statResult.allTotalSaveWeight}
							</span>克
						</p>
						<p>累计存入克重</p>
					</li>
					<li>
						<p class="yellow">
							<span class="f24" id="allTotalTakeWeight">
							${data.statResult == null ? '0.000' : data.statResult.allTotalTakeWeight == null ? '0.000' : data.statResult.allTotalTakeWeight}
							</span>克
						</p>
						<p>累计提取克重</p>
					</li>
					<li>
						<p class="yellow">
							<span class="f24" id="allTotalTakeWeight">
							${data.statResult == null ? '0.000' : data.statResult.allChangWeight == null ? '0.000' : data.statResult.allChangWeight}
							</span>克
						</p>
						<p>累计换金克重</p>
					</li>
				</ul>
			</div>
		</div>
		<!-- 导出 -->
		<form action="#" method="post" id="dataForm">
		<div class="main_con">
			<div class="admin_input clearfix">
				<p>
					<shiro:hasPermission name="JKGL_JKGL_YWZL_JR_DC">
					<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','tmTodayListExport.do');"/>
					</shiro:hasPermission>
				</p>
			</div>
		</div>
 		</form>
		<!--文本框 --END-->
		<!-- 搜索框 -->
		<form action="<%=basePath%>treasury/getTMAllListAjax.do" method="post"
			id="searchBox" style="display: none;">
			<div class="main_con clearfix">
				<div class="admin_input fl">
					
					<p>
						时间： <input type="text" name="startTime"
							class="yhgl_input date" class="Wdate" id="startDate"
							onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
						<span class="mr5">至</span> <input type="text" name="endTime"
						 class="yhgl_input date" class="Wdate"id="endDate"
							onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
					</p>
					
					<p>
						合计买入： <input type="text" name="startBuyWeightTotal"
							class="yhgl_input"  validate="weight"
							maxlength="20" />-<input type="text" name="endBuyWeightTotal"
							class="yhgl_input" validate="weight"
							maxlength="20" />
					</p>
					
					<p>
						合计卖出： <input type="text" name="startSaleWeightTotal"
							class="yhgl_input" validate="weight"
							maxlength="20" />-<input type="text"
							name="endSaleWeightTotal" class="yhgl_input" validate="weight"
							maxlength="20" />
					</p>
					
					<p>
						合计存入： <input type="text" name="startSaveWeightTotal"
							class="yhgl_input" validate="weight"
							maxlength="20" />-<input type="text"
							name="endSaveWeightTotal" class="yhgl_input" validate="weight"
							 maxlength="20" />
					</p>
					
					<p>
						合计提取： <input type="text" name="startTakeWeightTotal"
							class="yhgl_input" validate="weight"
							maxlength="20" />-<input type="text"
							name="endTakeWeightTotal" class="yhgl_input" validate="weight"
							maxlength="20" />
					</p>
					
					<p class="lo_btn">
						<input type="button" onclick="findAllData();" class="search" value="搜索" /> 
						<shiro:hasPermission name="JKGL_JKGL_YWZL_LS_DC">
						<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('searchBox','oldTodayListExport.do')"/>
						</shiro:hasPermission>
					</p>
					
				</div>
			</div>
		</form>
		<!--搜索表框  --END-->
		<div class="main_con">
			<div class="menubox clearfix">
				<ul>
					<li class="hover" id="todayBusiness"><a href="#">今日业务</a></li>
					<li id="historyBusiness"><a href="#">历史业务</a></li>
				</ul>
			</div>
			<div class="menu_bd clearfix" id="todaytCont">
				<table width="100%" border="0" cellspacing="0" cellpadding="3"
					class="main_table tc">
					<thead>
						<tr class="title">
							<td align="center">期初（克）</td>
							<td align="center">个人买入（克）</td>
							<td align="center">店铺买入（克）</td>
							<td align="center">合计买入（克）</td>
							<td align="center">个人卖出（克）</td>
							<td align="center">店铺卖出（克）</td>
							<td align="center">合计卖出（克）</td>
							<td align="center">个人存入（克）</td>
							<td align="center">店铺存入（克）</td>
							<td align="center">合计存入（克）</td>
							<td align="center">个人提取（克）</td>
							<td align="center">店铺提取（克）</td>
							<td align="center">合计提取（克）</td>
							<td align="center">个人换金（克）</td>
							<td align="center">期末（克）</td>
						</tr>
					</thead>
					<tbody id="todayGrid"></tbody>
				</table>
			</div>

			<div class="menu_bd clearfix" style="display: none" id="histCont">
				<table width="100%" border="0" cellspacing="0" cellpadding="3"
					class="main_table tc">
					<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">时间</td>
							<td align="center">期初（克）</td>
							<td align="center">个人买入（克）</td>
							<td align="center">店铺买入（克）</td>
							<td align="center">合计买入（克）</td>
							<td align="center">个人卖出（克）</td>
							<td align="center">店铺卖出（克）</td>
							<td align="center">合计卖出（克）</td>
							<td align="center">个人存入（克）</td>
							<td align="center">店铺存入（克）</td>
							<td align="center">合计存入（克）</td>
							<td align="center">个人提取（克）</td>
							<td align="center">店铺提取（克）</td>
							<td align="center">合计提取（克）</td>
							<td align="center">个人换金（克）</td>
							<td align="center">期末（克）</td>
						</tr>
					</thead>
					<tbody id="allGird"></tbody>
				</table>
				<div id="pageTag"></div>
			</div>
		</div>

	</div>
	</div>
</body>
<!-- 今日业务查询 -->
<script id="todayData" type="text/x-jquery-tmpl">
{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
        <td>{{= beginGold}}</td> 
	    <td>{{= personalBuyWeight}}</td>
	    <td>{{= shopBuyWeight}}</td>
        <td>{{= totalBuyWeight}}</td> 
	    <td>{{= personalSaleWeight}}</td>
	    <td>{{= shopSaleWeight}}</td>
        <td>{{= totalSaleWeight}}</td> 
		<td>{{= personalSaveWeight}}</td>
		<td>{{= shopSaveWeight}}</td>
		<td>{{= totalSaveWeight}}</td>
		<td>{{= personalTakeWeight}}</td>
		<td>{{= shopTakeWeight}}</td>
		<td>{{= totalTakeWeight}}</td>
		<td>{{= personalChangeWeight}}</td>
		<td>{{= endGold}}</td>
       </tr>
 {{/each}}
</script>
<script id="allData" type="text/x-jquery-tmpl">
	{{each(index) list}}
		<tr {{if index %2 == 0}}class="grey" {{/if}}>
			<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
			<td>{{= statDate}}</td>
			<td>{{= beginGold}}</td> 
			<td>{{= personalBuyWeight}}</td>
			<td>{{= shopBuyWeight}}</td>
			<td>{{= totalBuyWeight}}</td> 
			<td>{{= personalSaleWeight}}</td>
			<td>{{= shopSaleWeight}}</td>
			<td>{{= totalSaleWeight}}</td> 
			<td>{{= personalSaveWeight}}</td>
			<td>{{= shopSaveWeight}}</td>
			<td>{{= totalSaveWeight}}</td>
			<td>{{= personalTakeWeight}}</td>
			<td>{{= shopTakeWeight}}</td>
			<td>{{= totalTakeWeight}}</td>
			<td>{{= personalChangeWeight}}</td>
			<td>{{= endGold}}</td>
		</tr>
	{{/each}}
		
</script>
<script id="totalData" type="text/x-jquery-tmpl">
	<tr class="yellow">
			<td> </td>
			<td> </td>
			<td>合计：</td> 
			<td>{{= personalBuyWeight}}</td>
			<td>{{= shopBuyWeight}}</td>
			<td>{{= totalBuyWeight}}</td> 
			<td>{{= personalSaleWeight}}</td>
			<td>{{= shopSaleWeight}}</td>
			<td>{{= totalSaleWeight}}</td> 
			<td>{{= personalSaveWeight}}</td>
			<td>{{= shopSaveWeight}}</td>
			<td>{{= totalSaveWeight}}</td>
			<td>{{= personalTakeWeight}}</td>
			<td>{{= shopTakeWeight}}</td>
			<td>{{= totalTakeWeight}}</td>
			<td>{{= personalChangeWeight}}</td>
			<td> </td>
		</tr>
</script>
<script type="text/javascript">
  //增加校验模式
  dmCheck.init("#searchBox");
  //页面加载时调用
  $(function(){
 	 findNowBusinessSummary();//jquery 模板demo
 	 $("#historyBusiness").click(function(){
 		  $(this).addClass("hover");
 		  $("#todayBusiness").removeClass("hover"); 
 		  $("#todaytCont").css("display","none");
 		  $("#histCont").css("display","block");
 		  $("#searchBox").css("display","block");
 		  $("#todayExport").css("display","none");
 		 $("#dataForm").css("display","none");
 		 findAllData();
 	  });
 	  $("#todayBusiness").click(function(){
 		 $(this).addClass("hover");
 		 $("#historyBusiness").removeClass("hover");
 		 $("#histCont").css("display","none");
 		 $("#todaytCont").css("display","block");
 		 $("#searchBox").css("display","none");
 		 $("#todayExport").css("display","block");
 		$("#dataForm").css("display","block");
 		 findTotayData();
 	  });
     });
     var findNowBusinessSummary = function(){
	    //造的测试数据，实际应用时，将ajax返回的json数据替换这里的data即可
	    var data = ${data};
	 	//清空模板类容
	    $('#todayData').tmpl(data.pageResult).appendTo("#todayGrid");
	  	//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"getTMAllListAjax.do","toPageCallBack":allPageTagCallBack});
    }
    function findAllData(){
  		if(!dmCheck.check("#searchBox")){
			return false;
		} 
  		DMGold.ajax({"formId":"searchBox","serialize":true,
    		"url":"getTMAllListAjax.do","success":allPageTagCallBack});
    	
    }
    function findTotayData(){
    	if(!dmCheck.check("#searchBox")){
			return false;
		}
    	DMGold.ajax({"formId":"searchBox","serialize":true,
    		"url":"getTMTodayListAjax.do","success":todayPageTagCallBack});
    }
  	//所有数据分页跳转回调
 	function allPageTagCallBack(data){
 		//清空表格数据
 		$("#allGird").empty();
 		//填充数据
 		$('#allData').tmpl(data.pageResult).appendTo("#allGird");
 		//填充合计数据
 		$('#totalData').tmpl(data.columnStatResult).appendTo("#allGird");
 		setTotalData(data);
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"getTMAllListAjax.do","toPageCallBack":allPageTagCallBack});
 	}
 	//今日数据分页跳转回调
 	function todayPageTagCallBack(data){
 		//清空表格数据
 		$("#todayGrid").empty();
 		//填充数据
 		$('#todayData').tmpl(data.pageResult).appendTo("#todayGrid");
 		setTotalData(data);
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"getTMAllListAjax.do","toPageCallBack":todayPageTagCallBack});
 	}
 	
 	//更新统计数据
 	function setTotalData(data){
 		$("#allWeight").text(data.statResult == null ? '0' : data.statResult.allWeight == null ? '0' : data.statResult.allWeight);//业务库存
 		$("#totalBuyWeight").text(data.singleResult == null ? '0.000' : data.singleResult.totalBuyWeight == null ? '0.000' : data.singleResult.totalBuyWeight);//今日买金克重
 		$("#totalSaleWeight").text(data.singleResult == null ? '0.000' : data.singleResult.totalSaleWeight == null ? '0.000' : data.singleResult.totalSaleWeight);//今日卖金克重
 		$("#totalSaveWeight").text(data.singleResult == null ? '0.000' : data.singleResult.totalSaveWeight == null ? '0.000' : data.singleResult.totalSaveWeight);//今日存金克重
 		$("#totalTakeWeight").text(data.singleResult == null ? '0.000' : data.singleResult.totalTakeWeight == null ? '0.000' : data.singleResult.totalTakeWeight);//今日提金克重
 		$("#personalTakeWeight").text(data.singleResult == null ? '0.000' : data.singleResult.personalTakeWeight == null ? '0.000' : data.singleResult.personalTakeWeight);//今日换金克重
 		
 		$("#allTotalBuyWeight").text(data.statResult == null ? '0.000' : data.statResult.allTotalBuyWeight == null ? '0.000' : data.statResult.allTotalBuyWeight);//累计买金克重
 		$("#allTotalSaleWeight").text(data.statResult == null ? '0.000' : data.statResult.allTotalSaleWeight == null ? '0.000' : data.statResult.allTotalSaleWeight);//累计卖金克重
 		$("#allTotalSaveWeight").text(data.statResult == null ? '0.000' : data.statResult.allTotalSaveWeight == null ? '0.000' : data.statResult.allTotalSaveWeight);//累计存金克重
 		$("#allTotalTakeWeight").text(data.statResult == null ? '0.000' : data.statResult.allTotalTakeWeight == null ? '0.000' : data.statResult.allTotalTakeWeight);//累计提金克重
 		$("#allChangWeight").text(data.statResult == null ? '0.000' : data.statResult.allChangWeight == null ? '0.000' : data.statResult.allChangWeight);//累计换金克重
 		
 	}
   </script>
</html>
