<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/common/commHeader.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var link = null;
	function gotoSrc(aLink,url) {
		$(aLink).closest("li").siblings().find("a").removeAttr("class");
		link = url;
		gotoURL();
		if($(aLink).attr("class") == "cur"){
			return false;
		}
		$(aLink).attr("class","cur");
		var aId = aLink.id;
		if (aId == "indexA") {
			parent.frames["bigFram"].cols= "0,*";
		} else {
			parent.frames["bigFram"].cols= "210,*";
		}
		return true;
	}
	function gotoURL() {
		parent.frames["mainFrame"].location.href = link;
		//parent.frames["leftFrame"].location.href = src;
	}
	var body;
	function toIndex(url){
		gotoSrc(document.getElementById("indexA"), url);
	}
	//修改密码
 	function openDivPwd(id,loginName){
 		loginNames = encodeURIComponent(encodeURIComponent(loginName));
 		popDiv('<%=basePath %>system/consoleAccountMgt/sysUserModifyPwd.do?id='+id+'&ln='+loginNames+'&t=<%=Math.random() %>');
 	}
	$(function(){
		loadSysDate();
	});
	//加载系统日期
	function loadSysDate(){
		$.get("getSysDate.do",{"random":Math.random()},function(result){
			$("#sysDate").append(result.description);
		},"json");
	}
</script>
</head>
<body>
<div class="header clearfix" >
	<div class="logo fl">
	<img id="site_back_logo" src="/platform/ReadPic/pic/url"/>
	</div>
     <ul class="nav">
    	<li><a href="menu/homepageMenu.do" target="leftFrame" class="cur" id="indexA" onclick="changeApplyCount();gotoSrc(this,'<%=basePath %>/home/homepage.do')"><i class="ico01"></i>首页</a></li>
        <shiro:hasPermission name="YHGL">
        <li><a href="<%=basePath %>headerMenu/userMgt.do" id="userMenu" target="leftFrame" onclick="gotoSrc(this,'<%=basePath %>pages/user/user/userList.jsp')"><i class="ico02"></i>用户管理</a></li>
        </shiro:hasPermission>
        <shiro:hasPermission name="YYGL">
        <li><a href="<%=basePath %>headerMenu/operationMgt.do" id="operationMenu"  target="leftFrame" onclick="gotoSrc(this,'<%=basePath %>insurance/getRegulations.do')"><i class="ico03"></i>运营管理</a></li>
       </shiro:hasPermission>
        <shiro:hasPermission name="YWGL">
        <li><a href="<%=basePath %>headerMenu/busMgt.do" id="busMenu" target="leftFrame" onclick="gotoSrc(this,'<%=basePath %>business/purcGoldBusi/prePurcGold.do')"><i class="ico04"></i>业务管理</a></li>
        </shiro:hasPermission>
        <shiro:hasPermission name="CWGL">
        <li><a href="<%=basePath %>headerMenu/financeMgt.do" id="financeMenu" target="leftFrame" onclick="gotoSrc(this,'<%=basePath %>finance/getFinancePeingList.do?status=PENDING')"><i class="ico06"></i>财务管理</a></li>
        </shiro:hasPermission>
        <shiro:hasPermission name="TJGL">
        <li><a href="<%=basePath %>headerMenu/statMgt.do" id="statMenu" target="leftFrame" onclick="gotoSrc(this,'<%=basePath%>chartStatistic/buyGoldMain.do')"><i class="ico07"></i>统计管理</a></li>
        </shiro:hasPermission>
        <shiro:hasPermission name="XTGL">
        <li><a href="<%=basePath %>headerMenu/sysMgt.do" id="sysMenu" target="leftFrame" onclick="gotoSrc(this,'<%=basePath %>system/consoleAccountMgt/sysUserList.do')"><i class="ico08"></i>系统管理</a></li>
    	</shiro:hasPermission>
    </ul>
    <div class="account">
        <div class="mb5" id="sysDate"><span class="ico"></span></div><!-- 015年06月25日 星期三 -->
        <div>你好，<a href="#" class="yellow">${curUser.userName}</a><a onclick="parent.frames['mainFrame'].xgmmDialog();" href="javascript:void(0)" class="ml15 mr15">修改密码</a><a onclick="parent.window.location.href='loginout.do'" href="javascript:void(0)" class="acc_color">安全退出</a></div>
    </div>
</div>
<div class="header_tt"></div>
<!---------------头部结束--------------->
</body>
</html>