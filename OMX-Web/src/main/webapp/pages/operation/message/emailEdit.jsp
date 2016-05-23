<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>  
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
</head>
  <body>
<div class="r_main clearfix">
<div id="popCon" class="dialog" style="width:600px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>${title}</div>
    	<form id="mForm" action="editEmail.do" method="POST">
        <div class="part" id="con_one_1">
            <ul class="infor clearfix" >
            	<li>                  
                </li>
                 <li>
                    <div class="til">发送对象：</div>
                    <div class="info">
                      <input type="radio" name="type" value="SPECIFY" <c:if test="${data.data.type == 'SPECIFY'}"> checked="checked" </c:if> onclick="checkDisplay(this)"/> 指定用户

                      <input type="radio" name="type" value="ALL" <c:if test="${data.data.type == 'ALL' || empty data.data.type}"> checked="checked" </c:if> onclick="checkDisplay(this)"/> 所有人
                    
                    </div>                   
                </li>
                <li id="userSel" <c:if test="${data.data.type ne 'SPECIFY'}"> style="display: none;" </c:if> >
                  <div class="til"><span class="red">*</span>邮箱地址：</div>
                  <div class="info">
               			<textarea name="mails"  id="textAreaInput" <c:if test="${isEdit ne 'no'}">readonly</c:if> class="border">${data.data.receiver}</textarea>*email地址以分号（;）分割
                   </div>
                </li>
               <c:if test="${isEdit eq 'no'}">
                <li id="selBtn" <c:if test="${data.data.type ne 'SPECIFY'}"> style="display: none;" </c:if> >
                  <div class="til">&nbsp;</div>
                  <div class="info">
               			  导入邮箱地址<input type="file" name="upFile" onChange="submitUpload()"> 
                     <iframe style="display:none;" id="iframeOne" name="iframeOne" ></iframe>
                  </div> 
                </li>
                </c:if>
                <li>
                  <div class="til"><span class="red">*</span>邮件主题：</div>
                  <div class="info">
               			<input type="text" <c:if test="${isEdit ne 'no'}">readonly</c:if> name="title" validate="q" maxlength="45" id="textfield" value="${data.data.title}" class="yhgl_input w300"/>
                   </div>
                </li>
                <li>
                  <div class="til"><span class="red">*</span>邮件内容：</div>
                  <div class="info">
               			<textarea name="content" validate="q|leng" leng="1,200" rows="5" <c:if test="${isEdit ne 'no'}">readonly</c:if> cols="43" validate="q" class="border">${data.data.content}</textarea>
                   </div>
                </li>
            </ul>
            <div class="btn w600">
            <c:if test="${isEdit eq 'no'}">
            <input name="input" type="button" onclick="addText()" class="btn_cs ml10" value="发送" />
            </c:if>
            <a href="javascript:void(0);" onClick="$.tbox.close()" class="btn_cs ml20">取消</a> </div>
            </div>
            </form>
            </div>
            </div>
</div>
  </body>
  <script type="text/javascript">
  var isSubmit = true;
  function checkDisplay(obj){
	  var isEdit = '${isEdit}';
	  if('yes' == isEdit){
		  return;
	  }
	  if(obj.value == 'SPECIFY'){
		  $("#userSel").attr("style","display:block;");
		  $("#selBtn").attr("style","display:block;");
	  }else{
		  $("#userSel").attr("style","display:none;");
		  $("#selBtn").attr("style","display:none;");
	  }
  }
  
  function submitUpload(){
	  $("#mForm").attr("enctype","multipart/form-data").attr("target","iframeOne");
	  $("#mForm").attr("action","inputTxt.do?flag=email&t=<%=Math.random()%>").submit();
  }
  
  function addText(){
	  if($("[name=type]:checked").val()!="ALL"){
		  var addr=$("#textAreaInput");
		  if(addr.val()==""){
			  tip(addr,"邮箱地址不能为空");
			  return false;
		  }
		  var reg=/^((\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*;\n?)+(\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*);?\n?|(\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*);?\n?)$/;
		 // var reg=/^((\d+;\n)+(\d)+|(\d)+)$/;
		  if(!reg.test(addr.val())){
			  tip(addr,"邮箱地址格式错误");
			  return false;
		  }
	  }

	  $("#mForm").removeAttr("enctype").removeAttr("target");
	  $("#mForm").attr("action","<%=basePath %>message/editEmail.do");
	  $("#mForm").submit();
  }

  function loadText(text){
	  if('Formatter Error' == text){
		  dm.alert("只支持txt文件");
		  return;
	  }
	  if('Email Error' == text){
		  dm.alert("邮箱格式不正确");
		  return;
	  }
	  text = text.replace(/;/g,';\r\n');
	  $("#textAreaInput").val(text);
  }
  dmCheck.initForAjax("#mForm");
  </script>
</html>
