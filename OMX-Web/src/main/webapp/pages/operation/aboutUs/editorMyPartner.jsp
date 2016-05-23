<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>新增系统用户</title>
  </head>
 <body>
	<div class="r_main clearfix">
	<div id="popCon" class="dialog" style="width:650px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>${title}</div>
	<div class="me_con">
	<form id="publicForm" action="<%=basePath %>aboutUs/editorMyPartner.do?type=${type}" method="post" enctype="multipart/form-data">
          <div class="part" id="con_one_1">
            <ul class="infor clearfix" >
         <c:if test="${type=='modify'}">
       	 	<input type="hidden" value="${pageList.data.id}" name="id" id="id"/>
       	 </c:if>
       	 <c:if test="${type=='add'}">
       	 	<input type="hidden" value="0" name="id" id="id"/>
       	 </c:if>
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>名称：</div>
                    <div class="info">
                    <input type="text" value="${pageList.data.title}" class="yhgl_input w300"  maxlength="50" validate="q"  name="title" id="title"/>
                    </div>                
                </li>
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>链接：</div>
                    <div class="info"><input type="text" value="${pageList.data.url}" class="yhgl_input w300" validate="q" name="url" id="url"/></div>
                </li>  
                <li>
                <div class="til"><span style="color:red;">*&nbsp;</span>链接方式：</div>
                <c:if test="${type=='modify'}">
       	 		<div class="info"><input type="radio" name="openType" value="SELF" id="openType" <c:if test="${pageList.data.openType=='SELF'}">checked="checked"</c:if> >本页面打开
         			<input type="radio" name="openType" value="PAGE" id="openType" <c:if test="${pageList.data.openType=='PAGE'}">checked="checked"</c:if>>新页面打开
         		</div>
       	       </c:if>
       	       <c:if test="${type=='check'}">
       	 		<div class="info"><input type="radio" name="openType" value="SELF" id="openType" <c:if test="${pageList.data.openType=='SELF'}">checked="checked"</c:if> >本页面打开
         			<input type="radio" name="openType" value="PAGE" id="openType" <c:if test="${pageList.data.openType=='PAGE'}">checked="checked"</c:if>>新页面打开
         		</div>
       	   </c:if>
       	   <c:if test="${type=='add'}">
       	 		<div class="info">
       	 		<input type="radio" name="openType" value="SELF" id="openType" checked="checked" >本页面打开
         		<input type="radio" name="openType" value="PAGE" id="openType" >新页面打开
         		</div>
       	    </c:if>
       	    </li>
       	    <c:if test="${type=='add' }">
         		<li>
         		<div class="til"><span style="color:red;">*&nbsp;</span>新图片预览：</div>
            		<div class="info">
                        <div id="addDiv" style="float: left;position: relative;">
                     		<div style="float:left;" id="addDiv" ><img src="${data.front}" id="showAPic" style="width:200px; height: 80px;" /></div>
                   		</div>
                   	</div>
                 </li>
                 <li>
                   <div class="til"><span class="red">*</span>新封面图片：</div>
		           <div class="info">
	               <div id="ui-upload-holder" class=" fl mr10"> 
	               <div id="ui-upload-txt">选择文件</div> 
	               <input type="file" id="picture" name="picture"  onchange="javascript:DMGold.setImagePreview('picture','addDiv','showAPic');" class="ui-upload-input"/> 
	               </div>
	               <span class="setting_info_div">建议尺寸：200px*80*，支持jpg、png、格式</span>
	               </div>
            	</li>
         	</c:if>
         	<c:if test="${type=='modify' }">
         		<li>
           			<div class="til">封面图片：</div>
      				<div class="info">
      				<img src="/platform/ReadPic/pic/url?url=${pageList.data.picUrl}" style="width:200px; height: 80px;"></div>
           		</li>
           		
           		<li>
            		<div class="til"><span style="color:red;">*&nbsp;</span>新图片上传：</div>
            		<div class="info">
                        <div id="modifyDiv" style="float: left;position: relative;">
                     		<div style="float:left;" id="modifyDiv" ><img src="${data.front}" id="showMPic" style="width:200px; height: 80px;" /></div>
                   		</div>
                   	</div>
                 </li>
            	<li >
				   <div class="til"><span class="red">*</span>新封面图片：</div>
		           <div class="info">
	               <div id="ui-upload-holder" class=" fl mr10"> 
	               <div id="ui-upload-txt">选择文件</div> 
	               <input type="file" id="picture" name="picture"  onchange="javascript:DMGold.setImagePreview('picture','modifyDiv','showMPic');" class="ui-upload-input"/> 
	               </div>
	               <span class="setting_info_div">建议尺寸：200px*80*，支持jpg、png、格式</span>
	               </div>
			     </li>
         	</c:if>
         	<c:if test="${type=='check' }">
         		<li>
         		  <div class="til"><span style="color:red;">*&nbsp;</span>图片：</div>
	              <div style="height: 50px;"><img src="/platform/ReadPic/pic/url?url=${pageList.data.picUrl}" style="width:200px; height: 80px;"></div>
           		</li>
         	</c:if>
   
            </ul>
            <div class="btn w600">
       		 <c:if test="${type=='add' }">
	        		<input type="button" value="提交" onclick="submitForm();" class="btn_cs">
		      		<input type="button" class="btn_cs ml10 notReadOnly" value="取消" onclick="cancel();"/>
	        </c:if>
	      	<c:if test="${type=='modify' }">
		      		<input type="button" value="提交" onclick="submitForm();" class="btn_cs">
		      		<input type="button" class="btn_cs ml10 notReadOnly" value="取消" onclick="cancel();"/>
		    </c:if>
			<c:if test="${type=='check' }">
		      		<input type="button" class="btn_cs ml10 notReadOnly" value="返回" onclick="cancel();"/>
		    </c:if>  
            </div>
            </div>
            </form>
            </div>
            </div>
	</div>
	</div>
  </body>
  <script type="text/javascript">
  dmCheck.init("#publicForm");
    function cancel(){
  	  $.tbox.close();
    };
    function submitForm(){
    	if('${type}' == 'add'){
    		if($("#picture").val()=="")
    		{
    			dm.alert('上传文件不能为空!',{"picClass":"d_error"});
    			return false;
    		}
    	}
    	$("#publicForm").submit();
    	
    };
 	 
 </script>
</html>
