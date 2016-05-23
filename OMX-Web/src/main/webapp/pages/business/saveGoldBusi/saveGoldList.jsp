<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>存金总表</title>
</head>
<body>
	<div>
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">存金总表</div>
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
						<p>用户名： 
						   <input type="text" name="allUserName" class="yhgl_input" maxlength="20" />
						</p>
						<p>姓名： 
						   <input type="text" name="allUserFullName" class="yhgl_input" maxlength="20" />
						</p>
						<p>角色：
				            <dim:select name="userType" enumType="UserType" headName="全部" headValue=""  cssClass="yhgl_sel"></dim:select>
				        </p>
				        <p>存金方式：
				            <dim:select name="logisticType" enumType="SaveGoldStatus" headName="全部" headValue=""  cssClass="yhgl_sel"></dim:select>
				        </p>
				         <p>状态：
				            <dim:select name="status" enumType="CommSaveGoldStatus" headName="全部" headValue="" exclude="delete" cssClass="yhgl_sel"></dim:select>
				        </p>
				        <p>提交时间：
						   <input type="text" name="startCreateTime" value="" class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
						   <span class="mr5">至</span> 
						   <input type="text" name="endCreateTime" value="" class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
						</p>
                        <p class="lo_btn">
						  <input type="button" id="searBtn" class="search" value="搜索" />
						  <shiro:hasPermission name="YWGL_CJYW_CJZB_DC">
						  <input name="input" type="button" class="export ml10"
 							value="导出" onclick="exportData('searchBox','saveGoldExpo.do');"/>
					      </shiro:hasPermission>
					    </p>
					</div>
				</div>
			</form>
			<!--搜索表框  --END-->
			<div class="main_con">
				<div class="">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" id="storeTable"
						class="main_table tc">
						<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">用户名</td>
							<td align="center">名称</td>
							<td align="center">角色</td>
							<td align="center">存金克重(克)</td>
							<td align="center">提交时间</td>
							<td align="center">存金方式</td>
							<td align="center">物流方</td>
							<td align="center">物流号</td>
							<td align="center">检测克重(克)</td>
							<td align="center">店测克重(克)</td>
							<td align="center">最后操作时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr></thead><tbody id="grid"></tbody>
					</table>
					<div class="mt10">
		          	<p class="fl">存金克重合计：<span class="yellow f24" id="totalBookWeight"></span>克</p>
		          	<p class="ml100 fl">检测克重合计：<span class="yellow f24" id="totalSysCheckWeight"></span>克</p>
		          	<p class="ml100 fl">店测克重合计：<span class="yellow f24" id="totalShopCheckWeight"></span>克</p>
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
<!-- 存金--全部  GridList数据 -->
<script id="allTemp" type="text/x-jquery-tmpl">
{{each(index) list}}
   <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= orderNo}}</td>
	    <td>
		{{= allUserName}}
		</td>
        <td>{{= allUserFullName}}</td> 
	    <td>{{= userTypeName}}</td>
	    <td>{{= bookWeight}}</td>
        <td>{{= createTime}}</td> 
		<td>{{= logisticType=='POST'?'物流发货':logisticTypeName}}</td>
		<td>{{= logisticCompany}}</td>
		<td>{{= logisticNo}}</td>
		<td>{{= sysCheckWeight}}</td>
		<td>{{= shopCheckWeight}}</td>
        <td>{{= updateTime}}</td>
        <td>{{= statusName}}</td>
		<td><a  href="<%=basePath %>business/saveGoldBusi/orderDetail.do?id={{= id}}&userType={{= userType}}&url=saveGoldList.do&orderType={{= orderType}}&t=<%=Math.random() %>" class="orange">订单详情</a></td>
       </tr>
{{/each}}
</script>
<script type="text/javascript">
  //页面加载时调用
  $(function(){
    document.getElementById("")
    //绑定查询时间
    $("#searBtn").click(function(){
 	  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"saveGoldAjax.do","success":searCallBack});
    });
    //初始化数据
    $("#searBtn").trigger('click');
  });
  //回调方法
  function searCallBack(data){
	//清空表格数据
	$("#grid").empty();
	//填充数据
	$('#allTemp').tmpl(data.pageResult).appendTo("#grid");
	//初始化分页标签
	DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
		          "pageCount":data.pageResult.pageTotal,"url":"saveGoldAjax.do","toPageCallBack":searCallBack});
	//加载统计数据
	initStat(data.statResult);
  }
  //弹出框
  function popDiv(url){
     $.tbox.popup(url);
  }
  //初始化统计数据
  function initStat(stat){
	  if(!stat){
		  //当前预约数
			 $("#bookSaveCount").empty();
			 $("#bookSaveCount").append('0');
			//存金克重合计
			 $("#totalBookWeight").empty();
			 $("#totalBookWeight").append('0.000');
			//检测克重合计
			 $("#totalSysCheckWeight").empty();
			 $("#totalSysCheckWeight").append('0.000');
			//店测克重合计
			 $("#totalShopCheckWeight").empty();
			 $("#totalShopCheckWeight").append('0.000');	  
	  }
	 //当前预约数
	 $("#bookSaveCount").empty();
	 $("#bookSaveCount").append(stat.bookSaveCount==null?'0':stat.bookSaveCount);
	//存金克重合计
	 $("#totalBookWeight").empty();
	 $("#totalBookWeight").append(stat.totalBookWeight==null?'0.000':stat.totalBookWeight);
	//检测克重合计
	 $("#totalSysCheckWeight").empty();
	 $("#totalSysCheckWeight").append((stat.totalSysCheckWeight==null||stat.totalSysCheckWeight==0)?'0.000':stat.totalSysCheckWeight);
	//店测克重合计
	 $("#totalShopCheckWeight").empty();
	 $("#totalShopCheckWeight").append((stat.totalShopCheckWeight==null||stat.totalShopCheckWeight==0)?'0.000':stat.totalShopCheckWeight);
  }
</script>
</html>
