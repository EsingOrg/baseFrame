<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<title>站点信息设置</title>
</head>
<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
        <!--搜索表框  -->
        <form id="mForm"   action="webSiteInfoSave.do" method="post">
        <div class="me_con">
        <div class="form_title">站点信息设置</div>
        <div class="part" id="con_one_1">
            <ul class="infor clearfix" >
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>站点名称：</div>
                    <div class="info"> <input type="text" maxlength="30" validate="q|leng" leng="1,30" name="siteName" value="${info.name}" class="yhgl_input w300" /><span class="setting_info_div">出现在每个页面title后面</span></div>                   
                </li>
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>首页title：</div>
                    <div class="info"> 
	                    <textarea  style="width:300px;height:40px;" maxlength="30" validate="q|leng" leng="1,30" height:40px;" name="siteIndexTitle" class="yhgl_input w300" >${info.indexTitle}</textarea><span class="setting_info_div">在首页标题</span>    
                    </div>                   
                </li>
                <li>
                    <div class="til">description描述：</div>
                    <div class="info"> 
	                    <textarea style="width:300px;  height:90px;" type="text" name="siteDescription" value="" class="yhgl_input w300" />${info.description}</textarea><span class="setting_info_div">在首页description中显示</span>
                    </div>
                </li>
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>公司名称：</div>
                    <div class="info"> <input type="text" maxlength="30" validate="q|leng" leng="1,30" name="siteCompanyName" value="${info.companyName}" class="yhgl_input w300" /></div>                   
                </li>
                
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>详细地址：</div>
                    <div class="info"> <input type="text" maxlength="30" validate="q|leng" leng="1,60" name="siteAddr" value="${info.addr}" class="yhgl_input w300" /></div>                   
                </li>
                <li>
                    <div class="til">客服电话：</div>
                    <div class="info"> <input type="text" maxlength="30" name="siteServicePhone" value="${info.servicePhone}" class="yhgl_input w300" /></div>                   
                </li>
                
                
                
                <c:forEach items="${qqServicelist}" var="qs" varStatus="vs">
                <li>
                    <div class="til">客服昵称：</div>
                    <div class="info"> 
                    	<input type="text" maxlength="10" validate="q" name="siteServiceQq[${vs.index}].qqName" value="${qs.qqName}" class="yhgl_input w145" />
                    	&nbsp;&nbsp;QQ号码：<input type="text" maxlength="20" validate="q|z" name="siteServiceQq[${vs.index}].qqNumber" value="${qs.qqNumber}" class="yhgl_input w145" />
                    	<a name="add" class="ico_add"></a>
                    	<c:if test="${vs.count ne 1}">
                    		<a name="del" class="ico_delete">删除</a>
                    	</c:if>
                    </div>                   
                </li>
                </c:forEach>
                
                
                
                <li>
                    <div class="til">服务邮箱：</div>
                    <div class="info"> <input type="text" maxlength="60" validate="email" name="siteServiceEmail" value="${info.serviceEmail}" class="yhgl_input w300" /></div>                   
                </li>
                <li>
                    <div class="til">工作时间：</div>
                    <div class="info"> <input type="text" maxlength="30" validate="q|leng" leng="1,30" name="siteWorkTime" value="${info.workTime}" class="yhgl_input w300" /></div>                   
                </li>
                <li>
                    <div class="til">QQ交流群：</div>
                    <div class="info"> <input type="text" maxlength="30" validate="q"  name="qqgroup" value="${info.qqgroup}" class="yhgl_input w300" /></div>                   
                </li>
                <li>
                    <div class="til">新浪微博号：</div>
                    <div class="info"> <input type="text" maxlength="30" validate="q" name="sinablog" value="${info.sinablog}" class="yhgl_input w300" /></div>                   
                </li>
                <li>
                    <div class="til">微信服务号：</div>
                    <div class="info"> <input type="text" maxlength="30" validate="q"  name="weixin" value="${info.weixin}" class="yhgl_input w300" /></div>                   
                </li>
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>网站域名：</div>
                    <div class="info"> <input type="text" maxlength="60"  validate="q" name="siteDomain" value="${info.Domain}" class="yhgl_input w300" /></div>                   
                </li>
                 <li>
                    <div class="til"><span class="red">*&nbsp;</span>APP下载链接：</div>
                    <div class="info"> <input type="text" maxlength="60"  validate="q" name="siteAppDownLink" value="${info.appDownLink}" class="yhgl_input w300" /></div>                   
                </li>
                
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>网站备案号：</div>
                    <div class="info"> <input type="text" maxlength="60" validate="q"  name="siteBeian" value="${info.beian}" class="yhgl_input w300" /><span class="setting_info_div">在网站底部显示备案号</span></div>                   
                </li>
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>网站版权信息：</div>
                    <div class="info"> <input type="text" maxlength="180" validate="q" name="siteVerInfo" value="${info.verInfo}" class="yhgl_input w300" /><span class="setting_info_div">在网站底部显示版权</span></div>                   
                </li>
                
            </ul>
            <div class="btn w600">
            	<input type="submit" value="提交" class="btn_cs" />
             </div>
            </div>
            </div>
            </form>
		</div>
		<div id="copyLi" style="display:none"> 
			<li>
                <div class="til">客服昵称：</div>
                <div class="info"> 
                    	<input id="qqName" type="text" maxlength="10" validate="q" name="" value="qqName" class="yhgl_input w145" />
                    	&nbsp;&nbsp;QQ号码：<input id="qqNumber" type="text" maxlength="20" validate="q|z" name="qqNumber" value="" class="yhgl_input w145" />
                    	<a name="add" class="ico_add"></a><a name="del" class="ico_delete">删除</a>
                </div>                   
            </li>
		</div>
<!---------------右边内容结束--------------->
<c:if test="${param.errMsg ne null}">
  <script type="text/javascript">
    dm.alert(decodeURIComponent('${param.errMsg}'));
  </script>
</c:if>
<script type="text/javascript">
	dmCheck.init("#mForm");
	$("#subBtn").click(function(){
		if(!dmCheck.check("#mForm")){
			return false;
		}
		$("#mForm").submit();
	});
	var qqCount=${qqCount};
	$("[name=add]").live("click",function(){
		if(qqCount<4){
			
			var qqName = $("#qqName"),qqNumber = $("#qqNumber");
			qqName.attr("id","");
			qqNumber.attr("id","");
			qqName.attr("name","siteServiceQq["+qqCount+"].qqName");
			qqNumber.attr("name","siteServiceQq["+qqCount+"].qqNumber");
			$(this).closest("li").after($("#copyLi").html());
			qqName.attr("id","qqName");
			qqNumber.attr("id","qqNumber");
			qqName.attr("name","");
			qqNumber.attr("name","");
			qqCount++;
		}else{
			dm.alert("最多只能加4个");
		}
	});
	$("[name=del]").live("click",function(){
		qqCount--;
		$(this).closest("li").remove();
	});
	$("#regionOne").change(function(){
		getRegion($(this).val());
	});
	var message="${message}";
	if(message != ""){
		dm.alert(message);
	}
</script>
</body>
</html>
