<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
	<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<title>APP启动页</title>
</head>
<body>
	<div class="systemUser">				
			<div class="r_main clearfix ">
				<div class="main_con">
				<form action="<%=basePath %>appNews/updateStartPage.do" method="post" id="auditing" enctype="multipart/form-data">
					<div class="admin_input clearfix">
					 <div >
					      	<h1>IOS启动页图片</h1><br>
					      	<div style="padding-left: 50px;">
						      		<div style="float: left"><img src="/platform/ReadPic/pic/url?url=${iosPic.data.pageResult.list[0].picUrl}" style="width:160px; height: 284px;"></div>
						      		<div id="iosDiv" style="float: left;position: relative;margin-left: 80px;">
					                     <div style="float:left;" id="iosDiv" ><img src="${data.front}" id="showIPic" style="width:160px; height: 284px;" /></div>
					                </div>
				                	<div id="ui-upload-holder" class=" fl mr10" style="margin: 100px 40px"> 
				                     	<div id="ui-upload-txt">选择文件</div> 
				                      	<input type="file" name="iosPic" id="iosPic" onchange="javascript:DMGold.setImagePreview('iosPic','iosDiv','showIPic',this);" class="ui-upload-input"/>
					                </div>
					                <div style="padding-top: 100px;"><span style="color: red">*</span><label class="gray9 ml10" style="margin-top:0px;" >建议尺寸：640px*1136*，支持jpg、png、格式</label></div>
						    </div>
					   </div>
					</div>
					<hr style="margin: 30px 0px 10px 0px; float: inherit;" >
					<div class="admin_input clearfix">
						<div>
							<h1>Android启动页图片</h1><br>
							<div style="padding-left: 50px;">
						      		<div style="float: left"><img src="/platform/ReadPic/pic/url?url=${androidPic.data.pageResult.list[0].picUrl}" style="width:180px; height: 284px;"></div>
						      		<div id="androidDiv" style="float: left;position: relative;margin-left: 60px;">
					                     <div style="float:left;" id="androidDiv" ><img src="${data.front}" id="showAPic" style="width:180px; height: 284px;" /></div>
					                </div>
				                	<div id="ui-upload-holder" class=" fl mr10" style="margin: 100px 40px"> 
				                     	<div id="ui-upload-txt">选择文件</div> 
				                      	<input type="file" name="androidPic" id="androidPic" onchange="javascript:DMGold.setImagePreview('androidPic','androidDiv','showAPic',this);" class="ui-upload-input"/>
					                </div>
					                <div style="padding-top: 100px;"><span style="color: red">*</span><label class="gray9 ml10" style=" margin-top:0px;color:red;" >建议尺寸：720px*1280*，支持jpg、png、格式</label></div>
						 	</div>
						 </div>
					</div>
					<hr style="margin: 30px 0px 10px 0px; float: inherit;">
					<div class="admin_input clearfix" style="margin: 20px 0px 5px 150px">
						<input type="button" onclick="update()" value="提交" class="btn_cs">
			      		<a href="#" class="btn_hs ml20" class="btn_cs" onClick="$.tbox.close()">取消</a>
			      	</div>
			      </form>
				</div>
		     </div>
	</div>
</body>
  <c:if test="${errMsg ne '' && errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
  </script>
  </c:if>
  <script type="text/javascript">
  function update(){
	  var ios = $('#iosPic').val();
	  var ad = $('#androidPic').val();
	  if(ios == "" && ad == "" ){
		  dm.alert('请选择上传的文件!',{"picClass":"d_error"});
		  return ;
	  }else{
		  $('#auditing').submit();
	  }
	  
  }
  </script>
</html>