<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>运营管理</title>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<script type="text/javascript" src="<%=basePath%>js/left_menu.js"></script>
</head>
<!---------------左边内容开始--------------->
<body style="background: #f3f3f3;">
	<!---------------左边内容开始--------------->
	<div class="l_main">
		<!---------------左侧导航开始--------------->
		<div class="main_nav">
			<div class="cell">
				<div class="til">
					<span class="ico1">安全保障</span>
				</div>
				<ul class="con">
					<shiro:hasPermission name="YYGL_AQBZ_ZCFG">
						<li class="hover"><a href="<%=basePath%>insurance/getRegulations.do"
							target="mainFrame">政策法规</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_AQBZ_WZGG">
						<li><a href="<%=basePath%>insurance/getSiteNotice.do"
							target="mainFrame">网站公告</a></li>
					</shiro:hasPermission>
				</ul>
			</div>
			<div class="cell">
				<div class="til">
					<span class="ico2">帮助中心</span>
				</div>
				<ul class="con" style="display: none;">
					<shiro:hasPermission name="YYGL_BZZX_HJXT">
						<li><a id="sysProperty"
							href="<%=basePath%>helpCenter/getGoldSchool.do"
							target="mainFrame">黄金学堂</a></li>
					</shiro:hasPermission>
				</ul>
			</div>
			<div class="cell">
				<div class="til">
					<span class="ico2">关于我们</span>
				</div>
				<ul class="con" style="display: none;">
					<shiro:hasPermission name="YYGL_GYWM_MTBD">
						<li><a href="<%=basePath%>aboutUs/getMediaReport.do"
							target="mainFrame">媒体报道</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_GYWM_HZDP">
						<li><a href="<%=basePath%>aboutUs/getMyPartner.do"
							target="mainFrame">合作店铺</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_GYWM_LXWM">
						<li><a href="<%=basePath%>aboutUs/getConnectUs.do"
							target="mainFrame">联系我们</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_GYWM_ZXNS">
						<li><a href="<%=basePath%>aboutUs/getJoinUs.do"
							target="mainFrame">招贤纳士</a></li>
					</shiro:hasPermission>
				</ul>
			</div>
			<div class="cell">
				<div class="til">
					<span class="ico2">APP资讯</span>
				</div>
				<ul class="con" style="display: none;">
					<shiro:hasPermission name="YYGL_APPZX_CJWT">
						<li><a href="<%=basePath%>appNews/getFreQuestion.do"
							target="mainFrame">常见问题</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_APPZX_XSGL">
						<li><a href="<%=basePath%>appNews/getHelp.do"
							target="mainFrame">新手攻略</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_APPZX_APPCPJS">
						<li><a href="<%=basePath%>appNews/getProIntroduce.do"
							target="mainFrame">APP产品介绍</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_APPZX_APPZJAQ">
						<li><a href="<%=basePath%>appNews/getFundSecurity.do"
							target="mainFrame">APP资金安全</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_APPZX_APPQDX">
						<li><a href="<%=basePath%>appNews/getStartPage.do"
							target="mainFrame">APP启动页</a></li>
					</shiro:hasPermission>
				</ul>
			</div>
			<div class="cell">
				<div class="til">
					<span class="ico2">广告</span>
				</div>
				<ul class="con" style="display: none;">
					<shiro:hasPermission name="YYGL_GG_GGTP">
						<li><a
							href="<%=basePath%>advertisement/getAdvertisementPicture.do"
							target="mainFrame">广告图片</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_GG_GZWM">
						<li><a href="<%=basePath%>advertisement/getAttentionUs.do"
							target="mainFrame">关注我们</a></li>
					</shiro:hasPermission>
				</ul>
			</div>
			<div class="cell">
				<div class="til">
					<span class="ico2">链接</span>
				</div>
				<ul class="con" style="display: none;">
					<shiro:hasPermission name="YYGL_LJ_YQLJ">
						<li><a href="<%=basePath%>chaining/getFriendlyLink.do"
							target="mainFrame">友情链接</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_LJ_HZHB">
						<li><a href="<%=basePath%>chaining/getMyPartner.do"
							target="mainFrame">合作伙伴</a></li>
					</shiro:hasPermission>
				</ul>
			</div>
			<div class="cell">
				<div class="til">
					<span class="ico2">消息管理</span>
				</div>
				<ul class="con" style="display: none;">
					<shiro:hasPermission name="YYGL_XXGL_DX">
						<li><a href="<%=basePath%>message/noteList.do"
							target="mainFrame">短信</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_XXGL_YJ">
						<li><a href="<%=basePath%>message/emailList.do"
							target="mainFrame">邮件</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_XXGL_ZNX">
						<li><a href="<%=basePath%>message/letterList.do"
							target="mainFrame">站内信</a></li>
					</shiro:hasPermission>
				</ul>
			</div>
			<div class="cell">
				<div class="til">
					<span class="ico2">推广邀请码</span>
				</div>
				<ul class="con" style="display: none;">
					<shiro:hasPermission name="YYGL_TGYQM_TGYH">
						<li><a href="<%=basePath%>requestCode/tgUserList.do"
							target="mainFrame">推广用户</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_TGYQM_TJJL">
						<li><a href="<%=basePath%>requestCode/tjAwardList.do"
							target="mainFrame">推荐奖励</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_TGYQM_MJJLJL">
						<li><a href="<%=basePath%>requestCode/buyGoldRecordList.do"
							target="mainFrame">买金奖励记录</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_TGYQM_CJJLJL">
						<li><a href="<%=basePath%>requestCode/keepGoldRecordList.do"
							target="mainFrame">存金奖励记录</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_TGYQM_CZJLJL">
						<li><a href="<%=basePath%>requestCode/rechargeAwardList.do"
							target="mainFrame">充值奖励记录</a></li>
					</shiro:hasPermission>
				</ul>
			</div>
			<div class="cell">
				<div class="til">
					<span class="ico2">体验金</span>
				</div>
				<ul class="con" style="display: none;">
					<shiro:hasPermission name="YYGL_TYJ_FFMX">
						<li><a href="<%=basePath%>experience/provideDetailList.do"
							target="mainFrame">发放明细</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="YYGL_TYJ_SYMX">
						<li><a href="<%=basePath%>experience/useDetailList.do"
							target="mainFrame">使用明细</a></li>
					</shiro:hasPermission>
				</ul>
			</div>
		</div>
		<!---------------左侧导航结束--------------->
	</div>
	<div class="l_ico"></div>
	<!---------------左边内容结束--------------->
</body>
</html>
