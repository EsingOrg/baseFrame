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
		<div class="main_title">用户统计</div>
        <div class="main_con clearfix">
          	<div class="user_con">
                <ul class="user_now clearfix">
                <li><p class="yellow"><span class="f24">${data.data.registeredCount.totalCount}</span>人</p><p>注册用户数</p>
                </li> 
                <li><p class="yellow"><span class="f24">${data.data.registeredCount.registedOfPcCount}</span>人</p><p>PC注册用户数</p>
                </li>   
                <li><p class="yellow"><span class="f24">${data.data.registeredCount.registedOfADCount}</span>人</p><p>APP注册用户数</p>
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
				<iframe id="iframepage" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%" height="100%" id="iframepage" name="iframepage" onLoad="iFrameHeight()" src="userTrend.do?statType=<%=type%>&startTime=<%=startDate%>&endTime=<%=endDate%>"></iframe>
			</div>
		</div>
	</div>
</body> 
</html> 