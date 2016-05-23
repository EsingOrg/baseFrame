<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>平台待检测</title>
</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">平台待检测</div>
			<div class="main_con clearfix">
			<div class="user_con">
                <ul class="user_now clearfix">
                    <li>
                        <p class="yellow"><span class="f24" id="perSaveTotal"></span>个</p>
                        <p>个人到店铺存金</p>
                    </li>
                    <li>
                        <p class="yellow"><span class="f24" id=storeSaveTotal></span>个</p>
                        <p>店铺存金</p>
                    </li>
                </ul>
          	</div>
          	</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form id="searchBox">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>店铺名： 
						  <input type="text" name="shopName" class="yhgl_input" maxlength="20" />
						</p>
						<p>店铺名称： 
						  <input type="text" name="shopFullName" class="yhgl_input" maxlength="20" />
						</p>
						<p>发货方式：
					      <dim:select name="logisticType" enumType="SaveGoldStatus" headName="全部" headValue="" exclude="delete" cssClass="yhgl_sel"></dim:select>
					    </p>
						<p>物流方： 
						  <select name="logisticCompany" class="yhgl_sel">
			                 <option value="">全部</option>
			                 <c:forEach items="${logsReq}" var="item">
			                 <option value="${item }">${item }</option>
			                 </c:forEach>
			                 </select>
						</p>
						<p>物流号： 
						  <input type="text" name="logisticNo" class="yhgl_input" maxlength="20" />
						</p>
						<p>预约时间：
						   <input type="text" name="startBookTime"  class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
						   <span class="mr5">至</span> 
						   <input type="text" name="endBookTime"  class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
					 	</p>
						<p class="lo_btn">
							<input type="button" class="search" id="searchBnt" value="查询" />
							<shiro:hasPermission name="YWGL_WLGL_PTDJC_GR_DC"><div class="personSave"> 
							<input type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportPresonlSaveCheckPage.do')"/>
							</div></shiro:hasPermission>
							<shiro:hasPermission name="YWGL_WLGL_PTDJC_DP_DC"><div class="storeSave"> 
							<input type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportShopSaveCheckPage.do')"/>
							</div></shiro:hasPermission>
						</p>
					</div>
				</div>
			</form>
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="menubox clearfix">
					<ul>
						<li id="personSave"><a href="#">个人存金</a></li>
						<li id="storeSave" ><a href="#">店铺存金</a></li>
					</ul>
				</div>
				<!-- 个人到店铺存金 -->
				<div class="personSave">
				<div class=" personSave">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
						<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">用户名</td>
							<td align="center">店铺名称</td>
							<td align="center">发货方式</td>
							<td align="center">物流方</td>
							<td align="center">物流号</td>
							<td align="center">预约时间</td>
							<td align="center">订单克重(克)</td>
							<td align="center">实发净重(克)</td>
							<td align="center">毛重(克)</td>
							<td align="center">包数(包)</td>
							<td align="center">发货人</td>
							<td align="center">平台实收净重(克)</td>
							<td align="center">收货人</td>
							<td align="center">发货时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr>
						</thead><tbody id="personSaveGrid"></tbody>
					</table>
				</div>
				</div>
				<!-- 个人存金  END -->
                <!-- 店铺存金 -->
                <div style="display:none" class="storeSave">
				 <div class=" " 	id="histCont">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
						<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">用户名</td>
							<td align="center">店铺名称</td>
							<td align="center">发货方式</td>
							<td align="center">物流方</td>
							<td align="center">物流号</td>
							<td align="center">预约时间</td>
							<td align="center">订金克重(克)</td>
							<td align="center">毛重(克)</td>
							<td align="center">包数(包)</td>
							<td align="center">发货人</td>
						    <td align="center">平台实收净重(克)</td>
						    <td align="center">收货人</td>
							<td align="center">收货时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr>
						</thead><tbody id="storeSaveGrid"></tbody>
					</table>
				 </div>
				</div>
				<!-- 店铺存金 --END -->
				<div class="mt10">
		          	<p class="fl">订单克重：<span class="yellow f24" id="totalOrderWeight"></span>克</p>
		          	<p class="ml100 fl"> 平台实收净重：<span class="yellow f24" id="totalSysNetWeight"></span>克</p>
		          	<p class="ml100 fl">毛重：<span class="yellow f24" id="totalGrossWeight"></span>克</p>
		          	<p class="ml100 fl">包数：<span class="yellow f24" id="totalPackageCount"></span>包</p>
		        </div> 
				<div  class="paging" id="pageTag"></div>
				 <!--分页  --END-->
			</div>
		</div>
	</div>
