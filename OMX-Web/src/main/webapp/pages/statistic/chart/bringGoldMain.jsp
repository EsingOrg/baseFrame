<%@ page language="java" pageEncoding="UTF-8"%>
<%
Calendar ca = Calendar.getInstance();
ca.set(Calendar.DAY_OF_MONTH, 1);
String startDate = String.valueOf(new java.sql.Date(ca.getTimeInMillis()));
String endDate = String.valueOf(new java.sql.Date(System.currentTimeMillis()));
String type = "DAY";//此处测试先写死
%>
<!DOCTYPE html>
<html>
  <head>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
 <script type="text/javascript" src="<%=basePath%>js/statistic.js"></script>    
</head> 
<body> 
<script src="<%=basePath%>js/highcharts.js"></script>
<script src="<%=basePath%>js/exporting.js" charset="utf-8"></script>
	<div class="r_main clearfix">

		<!--文本框 -->
		<div class="main_title">提金统计</div>
        <div class="main_con clearfix">
          	<div class="user_con">
                <ul class="user_now clearfix">
                <li><p class="yellow"><span class="f24">${data.data.statResult.allTotalWeight}</span>克</p><p>累计提金克重</p>
                </li> 
                <li><p class="yellow"><span class="f24">${data.data.statResult.personalTotalWeight}</span>克</p><p>个人提金克重</p>
                </li>  
                <li><p class="yellow"><span class="f24">${data.data.statResult.shopTotalWeight}</span>克</p><p>店铺提金克重</p>
                </li>             
                </ul>
          	</div>
        </div>
		<!--文本框 --END-->
		<div class="me_con">
			<div class="menubox clearfix">
				<ul>
					<li id="one1"  class="hover">趋势图</li>
				</ul>
			</div>
			<div class="part" id="con_one_1">
				<iframe id="iframepage" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%" height="100%" id="iframepage" name="iframepage" onLoad="iFrameHeight()" src="bringGoldTrend.do?statType=<%=type%>&startTime=<%=startDate%>&endTime=<%=endDate%>"></iframe>
			</div>
		</div>
	</div>
</body> 
</html> 