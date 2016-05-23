<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
        <script type="text/javascript" src="<%=basePath%>js/statistic.js"></script>
    
<script type="text/javascript"> 
var series = ${data.data.singleResult.series};//统计数据
$(function(){
	var categories1 = ${data.data.singleResult.categorieData}; //X轴数据
	var data1 = [{name: series[0].name,data: series[0].data}, 
                 {name: series[1].name,data: series[1].data}];	//个人/店铺数据
	 $('#line').highcharts({
          title: {
              text: '<strong>个人/店铺买金曲线图</strong>'
          },
          colors:['#336699','#CC6666'],
          chart: {
              type: 'spline'
          },
          exporting:{
        	  enabled: false,
        	  url: 'exportImg.do'
          },
          yAxis: {
		      min:0,
              title: {
                  text: '单位：克'
              },
              plotLines: [{
                  value: 0,
                  width: 1,
                  color: '#808080'
              }]
          },
          xAxis: {
              categories: categories1,
              labels:{rotation:-45}
          },
          credits: {
              enabled: false
          },
		  legend: {
        	enabled: true
         },
          series: data1
      });
});


</script> 
</head> 
<body style="background: #FFF;"> 
<script src="<%=basePath%>js/highcharts.js"></script>
<script src="<%=basePath%>js/exporting.js" charset="utf-8"></script>
	<div class="clearfix">
		<!--搜索表框  -->
		<form action="buyGoldTrend.do" method="post" id="submitForm">
		    <input type="hidden" name="statType" value="${stat.statType}" id="type"/>
			<div class="admin_input clearfix">
				<p>
					<input type="text" name="startTime" value="${stat.startTime}" class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:getDate('endDate')||new Date()})"/>
					<span class="mr5">至</span> 
					<input type="text" name="endTime" value="${stat.endTime}" class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,maxDate:new Date(),minDate:getDate('startDate')})"/>
				</p>
				<p class="quarter">
					<a href="javascript:;" <c:if test="${stat.statType eq 'DAY'}"> class="cur" </c:if> onclick="changeType('DAY')">天</a>
					<a href="javascript:;" <c:if test="${stat.statType eq 'MONTH'}"> class="cur" </c:if> onclick="changeType('MONTH')">月</a>
					<a href="javascript:;" <c:if test="${stat.statType eq 'SEASON'}"> class="cur" </c:if> onclick="changeType('SEASON')">季</a>
					<a href="javascript:;" <c:if test="${stat.statType eq 'YEAR'}"> class="cur" </c:if> onclick="changeType('YEAR')">年</a>
				</p>
				<p class="lo_btn">
					<input name="input" type="submit" class="search" value="搜索" />
				</p>
			</div>
		</form>
		<div class="mt10">
		<div id="line" style="max-width: 942; height: 382; margin: 0 auto"></div>
		</div>
	</div>
</body> 
</html> 