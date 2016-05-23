<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>个人存金</title>
</head>
<body>
	<div>
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">个人存金</div>
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
					<p>
						订单号： <input type="text" name="orderNo" class="yhgl_input"
							 maxlength="23" />
					</p>
					<p>
						用户名： <input type="text" name="userName" class="yhgl_input"
							 maxlength="20" />
					</p>
					<p>
						手机号码： <input type="text" name="userPhone" class="yhgl_input"
							 maxlength="20" />
					</p>
					<p>
							店铺名： <input type="text" name="shopName" class="yhgl_input"
								 maxlength="20" />
						</p>
						<p>
							店铺名称： <input type="text" name="shopFullName" class="yhgl_input"
								 maxlength="20" />
						</p>
						<div class="all">
						<p>
				                                        状态：
				            	 <dim:select name="status" enumType="PersSaveGoldStatus" headName="全部" headValue=""  cssClass="yhgl_sel"></dim:select>
				        </p>
					</div>
						<p>提交时间：
						   <input type="text" name="startCreateTime" value="" class="yhgl_input date"  id="beginDate" onclick="WdatePicker({dateFmt: 'yyyy-MM-dd',readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
						   <span class="mr5">至</span> 
						   <input type="text" name="endCreateTime" value="" class="yhgl_input date"  id="endDate" onclick="WdatePicker({dateFmt: 'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'beginDate\')}'})"/>
						</p>
					<div class="order" style="display: none;">
						<p>预约时间：
						   <input type="text" name="startBookTime" value="" class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({dateFmt: 'yyyy-MM-dd',readOnly:true,maxDate:'#F{$dp.$D(\'endDate2\')}'})"/>
						   <span class="mr5">至</span> 
						   <input type="text" name="endBookTime" value="" class="yhgl_input date" class="Wdate" id="endDate2" onclick="WdatePicker({dateFmt: 'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
						</p>
					</div>
					<p class="lo_btn clearfix" style="width:80px;">
						<input type="button" id="searBtn" class="search fl" value="搜索" />
						<shiro:hasPermission name="YWGL_CJYW_GRCJ_QB_DC">
							<div class="all fl" style="width:84px;">
								<input name="input" type="button" class="export ml10"
	 						   value="导出" onclick="exportData('searchBox','persSaveGoldExpo.do');"/>
	 						</div>
 						</shiro:hasPermission>
 						 <shiro:hasPermission name="YWGL_CJYW_GRCJ_YYZ_DC">
 						   <div class="order fl" style="width:84px;">
								<input name="input" type="button" class="export ml10"
 						   			value="导出" onclick="exportData('searchBox','persSaveGoldOrderExpo.do');"/>
 						  </div>
 					</shiro:hasPermission>
					</p>
				</div>
				</div>
			</form>
			<!--搜索表框  --END-->
			<div class="main_con">
				<div class="menubox clearfix">
					<ul>
						<li class="hover" id="all"><a href="#">全部</a></li>
						<li id="order" ><a href="#">预约中</a></li>
					</ul>
				</div>
				<!-- 全部 -->
				<div class="all">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" id="allTable"
						class="main_table tc">
						<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">用户名</td>
							<td align="center">姓名</td>
							<td align="center">个人手机号</td>
							<td align="center">店铺名</td>
							<td align="center">店铺名称</td>
							<td align="center">存金克重(克)</td>
							<td align="center">提交时间</td>
							<td align="center">店测克重(克)</td>
							<td align="center">最后操作时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr>
						</thead><tbody id="allGrid"></tbody>
					</table>
                </div>
	            <div class="mt10 all">
          	      <p class="fl"> 店测克重合计：<span class="yellow f24" id="totalShopCheckWeight"></span>克</p>
       			</div>
                
				<!-- 全部  END -->
                <!-- 预约中 -->
				<div class="order" style="display: none;" id="histCont">
						<table width="100%" border="0" cellspacing="0" cellpadding="3" id="orderTable"
							class="main_table tc">
							<thead>
							<tr class="title">
								<td align="center">序号</td>
								<td>订单号</td>
                                <td align="center">用户名</td>
								<td align="center">姓名</td>
								<td align="center">店铺名</td>
								<td align="center">店面名称</td>
								<td align="center">联系方式</td>
								<td align="center">存金克重(克)</td>
								<td align="center">预约码</td>
								<td align="center">预约时间</td>
								<td align="center">提交时间</td>
								<td align="center">状态</td>
								<td align="center">操作</td>
							</tr>
							</thead><tbody id="orderGrid"></tbody>
						</table>
					</div>
					<div class="paging" id="allPageTag"></div>
					<!-- 分页标签 -->
					<!-- 预约中 --END -->
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
<!-- 个人存金--全部  GridList数据 -->
<script id="allTemp" type="text/x-jquery-tmpl">
      {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= orderNo}}</td>
	    <td>{{= userName}}</td>
        <td>{{= userFullName}}</td> 
	    <td>{{= userPhone}}</td>
	    <td>{{= shopName}}</td>
        <td>{{= shopFullName}}</td> 
		<td>{{= bookWeight}}</td>
		<td>{{= createTime}}</td>
		<td>{{= shopCheckWeight}}</td>
		<td>{{= updateTime}}</td>
		<td>{{= statusName}}</td>	
		<td><a  href="<%=basePath %>business/saveGoldBusi/orderDetail.do?id={{= id}}&url=personSaveGold.do&orderType={{= orderType}}&t=<%=Math.random() %>" class="orange">订单详情</a></td>
       </tr>
    {{/each}}
