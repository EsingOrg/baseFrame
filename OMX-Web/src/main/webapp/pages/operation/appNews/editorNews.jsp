<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>新手攻略</title>
  </head>
 <body>
	<div class="r_main clearfix">
	<div id="popCon" class="dialog" style="width:650px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>${title}</div>
	<div class="me_con">
	<form id="publicForm" action="<%=basePath %>operation/doEditorAppNews.do" method="post" enctype="multipart/form-data">
         <div class="part" id="con_one_1">
         <input type="hidden" value="${editorNews.object}" name="object" id="type"/>
       	 <input type="hidden" value="${editorNews.type}" name="type" id="type"/>
       	 <input type="hidden" value="${editorNews.id}" name="id" id="type"/> 
         <ul class="infor clearfix" >
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>标题：</div>
                    <div class="info">
                    <input type="text" value="${pageList.data.title}" class="yhgl_input w300"  validate="q" maxlength="50" name="title" id="title"/>
                    </div>                
                </li>
                <c:if test="${editorNews.type=='modify' }">
                <li>
         		<div class="til"><span style="color:red;">*&nbsp;</span>图片：</div>
            		<div class="info">
                        <div  style="float: left;position: relative;">
                     		<div style="float:left;"><img src="/platform/ReadPic/pic/url?url=${pageList.data.picUrl}"  style="width:200px; height: 80px;" /></div>
                   		</div>
                   	</div>
                 </li>
                <li>
         		<div class="til"><span style="color:red;">*&nbsp;</span>新图片：</div>
            		<div class="info">
                        <div id="modifyDiv" style="float: left;position: relative;">
                     		<div style="float:left;" id="modifyDiv"><img src="${data.front}" id="showMPic"   style="width:200px; height: 80px;" /></div>
                   		</div>
                   	</div>
                 </li>
                 <li>
                 <li>
                   <div class="til"><span class="red">*</span>新图片：</div>
		           <div class="info">
	               <div id="ui-upload-holder" class=" fl mr10"> 
	               <div id="ui-upload-txt">选择文件</div> 
	               <input type="file" id="picture" name="picture"  onchange="javascript:DMGold.setImagePreview('picture','modifyDiv','showMPic');" class="ui-upload-input"/> 
	               </div>
	               <span class="setting_info_div">建议尺寸：200px*80*，支持jpg、png、格式</span>
	               </div>
            	</li>                
         	</c:if>
         	<c:if test="${editorNews.type=='check' }">
         	<li>
         		<div class="til"><span style="color:red;">*&nbsp;</span>图片：</div>
            		<div class="info">
                        <div  style="float: left;position: relative;">
                     		<div style="float:left;"><img src="/platform/ReadPic/pic/url?url=${pageList.data.picUrl}"  style="width:200px; height: 80px;" /></div>
                   		</div>
                   	</div>
                 </li>
         	</c:if>
         	<c:if test="${editorNews.type=='add' }">
         		<div class="til"><span style="color:red;">*&nbsp;</span>新图片：</div>
            		<div class="info">
                        <div id="modifyDiv" style="float: left;position: relative;">
                     		<div style="float:left;" id="addDiv"><img src="${data.front}" id="showAPic"   style="width:200px; height: 80px;" /></div>
                   		</div>
                   	</div>
                 <li>
                   <div class="til"><span class="red">*</span>新图片：</div>
		           <div class="info">
	               <div id="ui-upload-holder" class=" fl mr10"> 
	               <div id="ui-upload-txt">选择文件</div> 
	               <input type="file" id="picture" name="picture"  onchange="javascript:DMGold.setImagePreview('picture','addDiv','showAPic');" class="ui-upload-input"/> 
	               </div>
	               <span class="setting_info_div">建议尺寸：200px*80*，支持jpg、png、格式</span>
	               </div>
            	</li>   	
         	</c:if>
         	 <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>上架时间：</div>
                    <div class="info">
                    <input type="text" name="startTime" validate="q"
								value="${pageList.data.startTime}" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
                    </div>                
                </li>
                 <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>下架时间：</div>
                    <div class="info">
                    <input type="text" name="endTime" validate="q"
								value="${pageList.data.endTime}" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
                    </div>                
                </li>
            </ul>
            <div class="btn w600">
            <div class="btn">
		      	<c:if test="${editorNews.type=='modify' }">
		      		<input type="button" value="提交" onclick="submitForm();" class="btn_cs">
		      		<input type="button" class="btn_cs ml10 notReadOnly" value="取消" onclick="cancel();"/>
		      	</c:if>
		      	<c:if test="${editorNews.type=='add' }">
		      		<input type="submit" value="提交" onclick="submitForm();" class="btn_cs">
		      		<input type="button" class="btn_cs ml10 notReadOnly" value="取消" onclick="cancel();"/>
		      	</c:if>
				<c:if test="${editorNews.type=='check' }">
		      		<input type="button" class="btn_cs ml10 notReadOnly" value="返回" onclick="cancel();"/>
		      	</c:if>      	
	      	</div> 
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
    	if('${editorNews.type}' == 'add'){
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
