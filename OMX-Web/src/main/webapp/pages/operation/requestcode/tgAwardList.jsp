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
    <form id="dataForm" action="tjAwardList.do" method="post">
    	<div class="main_con">
          <div class="admin_input clearfix">
	          <p>推荐人： 
			  	<input type="text" name="referrer" class="yhgl_input" value="${rs.referrer}" maxlength="40"/>
	          </p>	          
	          <p class="lo_btn"> 
	            <input name="input" type="submit" class="search" value="搜索" />
	            <shiro:hasPermission name="YYGL_TGYQM_TJJL_DC">
	   		    <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportRecAward.do');"/>
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
			  <td>推荐人</td> 
			  <td>推荐用户数量</td> 
			  <td>首次充值奖励金额（元）</td>      
			  <td>买金奖励总额（元）</td>     
			  <td>存金奖励总额（元）</td>       
			  <td>奖励总额（元）</td>    
			  <td>操作</td>      
			</tr>
			<c:forEach items="${pageList.data.pageResult.list}" var="award" varStatus="st">
		    <tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
		      <td>${st.count}</td>
		      <td>${award.referrer}</td>
		      <td>${award.pcount}</td>
	    	  <td>${award.firstRecharge}</td>
	    	  <td>${award.buyWeightReward}</td>
	    	  <td>${award.saveWeightReward}</td>
	    	  <td>${award.totalReward}</td>
	    	  <td>
	    	  	<a class="orange" href="javascript:void(0);" onclick="window.location.href='buyGoldRecordList.do?referrerId=${award.referrerId}';">买金奖励详情</a>
	    	  	<a class="orange" style="margin-left:20px;" href="javascript:void(0);" onclick="window.location.href='keepGoldRecordList.do?referrerId=${award.referrerId}';">存金奖励详情</a>
	    	  	<a class="orange" style="margin-left:20px;" href="javascript:void(0);" onclick="window.location.href='rechargeAwardList.do?referrerId=${award.referrerId}';">充值奖励详情</a>
	    	  </td>
		    </tr>
		    </c:forEach>
		    <tr class="title"><td>总计：</td><td></td>
		    	<td><fmt:formatNumber value="${pageList.data.columnStatResult.totalPcount}" pattern="#0"/></td>
		    	<td><fmt:formatNumber value="${pageList.data.columnStatResult.totalRechargeReward}" pattern="#0.00"/></td>
				<td><fmt:formatNumber value="${pageList.data.columnStatResult.totalBuyReward}" pattern="#0.00"/></td>
				<td><fmt:formatNumber value="${pageList.data.columnStatResult.totalSaveReward}" pattern="#0.00"/></td>
				<td><fmt:formatNumber value="${pageList.data.columnStatResult.totalReward}" pattern="#0.00"/></td>
				<td></td>
			</tr>
		  </table>
		</div>             
	  <!-- 分页 -->    
	  <div>
			<dim:page url="tjAwardList.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
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