</script>
<!-- 个人存金--预约中  GridList数据 -->
<script id="orderTemp" type="text/x-jquery-tmpl">
      {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= orderNo}}</td>
	    <td>{{= userName}}</td>
        <td>{{= userFullName}}</td>
        <td>{{= shopName}}</td> 
	    <td>{{= shopFullName}}</td>
        <td>{{= userPhone}}</td> 
		<td>{{= bookWeight}}</td>
        <td>{{= bookCode}}</td>
        <td>{{= bookTime}}</td>
		<td>{{= createTime}}</td>
		<td>{{= statusName}}</td>
		<td>
			<a  href="<%=basePath %>business/saveGoldBusi/orderDetail.do?id={{= id}}&tabIndex=order&url=personSaveGold.do&orderType={{= orderType}}&t=<%=Math.random() %>" class="orange">订单详情</a>
		  <shiro:hasPermission name="YWGL_CJYW_GRCJ_ZF">&nbsp&nbsp			
			<a  href="javascript:del({{= id}})" class="changeStatus orange">作废</a>
		  </shiro:hasPermission>
		</td>
       </tr>
     {{/each}}
</script>
<script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  document.getElementById("")
    	  //为'全部'选项卡添加单击事件，显示个人存金-全部信息
    	  $("#all").click(function(){
    		  $(this).addClass("hover");
    		  $("#order").removeClass("hover");
    		  $(".order").css("display","none");
    		  $(".all").css("display","block");
    		  //添加查询事件
    		  $('#searBtn').unbind("click"); //取绑‘click’事件
    		  $("#searBtn").click(function(){
    			  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"persSaveGoldAll.do","success":allCallBack});
    		  });
    		  $("#searBtn").trigger('click');
    	  });
    	//为'预约中'选项卡添加单击事件，显示个人存金-预约中信息
    	  $("#order").click(function(){
    		  $(this).addClass("hover");
    		  $("#all").removeClass("hover");
    		  $(".all").css("display","none");
    		  $(".order").css("display","block");
    		//添加查询时间
    		  $('#searBtn').unbind("click"); 
    		  $("#searBtn").click(function(){
    			  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"persSaveGoldOrder.do","success":orderCallBack});
    		  });
    		  $("#searBtn").trigger('click');
    	  });
    	  $("#${tabIndex}").trigger('click');
        });
       //all分页跳转回调
     	function allCallBack(data){
     		//清空表格数据
     		$("#allGrid").empty();
     		//填充数据
    		 $('#allTemp').tmpl(data.pageResult).appendTo("#allGrid");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"allPageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"persSaveGoldAll.do","toPageCallBack":allCallBack});
    		DMGold.PageTag.initStat({"bookSaveCount":null},data.statResult,'0');
    		DMGold.PageTag.initStat({"totalShopCheckWeight":null},data.statResult,'0.000');
        }
     	//order分页跳转回调
     	function orderCallBack(data){
     		//清空表格数据
     		$("#orderGrid").empty();
     		//填充数据
    		 $('#orderTemp').tmpl(data.pageResult).appendTo("#orderGrid");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"allPageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"persSaveGoldOrder.do","toPageCallBack":orderCallBack});
     	   //加载统计数据
    		DMGold.PageTag.initStat({"bookSaveCount":null},data.statResult,'0');
    		DMGold.PageTag.initStat({"totalShopCheckWeight":null},data.statResult,'0.000');
     	}
        function del(id){
   		 dm.confirm("是否确认作废该订单？",{
   				title:"确认",				//标题
   				okName:"确定",			//如同confirm确定按钮的value
   				cancleName:"取消",		//如同confirm取消按钮的value
   				picClass:"d_perfect",
   				callback:function(){	//按确定的执行的函数
   					DMGold.ajax({"data":{'id':id},"serialize":true,"url":"disable.do","success":function(data){
						//显示提示信息
						if("000000"==data.code){
							dm.alert(data.description,{"picClass":"d_succeed"});
						}else{
							dm.alert(data.description,{"picClass":"d_error"});
						}
						//刷新预约中列表
						$("#order").click();
					}});
   				}
   			});
        }
      //弹出框
        function popDiv(url){
     	   $.tbox.popup(url);
        }
    </script>
</html>