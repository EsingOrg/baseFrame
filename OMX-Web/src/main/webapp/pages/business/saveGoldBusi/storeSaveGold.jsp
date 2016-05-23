<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>店铺存金</title>
</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">店铺存金</div>
			<div class="main_con clearfix">
          	<div class="user_con">
                <ul class="user_now clearfix">
                    <li>
                        <p class="yellow"><span class="f24" id="bookSaveCount">235.14</span>笔</p>
                        <p>当前预约数</p>
                    </li>
                </ul>
          	</div>
          </div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form id="searchBox">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>订单号：
						   <input type="text" name="orderNo" class="yhgl_input" maxlength="23" />
						</p>
						<p>店铺名：
						   <input type="text" name="shopName" class="yhgl_input" maxlength="20" />
						</p>
						<p>店铺名称：
						   <input type="text" name="shopFullName" class="yhgl_input" maxlength="20" />
						</p>
						<p>存金方式：
				            <dim:select name="logisticType" enumType="SaveGoldStatus" headName="全部" headValue="" cssClass="yhgl_sel"></dim:select>
				        </p>
				        <p>状态：
				           <dim:select name="status" enumType="ShopSaveGoldStatus" headName="全部" headValue=""  cssClass="yhgl_sel"></dim:select>
				        </p>
				        <p>提交时间：
						   <input type="text" name="startCreateTime" value="" class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
						   <span class="mr5">至</span> 
						   <input type="text" name="endCreateTime" value="" class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
						</p>
						<p class="lo_btn">
						  <input type="button" id="searBtn" class="search" value="搜索" />
						  <shiro:hasPermission name="YWGL_CJYW_DPCJ_DC">
						  <input name="input" type="button" class="export ml10"
 							value="导出" onclick="exportData('searchBox','storSaveGoldExpo.do');"/>
					      </shiro:hasPermission>
					    </p>
					</div>
				</div>
			</form>
			<!--搜索表框  --END-->
			<div class="main_con">
				<div class=" ">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
						<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">用户名</td>
							<td align="center">店铺名称</td>
							<td align="center">存金克重(克)</td>
							<td align="center">店铺操作人</td>
							<td align="center">提交时间</td>
							<td align="center">存金方式</td>
							<td align="center">预约时间</td>
							<td align="center">物流方</td>
							<td align="center">物流号</td>
							<td align="center">平台实收净重(克)</td>
							<td align="center">检测克重(克)</td>
							<td align="center">最后操作时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr>
						</thead><tbody id="grid"></tbody>
					</table>
				<div class="mt10">
	          	<p class="fl">存金克重合计：<span class="yellow f24" id="totalBookWeight"></span>克</p>
	          	<p class="ml100 fl">平台实收净重合计：<span class="yellow f24" id="totalSysNetWeight"></span>克</p>
	          	<p class="ml100 fl">检测克重合计：<span class="yellow f24" id="totalSysCheckWeight"></span>克</p>
		        </div> 
				<div  class="paging" id="pageTag"></div>
					</div>
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
<!-- 店铺存金--全部  GridList数据 -->
<script id="storeTemp" type="text/x-jquery-tmpl">
{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= orderNo}}</td>
	    <td>{{= shopName}}</td>
        <td>{{= shopFullName}}</td> 
	    <td>{{= bookWeight}}</td>
	    <td>{{= createBy}}</td>
        <td>{{= createTime}}</td> 
		<td>{{= logisticType=='POST'?'物流发货':logisticTypeName}}</td>
		<td>{{= bookTime}}</td>
		<td>{{= logisticCompany}}</td>
		<td>{{= logisticNo}}</td>
		<td>{{= sysNetWeight}}</td>
		<td>{{= sysCheckWeight}}</td>
		<td>{{= updateTime}}</td>
		<td>{{= statusName}}</td>
		<td><a  href="<%=basePath %>business/saveGoldBusi/orderDetail.do?id={{= id}}&userType=SHOP&url=storeSaveGold.do&orderType={{= orderType}}&t=<%=Math.random() %>" class="orange">订单详情</a></td>
     </tr>
{{/each}}
</script>
<script type="text/javascript">
   //页面加载时调用
   $(function(){
      document.getElementById("")
      //绑定查询时间
      $("#searBtn").click(function(){
    	  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"storSaveGoldAjax.do","success":searCallBack});
      });
      $("#searBtn").trigger('click');
   });
   //回调方法
   function searCallBack(data){
	//清空表格数据
	$("#grid").empty();
	//填充数据
	 $('#storeTemp').tmpl(data.pageResult).appendTo("#grid");
	//初始化分页标签
	DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
		          "pageCount":data.pageResult.pageTotal,"url":"storSaveGoldAjax.do","toPageCallBack":searCallBack});
	//加载统计数据
	initStat(data.statResult);
   }
   //初始化统计数据
   function initStat(stat){
	   if(!stat){
		     $("#bookSaveCount").empty();
   		     $("#bookSaveCount").append('0');
		     $("#totalBookWeight").empty();
			 $("#totalBookWeight").append('0.000');
			//平台实收净重合计
		 	 $("#totalSysNetWeight").empty();
			 $("#totalSysNetWeight").append('0.000');
			//检测克重合计
		 	 $("#totalSysCheckWeight").empty();
			 $("#totalSysCheckWeight").append('0.000');
	   }
	   $("#bookSaveCount").empty();
  	   $("#bookSaveCount").append(stat.bookSaveCount==null?0:stat.bookSaveCount);
	 //存金克重合计
 	 $("#totalBookWeight").empty();
	 $("#totalBookWeight").append(stat.totalBookWeight==null?'0.000':stat.totalBookWeight);
	//平台实收净重合计
 	 $("#totalSysNetWeight").empty();
	 $("#totalSysNetWeight").append(stat.totalSysNetWeight==null?'0.000':stat.totalSysNetWeight);
	//检测克重合计
 	 $("#totalSysCheckWeight").empty();
	 $("#totalSysCheckWeight").append((stat.totalSysCheckWeight==null||stat.totalSysCheckWeight==0)?'0.000':stat.totalSysCheckWeight);
   }
 //弹出框
   function popDiv(url){
	   $.tbox.popup(url);
   }
</script>

</html>
