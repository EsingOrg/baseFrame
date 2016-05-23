<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>个人资产统计</title>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
 
</head>
<body>

  <!---------------列表内容开始--------------->
  <div class="r_main clearfix">
  
    <!-- 搜索表框  -->
    <form id="dataForm" action="personAssetList.do" method="post">
    	<div class="main_con">
          <div class="admin_input clearfix">
          	  <p>用户名： 
			  	<input type="text" name="userName" class="yhgl_input" value="${as.userName}" maxlength="40"/>
	          </p>
	          <p>手机号： 
			  	<input type="text" name="phone" class="yhgl_input" value="${as.phone}" maxlength="40"/>
	          </p>
	          <p>姓名： 
			  	<input type="text" name="reallyName" class="yhgl_input" value="${as.reallyName}" maxlength="40"/>
	          </p>
	          <p>账户总资产： 
			  	<input type="text"  validate="weight" name="minCashAmount" class="yhgl_input" value="${as.minCashAmount}" maxlength="40"/>元-
			  	<input type="text"  validate="weight" name="maxCashAmount" class="yhgl_input" value="${as.maxCashAmount}" maxlength="40"/>元
	          </p>
	          <p>累计赚取利息： 
			  	<input type="text"  validate="weight" name="minInRate" class="yhgl_input" value="${as.minInRate}" maxlength="40"/>元-
			  	<input type="text"  validate="weight" name="maxInRate" class="yhgl_input" value="${as.maxInRate}" maxlength="40"/>元
	          </p>
	          <p>累计提金： 
			  	<input type="text"  validate="amount" name="minTakeWeight" class="yhgl_input" value="${as.minTakeWeight}" maxlength="40"/>克-
			  	<input type="text"  validate="amount" name="maxTakeWeight" class="yhgl_input" value="${as.maxTakeWeight}" maxlength="40"/>克
	          </p>
	          <p>累计买金： 
			  	<input type="text"  validate="amount" name="minBuyWeight" class="yhgl_input" value="${as.minBuyWeight}" maxlength="40"/>克-
			  	<input type="text" validate="amount"  name="maxBuyWeight" class="yhgl_input" value="${as.maxBuyWeight}" maxlength="40"/>克
	          </p>
	          <p>累计卖金： 
			  	<input type="text"  validate="amount" name="minSaleWeight" class="yhgl_input" value="${as.minSaleWeight}" maxlength="40"/>克-
			  	<input type="text"  validate="amount" name="maxSaleWeight" class="yhgl_input" value="${as.maxSaleWeight}" maxlength="40"/>克
	          </p>
	          <p>累计存金： 
			  	<input type="text"  validate="amount" name="minSaveWeight" class="yhgl_input" value="${as.minSaveWeight}" maxlength="40"/>克-
			  	<input type="text"  validate="amount" name="maxSaveWeight" class="yhgl_input" value="${as.maxSaveWeight}" maxlength="40"/>克
	          </p>
	          <p>累计换金： 
			  	<input type="text"  validate="amount" name="minChangeWeight" class="yhgl_input" value="${as.minChangeWeight}" maxlength="40"/>克-
			  	<input type="text"  validate="amount" name="maxChangeWeight" class="yhgl_input" value="${as.maxChangeWeight}" maxlength="40"/>克
	          </p>
	          <p class="lo_btn"> 
	            <input name="input" type="submit" class="search" value="搜索" onclick="if(!dmCheck.check('#dataForm')){return false;}" />
	            <shiro:hasPermission name="TJGL_ZCTJ_GRZCTJ_DC">
	   		    <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportPersonAsset.do');"/>
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
			  <td>用户名</td> 
			  <td>手机号</td> 
			  <td>姓名</td> 
			  <td>活金（克）</td> 
			  <td>冻结活金（克）</td> 
			  <td>冻结存金（克）</td> 
			  <td>定期金</td>      
			  <td>账户总资产（元）</td>     
			  <td>可用余额（元）</td>     
			  <td>冻结金额（元）</td>      
			  <td>昨日利息（元）</td>   
			  <td>累计赚取利息（元）</td>  
			  <td>累计充值（元）</td>  
			  <td>累计提现（元）</td> 
			  <td>累计买金（克）</td> 
			  <td>累计卖金（克）</td> 
			  <td>累计存金（克）</td> 
			  <td>累计提金（克）</td> 
			  <td>累计换金（克）</td> 
			</tr>
			<c:forEach items="${pageList.data.pageResult.list}" var="user" varStatus="st">
		    <tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
		      <td>${st.count}</td>
		      <td>${user.userName}</td>
		      <td>${user.phone}</td>
	    	  <td>${user.reallyName}</td>
	    	  <td>${user.availableWeight}</td>
	    	  <td>${user.frozenWeight}</td>
	    	  
	    	  <td>${user.frozenSaveWeight}</td>
	    	  
	    	  <td>${user.termWeight}</td>
	    	  <td>${user.accontAmount}</td>
	    	  <td>${user.availableAmount}</td>
	    	  <td>${user.frozenAmount}</td>
	    	  <td>${user.lastRateAmount}</td>
	    	  <td>${user.inRateAmout}</td>
	    	  <td>${user.rechargeAmount}</td>
	    	  <td>${user.withdrawAmount}</td>
	    	  <td>${user.buyWeight}</td>
	    	  <td>${user.saleWeight}</td>
	    	  <td>${user.saveWeight}</td>
	    	  <td>${user.takeWeight}</td>
	    	  <td>${user.changeWeight}</td>
		    </tr>
		    </c:forEach>
		    <tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
		      <td></td>
		      <td></td>
		      <td></td>
	    	  <td>合计</td>
	    	  <td>${pageList.data.columnStatResult.availableWeightTotal}</td>
	    	  <td>${pageList.data.columnStatResult.frozenWeightTotal}</td>
	    	  <td>${pageList.data.columnStatResult.frozenSaveWeightTotal}</td>
	    	  <td>${pageList.data.columnStatResult.termWeightTotal}</td>
	    	  <td>${pageList.data.columnStatResult.accontAmountTotal}</td>
	    	  <td>${pageList.data.columnStatResult.availableAmountTotal}</td>
	    	  <td>${pageList.data.columnStatResult.frozenAmountTotal}</td>
	    	  <td>${pageList.data.columnStatResult.lastRateAmountTotal}</td>
	    	  <td>${pageList.data.columnStatResult.inRateAmoutTotal}</td>
	    	  <td>${pageList.data.columnStatResult.rechargeAmountTotal}</td>
	    	  <td>${pageList.data.columnStatResult.withdrawAmountTotal}</td>
	    	  <td>${pageList.data.columnStatResult.buyWeightTotal}</td>
	    	  <td>${pageList.data.columnStatResult.saleWeightTotal}</td>
	    	  <td>${pageList.data.columnStatResult.saveWeightTotal}</td>
	    	  <td>${pageList.data.columnStatResult.takeWeightTotal}</td>
	    	  <td>${pageList.data.columnStatResult.changeWeightTotal}</td>
		    </tr>
		  </table>
		</div>             
	  <!-- 分页 -->    
	  <div style="margin-top: 25px;" id="pageId">
			<dim:page url="personAssetList.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
						curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
		</div>
      <!-- 分页END -->           
    </div>
    <!-- 列表框END  --> 
    </form>
  </div>
  <!---------------列表内容结束--------------->
  
  
</body>
<script type="text/javascript">
  //增加校验模式
  dmCheck.init("#dataForm");
</script>
</html>