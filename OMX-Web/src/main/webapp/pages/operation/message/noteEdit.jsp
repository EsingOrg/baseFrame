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
    	<form id="mForm" action="editNote.do" method="POST">
        <div class="part" id="con_one_1">
            <ul class="infor clearfix" >
            	<li>                   
                </li>
                <li>
                  <div class="til"><span class="red">*</span>手机号：</div>
                  <div class="info">
               			<textarea name="tels" <c:if test="${isEdit ne 'no'}"> readonly </c:if> validate="q" id="textAreaInput" class="yhgl_textarea" leng="1,5000">${data.data.receiver}</textarea>*手机号以分号（;）分割
                   </div>
                </li>
                <c:if test="${isEdit eq 'no'}">
                <li>
                  <div class="til">&nbsp;</div>
                  <div class="info">
               			  导入号码<input type="file" name="upFile" onChange="submitUpload()"> 
                     <iframe style="display:none;" id="iframeOne" name="iframeOne" ></iframe>
                  </div> 
                </li>
                </c:if>
                <li>
                  <div class="til"><span class="red">*</span>短信内容：</div>
                  <div class="info">
               			<textarea name="content" <c:if test="${isEdit ne 'no'}"> readonly </c:if>  validate="q" rows="5" cols="43" class="yhgl_textarea" leng="1,200">${data.data.content}</textarea>
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
	  if(obj.value == 'specified'){
		  $("#userSel").attr("style","display:block;");
		  $("#selBtn").attr("style","display:block;");
	  }else{
		  $("#userSel").attr("style","display:none;");
		  $("#selBtn").attr("style","display:none;");
	  }
  }
  
  function submitUpload(){
	  $("#mForm").attr("enctype","multipart/form-data").attr("target","iframeOne");
	  $("#mForm").attr("action","inputTxt.do?flag=message").submit();
  }
  
  function addText(){
  	var addr=$("#textAreaInput");
	if(addr.val()==""){
		tip(addr,"此项不能为空");
		return false;
	}
	var reg=/^((1[\d]{10};\n?)+1[\d]{10};?\n?|1[\d]{10};?\n?)$/;
	if(!reg.test(addr.val())){
		tip(addr,"格式错误");
		return false;
	}
	$("#mForm").removeAttr("enctype").removeAttr("target");
	$("#mForm").attr("action","<%=basePath %>message/editNote.do");
	$("#mForm").submit();
  }

  function loadText(text){
	  if('Formatter Error' == text){
		  dm.alert("只支持txt文件");
		  return;
	  }
	  if('Mobile Error' == text){
		  dm.alert("手机格式不正确");
		  return;
	  }
	  text = text.replace(/;/g,';\r\n');
	  $("#textAreaInput").val(text);
  }
  dmCheck.initForAjax("#mForm");
  </script>
</html>
