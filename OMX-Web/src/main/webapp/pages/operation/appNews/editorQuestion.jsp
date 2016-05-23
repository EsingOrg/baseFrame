<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<!-- 富文本编辑器的css和js文件 -->
	<link rel="stylesheet" href="/console/js/kindeditor-4.1.10/themes/default/default.css" />
	<link rel="stylesheet" href="/console/js/kindeditor-4.1.10/plugins/code/prettify.css" />
	<script charset="utf-8" src="/console/js/kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="/console/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script charset="utf-8" src="/console/js/kindeditor-4.1.10/plugins/code/prettify.js"></script>
<title></title>
</head>
<body>
	<div class="r_main clearfix">
       <form id="publicForm" action="<%=basePath %>appNews/editorFreQuestion.do" method="post" id="auditing" enctype="multipart/form-data" >
       <!-- 隐藏开始 -->
	       	<input type="hidden" value="${editorNews.type}" name="type" id="type"/>
	       	 <c:if test="${editorNews.type=='modify'}">
	       	 	<input type="hidden" value="${pageList.data.id}" name="id" id="id"/>
	       	 </c:if>
	       	 <c:if test="${editorNews.type=='add'}">
	       	 	<input type="hidden" value="0" name="id" id="id"/>
	       	 </c:if>
       <!-- 隐藏结束 -->
       <!-- 编辑部分开始 -->
         <div class="main_con">
       		<div class="me_con" style="margin-top: 10px;">
	        	<div class="part" id="con_one_1">
	        		<ul class="infor clearfix" >
	                	<li>
	                    	<div class="til"><span class="red">*</span>标题：</div>
	                    	<div class="info"><input maxlength="50" name="title"  validate="q" value="${pageList.data.title}"  type="text" id="textfield"  class="yhgl_input w300" /></div>                   
	                	</li>
	                	<!-- 
	                	<li>
	                    	<div class="til"><span class="red">*</span>显示时间：</div>
	                    	<div class="info">
	                    		<input type="text" name="publishDate" id = "showTime" validate="q"
								value="${pageList.data.publishDate}" class="yhgl_input date"
								class="Wdate" id="showTime"
								onclick="WdatePicker()" />
	                    	</div>                   
	                	</li>
	                	 -->
	                	<li>
	                  		<div class="til"><span class="red">*</span>内容：</div>
	                  		<div class="info">
		               			<textarea name="content" id="content" validate="q"  cols="100" rows="16" style="width:700px;height:280px;">
		               				${pageList.data.content}
								</textarea> 
		               			<span id="contentInfo" style="color:red;display:none;height:25px;position:absolute;">&nbsp; 内容不能为空</span>
	                    	</div>
	               		</li>  
	                </ul>
	                <div class="infor clearfix" style="margin-top: 20px;">
	                	<div class="til" ><span class="red">*</span>是否发布:</div>
			                <select name='publishFlag' class='yhgl_sel' style="margin-left: 10px;" >
			                	<option value='Y' selected='selected' >是</option>
								<option value='N'>否</option>
							</select>
					</div>
	        	</div>
	        </div>
	      
       <!-- 编辑部分结束 -->
       <!-- 按钮操作 -->	 
	        <div class="btn">
		      	<c:if test="${editorNews.type=='modify' }">
		      		<input type="submit" value="提交" class="btn_cs">
		      		<a href="<%=basePath %>appNews/getFreQuestion.do">
		      			<input class="btn_cs ml20 "  type="button" value="取消"/>
		      		</a>
		      	</c:if>
		      	<c:if test="${editorNews.type=='add' }">
		      		<input type="submit" value="提交" class="btn_cs">
		      		<a href="<%=basePath %>appNews/getFreQuestion.do">
		      			<input class="btn_cs ml20 "  type="button" value="取消"/>
		      		</a>
		      	</c:if>
				<c:if test="${editorNews.type=='check' }">
		      		<a href="<%=basePath %>appNews/getFreQuestion.do">
		      			<input class="btn_cs ml20 "  type="button" value="取消"/>
		      		</a>
		      	</c:if>      	
	      	</div> 
	    <!-- 按钮操作 -->
	    </div>
       </form>
      </div>
</body>
  <c:if test="${errMsg ne '' && errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
  </script>
  </c:if>
<script type="text/javascript">
dmCheck.init("#publicForm");
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
 	function openDivPwd(id,loginName){
 		loginNames = encodeURIComponent(encodeURIComponent(loginName));
 		popDiv('<%=basePath %>system/sysuser_modify_pwd.jsp?id='+id+'&ln='+loginNames+'&t=<%=Math.random() %>');
 	}
 	
 </script>
 <script type="text/javascript">
	var editor1;
	KindEditor.ready(function(K) 
	{
		editor1 = K.create('textarea[name="content"]', {
			uploadJson : '/console/common/kindeditorPicUpload.do',
			allowFileManager : true,
			formatUploadUrl : true,
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
	});
</script>
</html>