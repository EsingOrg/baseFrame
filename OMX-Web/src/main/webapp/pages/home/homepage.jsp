<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页信息</title>
<%@include file="/WEB-INF/include/common/commHeader.jsp" %>
<script type="text/javascript">
$(function(){
	//初始化数据
	/* DMGold.ajax({"serialize":true,"url":"home/initStat.do","success":function(data){
		for(var n in data.singleResult){
			if(data.singleResult[n]){
				$("#"+n).append(data.singleResult[n]);
			}else{
				$("#"+n).append(0);
			}
		}
	}}); */
});

</script>
</head>
<body>
  <!---------------右边内容开始--------------->
      <div class="r_main clearfix">
<!---------------center--------------->	
	<!--main-->
	<shiro:hasPermission name="HOME_XXTJ">
    <div class="main_title">信息统计</div>
    <div class="main_con clearfix"> 
        <ul class="information">
            <li>
                <i class="ico01"></i>
                <div class="infor"><p><a href="javascript:void(0);" onclick="setMenu(7,3,2,'menu/statMenu.do','<%=basePath%>userStatistic/userMain.do');" id="todayRegistStat"class="f24"></a> 人</p><p>今日注册用户数</p></div>
            </li>
            <li>
              <i class="ico02"></i>
                <div class="infor"><p><a href="javascript:void(0);" onclick="setMenu(7,3,1,'menu/statMenu.do','<%=basePath%>userStatistic/inlineUser.do?startTime=<%=String.valueOf(new java.sql.Date(System.currentTimeMillis()))%>&endTime=<%=String.valueOf(new java.sql.Date(System.currentTimeMillis()))%>&statType=HOUR');" id="todayLoginStat" class="f24"></a> 人</p><p>今日登录用户数</p></div>
            </li>
            <li>
                <i class="ico03"></i>
                <div class="infor">
                  <p><a href="javascript:void(0);" onclick="setMenu(7,3,2,'menu/statMenu.do','<%=basePath%>userStatistic/userMain.do');" id="allRegistStat" class="f24"></a> 人</p>
                  <p>累计注册用户数</p></div>
            </li>
            <li>
                <i class="ico04"></i>
                <div class="infor">
                  <p><a href="javascript:void(0);" onclick="setMenu(7,3,1,'menu/statMenu.do','<%=basePath%>userStatistic/inlineUser.do?startTime=<%=String.valueOf(new java.sql.Date(System.currentTimeMillis()))%>&endTime=<%=String.valueOf(new java.sql.Date(System.currentTimeMillis()))%>&statType=HOUR')" class="f24" id="nowOnlineStat"></a> 人</p>
                  <p>当前在线用户数</p></div>
            </li>
            <li>
                <i class="ico05"></i>
                <div class="infor">
                  <p><a href="javascript:void(0);" onclick="setMenu(4,3,1,'menu/busMenu.do','<%=basePath %>business/saveGoldBusi/personSaveGold.do?tabIndex=order');" class="f24" id="saveBookCount"></a> 人</p>
                  <p>当前预约存金人数</p></div>
            </li>
            <li>
                <i class="ico06"></i>
                <div class="infor">
                  <p><a href="javascript:void(0);" onclick="setMenu(4,4,1,'menu/busMenu.do','<%=basePath %>business/getGoldBusi/getGoldSelf.do?tabIndex=2');" class="f24" id="takeBookCount"></a> 人</p>
                  <p>当前预约提金人数</p></div>
            </li>
            <li>
                <i class="ico07"></i>
                <div class="infor">
                <p><a href="javascript:void(0);" onclick="setMenu(4,5,1,'menu/busMenu.do','<%=basePath %>business/swopGoldBusi/personSwopGold.do?tabIndex=2');" class="f24" id="changeBookCount"></a> 人</p>
                <p>当前预约换金人数</p></div>
            </li>
        </ul>
	</div>
	</shiro:hasPermission>
	<shiro:hasPermission name="HOME_DBSX">
    <div class="main_title">待办事项</div>
    <div class="main_con clearfix"> 
        <ul class="todo">
            <li>待发货<a href="javascript:void(0);" onclick="setMenu(4,6,1,'menu/busMenu.do','<%=basePath %>business/logisticsMgt/waitDispatch.do');" class="yellow">（<label id="sysSendCount"></label>）</a>个</li>
            <li>待收货<a href="javascript:void(0);" onclick="setMenu(4,6,2,'menu/busMenu.do','<%=basePath %>business/logisticsMgt/waitReceive.do');" class="yellow">（<label id="sysReceiveCount"></label>）</a>个</li>
            <li>待检测<a href="javascript:void(0);" onclick="setMenu(4,6,3,'menu/busMenu.do','<%=basePath %>business/logisticsMgt/waitCheck.do');" class="yellow">（<label id="sysCheckCount"></label>）</a>个 </li>
            <li>提现待审核<a href="javascript:void(0);" onclick="setMenu(6,1,1,'menu/financeMenu.do','<%=basePath %>finance/getFinancePeingList.do?status=PENDING')" class="yellow">（<label id="withdrawalCount"></label>）</a>个</li>
            <li>放款待审核<a href="javascript:void(0);" onclick="setMenu(6,1,2,'menu/financeMenu.do','<%=basePath %>finance/getFinanceLoanList.do?status=PASS')" class="yellow">（<label id="lendingCount"></label>）</a>个</li>
        </ul>
	</div>
	</shiro:hasPermission>
	<!--main--end-->
<!---------------center--end----------->
</div>
<!---------------右边内容结束--------------->
</body>
</html>