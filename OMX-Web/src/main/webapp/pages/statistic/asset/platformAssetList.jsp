<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>平台资产统计</title>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
 
</head>
<body>

  <!---------------列表内容开始--------------->
  <div class="r_main clearfix">
  
    <!-- 搜索表框  -->
    <form id="dataForm" action="platformAssetList.do" method="post">
    	<div class="main_con">
          <div class="admin_input clearfix">
          	<p>时间： 
			  	<input type="text" name="startTime" class="yhgl_input date" id="createTime1" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'createTime2\')}'})" value="${as.startTime}"/>
				<span class="mr5">--</span>
				<input type="text" name="endTime" class="yhgl_input date" id="createTime2" onclick="WdatePicker({minDate: '#F{$dp.$D(\'createTime1\')}'})" value="${as.endTime}"/>
	          </p>
	          <p class="lo_btn"> 
	            <input name="input" type="submit" class="search" value="搜索" />
	            <shiro:hasPermission name="TJGL_ZCTJ_PTZCTJ_DC">
	   		    <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportPlatformAsset.do');"/>
	   		    </shiro:hasPermission>
			  </p>
		  </div>
       </div> 
    <!-- 搜索表框END -->  
         
    <!-- 列表框  --> 
	<div class="main_con">
		<div class="lb_content_table">
		  <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
			<tr class="title">
			  <td>序号</td>
			  <td>时间</td> 
			  <td>充值（元）</td> 
			  <td>提现（元）</td> 
			  <td>充值手续费（元）</td> 
			  <td>提现手续费（元）</td> 
			  <td>卖金手续费（元）</td>      
			  <td>提金手续费（元）</td>     
			  <td>邮保费（元）</td>     
			  <td>活金利息支出（元）</td>      
			  <td>定期金利息支出（元）</td>   
			  <td>平台入库（克）</td>  
			  <td>平台出库（克）</td>  
			  <td>平台已收货（克）</td> 
			  <td>平台已发货（克）</td> 
			</tr>
			<c:forEach items="${pageList.data.pageResult.list}" var="user" varStatus="st">
		    <tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
		      <td>${st.count}</td>
		      <td>${user.date}</td>
		      <td>${user.rechargeTotal}</td>
	    	  <td>${user.withdrawTotal}</td>
	    	  <td>${user.rechargeFeeTotal}</td>
	    	  <td>${user.withdrawFeeTotal}</td>
	    	  <td>${user.saleFeeTotal}</td>
	    	  <td>${user.takeFeeTotal}</td>
	    	  <td>${user.postFeeTotal}</td>
	    	  <td>${user.liveInterestTotal}</td>
	    	  <td>${user.termInterestTotal}</td>
	    	  <td>${user.sysStockIn}</td>
	    	  <td>${user.sysStockOut}</td>
	    	  <td>${user.sysReceiveTotal}</td>
	    	  <td>${user.sysSendTotal}</td>
		    </tr>
		    </c:forEach>
		    <tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
		      <td></td>
	    	  <td>合计</td>
	    	  <td>${pageList.data.columnStatResult.rechargeTotal}</td>
	    	  <td>${pageList.data.columnStatResult.withdrawTotal}</td>
	    	  <td>${pageList.data.columnStatResult.rechargeFeeTotal}</td>
	    	  <td>${pageList.data.columnStatResult.withdrawFeeTotal}</td>
	    	  <td>${pageList.data.columnStatResult.saleFeeTotal}</td>
	    	  <td>${pageList.data.columnStatResult.takeFeeTotal}</td>
	    	  <td>${pageList.data.columnStatResult.postFeeTotal}</td>
	    	  <td>${pageList.data.columnStatResult.liveInterestTotal}</td>
	    	  <td>${pageList.data.columnStatResult.termInterestTotal}</td>
	    	  <td>${pageList.data.columnStatResult.sysStockIn}</td>
	    	  <td>${pageList.data.columnStatResult.sysStockOut}</td>
	    	  <td>${pageList.data.columnStatResult.sysReceiveTotal}</td>
	    	  <td>${pageList.data.columnStatResult.sysSendTotal}</td>
		    </tr>
		  </table>
		</div>             
	  <!-- 分页 -->    
	  <div style="margin-top: 25px;" id="pageId">
			<dim:page url="platformAssetList.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
						curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
		</div>
      <!-- 分页END -->           
    </div>
    <!-- 列表框END  --> 
    </form>
  </div>
  <!---------------列表内容结束--------------->
  
  
</body>
</html>