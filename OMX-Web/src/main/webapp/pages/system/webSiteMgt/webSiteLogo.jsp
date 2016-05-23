<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" >
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
</head>

<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
         
		<!--内容 -->
        <div class="main_title">站点LOGO</div>
		<div class="main_con">
		 <form action="webSiteLogoSave.do" enctype="multipart/form-data" method="post">
            <ul class="site_logo clearfix" >
                <li >
                   <div id="frontDiv" style="float: left;position: relative;" id="">
                     	<div style="float:left;">网站前台LOGO：</div><div style="float:left;" id="frontDiv" ><img src="/platform/ReadPic/pic/url?url=${data.front}"  id="frontImg"  /></div>
                   </div>
                   <div id="ui-upload-holder" class=" fl mr10" style="margin: 30px 30px"> 
                     <div id="ui-upload-txt">选择文件</div> 
                      <input type="file" name="frontLogo" id="frontLogo" onchange="javascript:DMGold.setImagePreview('frontLogo','frontDiv','frontImg');"class="ui-upload-input"/> 
                    </div>
                    <div><label class="gray9 ml10" >建议尺寸：200px*80*，支持jpg、png、格式</label></div>
                </li>
                <li >
                   <div id="consoleDiv" style="float: left;position: relative;">
                     	<div style="float:left;">网站后台LOGO：</div><div style="float:left;" id="consoleDiv" ><img src="/platform/ReadPic/pic/url?url=${data.backgroud}" id="consoleImg" /></div>
                   </div>
                   <div id="ui-upload-holder" class=" fl mr10" style="margin: 30px 30px"> 
                     <div id="ui-upload-txt">选择文件</div> 
                      <input type="file" name="consoleLogo" id="consoleLogo" onchange="javascript:DMGold.setImagePreview('consoleLogo','consoleDiv','consoleImg');" class="ui-upload-input"/> 
                    </div>
                    <div><label class="gray9 ml10" >建议尺寸：200px*80*，支持jpg、png、格式</label></div>
                </li>
                <li >
                
                   <div id="consIndexDiv" style="float: left;position: relative;">
                     	<div style="float:left;">后台首页LOGO：</div><div style="float:left;" id="consIndexDiv" ><img src="/platform/ReadPic/pic/url?url=${data.index}" id="consIndexImg" /></div>
                   </div>
                   <div id="ui-upload-holder" class=" fl mr10" style="margin: 30px 30px"> 
                     <div id="ui-upload-txt">选择文件</div> 
                      <input type="file" name="consIndexLogo" id="consIndexLogo" onchange="javascript:DMGold.setImagePreview('consIndexLogo','consIndexDiv','consIndexImg');" class="ui-upload-input"/> 
                    </div>
                    <div><label class="gray9 ml10" >建议尺寸：200px*80*，支持jpg、png、格式</label></div>
                </li>
            </ul> 
            <div class="btn"><input type="submit" value="提交" class="btn_cs" /></div>
          </form>
        </div>
		<!--内容  --END-->
          
</div>
<!---------------右边内容结束--------------->
</body>
  <c:if test="${param.errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${param.errMsg}'));
  </script>
  </c:if>
  <script type="text/javascript">
  //图片预览
  function setImagePreview(frontLogo,frontDiv,frontImg) {
		var docObj=document.getElementById(frontLogo);
		var imgObjPreview=document.getElementById(frontImg);
		if(docObj.files && docObj.files[0]){
			//火狐下，直接设img属性
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '200px';
			imgObjPreview.style.height = '80px';                    
			//imgObjPreview.src = docObj.files[0].getAsDataURL();
			
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式  
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		}else{
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById(frontDiv);
			//必须设置初始大小
			localImagId.style.width = "200px";
			localImagId.style.height = "80px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try{
				localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			}catch(e){
				dm.alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			//imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
</script>   
</html>
