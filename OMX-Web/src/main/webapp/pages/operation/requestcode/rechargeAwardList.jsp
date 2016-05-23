<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>个人信息</title>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
</head>
<body>

  <!---------------列表内容开始--------------->
  <div class="r_main clearfix">
  
    <!-- 搜索表框  -->
    <form action="rechargeAwardList.do" method="post" id="dataForm" >
    
    	<div class="main_con" ${formDis}>
          <div class="admin_input clearfix">
          <input name="recommendedId" type="hidden" value="${rs.recommendedId}"/>
          	  <p>被推荐人： 
			  	<input type="text" name="recommended" class="yhgl_input" value="${rs.recommended}" maxlength="40"/>
	          </p>
	          <p>推荐人： 
			  	<input type="text" name="referrer" class="yhgl_input" value="${rs.referrer}" maxlength="40"/>
	          </p>
	          <p>发生时间： 
			  		<input type="text" name="stratTime" class="yhgl_input date" id="createTime1" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'createTime2\')}'})" value="${rs.stratTime}"/>
				<span class="mr5">至</span>
				<input type="text" name="endTime" class="yhgl_input date" id="createTime2" onclick="WdatePicker({minDate: '#F{$dp.$D(\'createTime1\')}'})" value="${rs.endTime}"/>
	          </p>
	          
	          <p class="lo_btn"> 
	            <input name="input" type="submit" class="search" value="搜索" />
	            <shiro:hasPermission name="YYGL_TGYQM_CZJLJL_DC">
	   		    <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportRechargeAward.do');"/>
	   		    </shiro:hasPermission>
			  </p>
		  </div>
       </div>
    <!-- 搜索表框END -->  
         
    <!-- 列表框  --> 
	<div class="main_con">
		<div class="">
		  <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
			<tr class="title">
			  <td>序号</td>
			  <td>被推荐人</td> 
			  <td>推荐人</td> 
			  <td>首次充值金额(元)</td>     
			  <td>发生时间</td>     
			  <td>推广充值奖励(元)</td>            
			</tr>
			<c:forEach items="${pageList.data.pageResult.list}" var="user" varStatus="st">
		    <tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
		      <td>${st.count}</td>
		      <td>${user.recommended}</td>
		      <td>${user.referrer}</td>
	    	  <td>${user.dealMoney}</td>
	    	  <td>${user.dealTime}</td>
	    	  <td>${user.reward}</td>
		    </tr>
		    </c:forEach>
		    <tr class="title"><td>总计：</td><td></td><td></td>
		    	<td><fmt:formatNumber value="${pageList.data.columnStatResult.totalRecharge}" pattern="#0.00"/></td>
				<td></td>
				<td><fmt:formatNumber value="${pageList.data.columnStatResult.totalRechargeReward}" pattern="#0.00"/></td>
			</tr>
		  </table>
		</div>     
	  <!-- 分页 -->    
			<dim:page url="rechargeAwardList.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
				curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
		</div>
	    </form> 
  </div>
  ${retBtn}
</body>
</html>