</body>
<c:if test="${errMsg ne null}">
<script type="text/javascript">
  //错误提示
  dm.alert(decodeURIComponent('${errMsg}'));
</script>
</c:if>
<!-- 平台待检测--个人存金  GridList数据 -->
<script id="personSaveTemp" type="text/x-jquery-tmpl">
     {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
        <td>{{= shopName}}</td> 
	    <td>{{= shopFullName}}</td>
	    <td>{{= logisticType=='POST'?'物流发货':logisticTypeName}}</td>
        <td>{{= logisticCompany}}</td> 
	    <td>{{= logisticNo}}</td>
	    <td>{{= bookTime}}</td>
        <td>{{= orderWeight}}</td> 
		<td>{{= netWeight}}</td>
        <td>{{= grossWeight}}</td> 
		<td>{{= packageCount}}</td>
		<td>{{= sendBy}}</td>
		<td>{{= sysNetWeight}}</td>
		<td>{{= receiveBy}}</td>
		<td>{{= receiveTime}}</td>
		<td>{{= statusName}}</td>
		<td>
		<shiro:hasPermission name="YWGL_WLGL_PTDJC_GR_JC">
		<a  href="<%=basePath %>business/logisticsMgt/wcpersonCheck.do?logisticId={{= logisticId}}&t=<%=Math.random() %>" class="orange">检测</a>
		</shiro:hasPermission>
        </td>
       </tr>
	{{/each}}
</script>
<!-- 平台待检测--店铺存金  GridList数据 -->
<script id="storeSaveTemp" type="text/x-jquery-tmpl">
      {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
        <td>{{= orderNo}}</td> 
	    <td>{{= shopName}}</td>
	    <td>{{= shopFullName}}</td>
        <td>{{= logisticType=='POST'?'物流发货':logisticTypeName}}</td>
	    <td>{{= logisticCompany}}</td>
        <td>{{= logisticNo}}</td>
	    <td>{{= bookTime}}</td>
        <td>{{= orderWeight}}</td> 
		<td>{{= grossWeight}}</td>
		<td>{{= packageCount}}</td>
		<td>{{= sendBy}}</td>
		<td>{{= sysNetWeight}}</td>
		<td>{{= receiveBy}}</td>
		<td>{{= receiveTime}}</td>
		<td>{{= statusName}}</td>
 		{{if status =='SYS_CHECK'}}
		<td>
			<shiro:hasPermission name="YWGL_WLGL_PTDJC_DP_JC">
			<a  href="<%=basePath %>business/logisticsMgt/wcshopCheck.do?id={{= orderId}}&logisticId={{= logisticId}}&t=<%=Math.random() %>" class="orange">检测</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YWGL_WLGL_PTDJC_DP_ZF">
			<a  href="javascript:disable({{= orderId}})" class="changeStatus orange">作废</a>
			</shiro:hasPermission>
		</td>
        {{/if}}
		{{if status =='SYS_CANCEL'}}
		<td>
			<a  href="<%=basePath %>business/logisticsMgt/shopSaveDetail.do?id={{= orderId}}&url=waitCheck.do&tabIndex=storeSave&t=<%=Math.random() %>" class="orange">订单详情</a>
		</td>
        {{/if}}
       </tr>
	{{/each}}	
</script>
<script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  //为'个人存金'选项卡添加单击事件，显示平台待收货-全部信息
    	  $("#personSave").click(function(){
    		  $(this).addClass("hover");
    		  $("#storeSave").removeClass("hover");
    		  $(".storeSave").css("display","none");
    		  $(".personSave").css("display","block");
    		  //取绑'查询按钮'单击事件
    		  $("#searchBnt").unbind('click');
    		  //绑定'查询按钮'单击事件
    		  $("#searchBnt").click(function(){
    			  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"wcPersonSaveAjax.do","success":initPersonSave});
    		  });
    		  $("#searchBnt").trigger('click');
    	  });
    	//为'店铺存金'选项卡添加单击事件，显示平台待收货-预约中信息
    	  $("#storeSave").click(function(){
    		  $(this).addClass("hover");
    		  $("#personSave").removeClass("hover");
    		  $(".personSave").css("display","none");
    		  $(".storeSave").css("display","block");
    		//取绑'查询按钮'单击事件
    		  $("#searchBnt").unbind('click');
    		  //绑定'查询按钮'单击事件
    		  $("#searchBnt").click(function(){
    			  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"wcShopSaveAjax.do","success":initStoreSave});
    		  });
    		  $("#searchBnt").trigger('click');
    	  });
    	//默认加载‘个人存金’数据
      	  $("#${tabIndex}").trigger('click');
      	initStat();
        });
      //初始化--个人存金
     	function initPersonSave(data){
     		//清空表格数据
     		$("#personSaveGrid").empty();
     		//清空统计字段
     		$('#totalOrderWeight').empty();
     		$('#totalSysNetWeight').empty();
     		$('#totalGrossWeight').empty();
     		$('#totalPackageCount').empty();
     		if(data.statDate.singleResult != null ){
     			$('#totalOrderWeight').append(data.statDate.singleResult.totalWeight);
     			$('#totalSysNetWeight').append(data.statDate.singleResult.totalSysNetWeight);
     			$('#totalGrossWeight').append(data.statDate.singleResult.totalGrossWeight);
     			$('#totalPackageCount').append(data.statDate.singleResult.totalPackageCount);
     		}else{
     			$('#totalOrderWeight').append("0.000");
     			$('#totalSysNetWeight').append("0.000");
     			$('#totalGrossWeight').append("0.000");
     			$('#totalPackageCount').append("0");
     		}
     		//填充数据
    		 $('#personSaveTemp').tmpl(data.listDate.pageResult).appendTo("#personSaveGrid");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.listDate.pageResult.pageIndex,"totalCount":data.listDate.pageResult.recordCount,
    			          "pageCount":data.listDate.pageResult.pageTotal,"url":"wcPersonSaveAjax.do","toPageCallBack":initPersonSave});
     	}
     	//初始化--店铺存金
     	function initStoreSave(data){
     		//清空表格数据
     		$("#storeSaveGrid").empty();
     		//清空统计字段
     		$('#totalOrderWeight').empty();
     		$('#totalSysNetWeight').empty();
     		$('#totalGrossWeight').empty();
     		$('#totalPackageCount').empty();
     		if(data.statDate.singleResult != null ){
     			$('#totalOrderWeight').append(data.statDate.singleResult.totalWeight);
     			$('#totalSysNetWeight').append(data.statDate.singleResult.totalSysNetWeight);
     			$('#totalGrossWeight').append(data.statDate.singleResult.totalGrossWeight);
     			$('#totalPackageCount').append(data.statDate.singleResult.totalPackageCount);
     		}else{
     			$('#totalOrderWeight').append("0.000");
     			$('#totalSysNetWeight').append("0.000");
     			$('#totalGrossWeight').append("0.000");
     			$('#totalPackageCount').append("0");
     		}
     		//填充列表数据
    		 $('#storeSaveTemp').tmpl(data.listDate.pageResult).appendTo("#storeSaveGrid");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.listDate.pageResult.pageIndex,"totalCount":data.listDate.pageResult.recordCount,
    			          "pageCount":data.listDate.pageResult.pageTotal,"url":"wcShopSaveAjax.do","toPageCallBack":initStoreSave});
     	}
        function disable(id){
   		dm.confirm("是否确认作废该订单？",{
				title:"确认",				//标题
				okName:"确定",			//如同confirm确定按钮的value
				cancleName:"取消",		//如同confirm取消按钮的value
				callback:function(){	//按确定的执行的函数
					location.href = "shopCheckCanle.do?id="+id;
				}
			});
        }
      //弹出框
        function popDiv(url){
     	   $.tbox.popup(url);
        }
      //初始化统计数据
     	function initStat(){
     		 DMGold.ajax({"formId":"searchBox","serialize":true,"url":"sysCheckCountAjax.do","success":function(data){
   	  	  	    $("#perSaveTotal").append(data.singleResult.personalSaveCount);
   	  	  	    $("#storeSaveTotal").append(data.singleResult.shopSaveCount);
     		 }});
     	}
    </script>

</html>
