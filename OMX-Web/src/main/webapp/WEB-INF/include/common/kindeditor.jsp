<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<!-- 拥有下拉菜单，是否发布 -->
<script type="text/javascript" src="/console/js/common/jquery.js"></script>
<script type="text/javascript" src="/console/js/common/common.js"></script>

<script type="text/javascript" src="/console/js/common/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/console/css/common.css"/>

<!-- 富文本编辑器的css和js文件 -->
	<link rel="stylesheet" href="/console/js/kindeditor-4.1.10/themes/default/default.css" />
	<link rel="stylesheet" href="/console/js/kindeditor-4.1.10/plugins/code/prettify.css" />
	<script charset="utf-8" src="/console/js/kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="/console/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script charset="utf-8" src="/console/js/kindeditor-4.1.10/plugins/code/prettify.js"></script>
<title>${plateformArticleRes.title}</title>

	<link rel="stylesheet" type="text/css" href="/console/css/admin.css"/>
    <script type="text/javascript" src="/console/js/common/formValidate.js"></script>
</head>
<body>
    <div class="r_main clearfix">
    	<form id="mForm" action="${plateformArticleRes.submitPath}" method="post">
	        <input type="hidden" name="id" value='${data.data.id }' style="visibility: hidden;"/>
	        <input type="hidden" name="type" value='${plateformArticleRes.type}' style="visibility: hidden;"/>
	        <input type="hidden" name="submitPath" value='${plateformArticleRes.submitPath}' style="visibility: hidden;"/>
	        <input type="hidden" name="token" value="${token}">
	        <input type="hidden" name="retUrl" value="${retUrl}">
	        <input type="hidden" name="key" value="${key}">
	        <div class="main_con">
	        <div class="me_con">
	        	<div class="form_title">${plateformArticleRes.type}</div>
	        	<div class="part" id="con_one_1">
	            	<ul class="infor clearfix" >
	                	<li>
	                    	<div class="til"><span class="red">*</span>标题：</div>
	                    	<div class="info"><input maxlength="50" validate="q" type="text" name="title" id="textfield" value='${data.data.title}' class="yhgl_input w300" /></div>                   
	                	</li>   
	                	<li>
	                  		<div class="til"><span class="red">*</span>内容：</div>
	                  		<div class="info">
		               			<textarea name="content" id="content" validate="q"  cols="100" rows="16" style="width:700px;height:280px;">${data.data.content}</textarea> 
		               			<span id="contentInfo" style="color:red;display:none;height:25px;position:absolute;">&nbsp; 内容不能为空</span>
	                    	</div>
	               		</li>              
	            	</ul>
		            <div class="btn">
		            	<input name="input" type="button" onclick="submitRegulation()" class="btn_cs ml20"  value="提交" />
		            	<c:if test="${isView == null}">
		            	  <input type="button" name="" onclick="viewArticle()" value="预览" class="btn_cs ml20"/>
		            	</c:if>
		            	<c:if test="${retUrl ne null}">
		            	  <a href="${retUrl}" class="btn_cs ml20">返回</a>
		            	</c:if>
		            </div>
            </div>
            </div>
          </div>
       </form>
       
</div>
<c:if test="${readonly}">
<script type="text/javascript">
$("input[name='input']").css("display","none");
</script>
</c:if>
  <c:if test="${errMsg ne '' && errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
  </script>
  </c:if>
<script type="text/javascript">
dmCheck.init("#mForm");
	var editor1;
	KindEditor.ready(function(K) 
	{
		editor1 = K.create('textarea[name="content"]', {
			uploadJson : '<%=basePath%>common/kindeditorPicUpload.do',
			allowFileManager : false,
			formatUploadUrl : false,
			afterBlur : function() {
				this.sync();
				$("#content").text(this.html());
			},
			afterFocus : function() {
				$("#errContent").html("&nbsp;");
			},
			afterChange : function() {
				//限制字数
				var limitNum = 10000;  //设定限制字数
				var pattern = '还可以输入' + limitNum + '字';
				//$('#contentInfo').html(pattern).show(); //输入显示
				if(this.count('text') > limitNum) {
			       pattern = ('最大允许输入1万字');
			       $('#contentInfo').html(pattern).show(); //输入显示
			       //超过字数限制自动截取
			       var strValue = this.text();
			       strValue = strValue.substring(0,limitNum);
			       this.text(strValue);      
				} else {
				   if(this.count('text') < limitNum) $('#contentInfo').hide();
			       //计算剩余字数
			       var result = limitNum - this.count('text'); 
			       pattern = '还可以输入' +  result + '字'; 
				}
			}
		});
		<c:if test="${readonly}">editor1.readonly();</c:if>
		prettyPrint();
	});
	dmCheck.init("#mForm");
	function viewArticle(){
		var url = '${plateformArticleRes.preViewPath}';
		$("#mForm").attr("action", url).attr("target","_blank").submit();
		};
	function submitRegulation(){
		if(!dmCheck.check("#mForm")){
			return false;
		}
		$("#mForm").submit();
	};
</script>
            
  </body>
</html>
	 						