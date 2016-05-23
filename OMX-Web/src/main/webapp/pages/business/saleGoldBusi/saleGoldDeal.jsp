<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <title>卖金处理</title>
  </head>
  <body>
  <div>				
	<div class="r_main clearfix ">
	  <div class="main_title">卖金处理</div>
	   <div class="main_con clearfix">
          	<div class="user_con">
                <ul class="user_now clearfix">
                    <li>
                        <p class="yellow"><span class="f24" id="lastWaitWeight">0.000</span>克</p>
                        <p>最新待处理克重</p>
                    </li>
                    <li>
                        <p class="yellow"><span class="f24" id="handleWeightTotal">0.000</span>克</p>
                        <p>累计已处理克重</p>
                    </li>
                    <li>
                        <p class="yellow"><span class="f24" id="lastMonthWeight">0.000</span>克</p>
                        <p>近一月已处理克重</p>
                    </li>
                </ul>
          	</div>
          </div>
		<form id="searchBox" >
	   <!--搜索表框  -->
          <div class="main_con">
          <div class="admin_input clearfix">
           <p>时间：
			  <input type="text" name="handleStartTime"  class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
			  <span class="mr5">至</span> 
			  <input type="text" name="handleEndTime" class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
		   </p>
		   <input type="hidden" name="type" value="SALE"/>
		   <p>处理人：
              <input type="text" name="userName" class="yhgl_input" value="" maxlength="20"/>
           </p>
           <p class="lo_btn">
             <input type="button"  id="searBtn" class="search" value="查找" /> 
             <shiro:hasPermission name="YWGL_SJYW_MJCL_MJCL">
              <input name="input" type="button" class="btn_cs ml10" value="卖金处理" onclick="popDiv('<%=basePath %>business/saleGoldBusi/saleGoldDealEdit.do?t=<%=Math.random() %>')"/>
         	</shiro:hasPermission>
           </p>   
           </div>
           </div> 
        <!--搜索表框  --END-->  
		</form>
		<div class="main_con">
		 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
				<thead>
				<tr class="title">
					<td>序号</td>
				    <td>待处理克重(克)</td>
				    <td>本次处理克重(克)</td>
					<td>剩余未处理克重(克)</td>
					<td>平台处理人</td>
					<td>处理时间</td>
				</tr>
		        </thead>
			<tbody id="grid"></tbody>
		</table>
		<div class="mt10">
          	<p class="fl">本次处理克重总计：<span class="yellow f24" id="handleWeightBranch"></span>克</p>
        </div>
		<div  class="paging" id="pageTag"></div>
		</div>
	</div>
	<div class="pager"></div>
</div>
 </body>
<c:if test="${errMsg ne null}">
<script type="text/javascript">
  //错误提示
  dm.alert(decodeURIComponent('${errMsg}'));
</script>
</c:if>
 <!-- 映射模板 -->
 <script id="Temp" type="text/x-jquery-tmpl">
{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= waitingWeight}}</td>
	    <td>{{= handleWeight}}</td>
        <td>{{= unhandleWeight}}</td> 
	    <td>{{= handlerName}}</td>
	    <td>{{= handleTime}}</td>
       </tr>
{{/each}}
</script>
<script type="text/javascript">
//页面加载时调用
$(function(){
   document.getElementById("")
   //绑定查询时间
   $("#searBtn").click(function(){
 	  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"saleGoldDealAjax.do","success":searCallBack});
   });
   //加载列表数据
   $("#searBtn").trigger('click');
   //加载统计数据
   DMGold.ajax({"formId":"searchBox","serialize":true,"url":"saleGoldDStatAjax.do","success":initStat});
});
//回调方法
function searCallBack(data){
	//清空表格数据
	$("#grid").empty();
	//填充数据
	 $('#Temp').tmpl(data.pageResult).appendTo("#grid");
	//初始化分页标签
	DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
		          "pageCount":data.pageResult.pageTotal,"url":"saleGoldDealAjax.do","toPageCallBack":searCallBack});
}
//弹出框
function popDiv(url){
	   $.tbox.popup(url);
}
//初始化统计数据
function initStat(stat){
	 if(!stat){
		 return false;
	 }
	 //最新待处理克重
	 $("#lastWaitWeight").empty();
	 $("#lastWaitWeight").append(stat.lastWaitWeight.total==null?'0.000':stat.lastWaitWeight.total);
	//累计已处理克重
	 $("#handleWeightTotal").empty();
	 $("#handleWeightTotal").append(stat.handleWeightTotal.total==null?'0.000':stat.handleWeightTotal.total);
	//近一月已处理克重
	 $("#lastMonthWeight").empty();
	 $("#lastMonthWeight").append(stat.lastMonthWeight.total==null?'0.000':stat.lastMonthWeight.total);
	//本次处理克重总计
	 $("#handleWeightBranch").empty();
	 $("#handleWeightBranch").append(stat.handleWeightBranch==null?'0.000':stat.handleWeightBranch.total);
}
 </script>
</html>