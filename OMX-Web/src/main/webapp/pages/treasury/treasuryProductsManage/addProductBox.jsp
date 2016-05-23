<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>新建制品</title>
<script type="text/javascript">
	dmCheck.init("#auditing");
	$(function(){
		$("#picture").uploadPreview({ Img: "showAPic" });//图片预览
	});
	
	  function attachDialog(src){
			$("#attachDialog img").attr('src', src);
			$("#attachDialog").show();
		  }
  </script>
  </head>
  <body>

<div class="popup_bg"></div>
<div class="dialog">
  <div class="clearfix"> 
  	<form action="<%=basePath %>treasury/addProduct.do" method="post" id="auditing" enctype="multipart/form-data">
  	<input type="hidden" name="token" value="${token}"/><!--  重复提交Token-->
      <div class="title"><a href="javascript:;" onClick="$.tbox.close()" class="out"></a>新建制品</div>
      <div class="cotent">
       
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
          <tr>
            <td valign="top" width="30%" align="right"><span class="red">*</span>制品名称：</td>
            <td><input name="name" type="text" class="yhgl_input" validate="q|leng" leng="1,16"/>
           	 
            </td>
          </tr> 
          <tr>
            <td valign="top" align="right"><span class="red">*</span>规格：</td>
            <td><input name="size" type="text" class="yhgl_input" validate="q|weight"/>克</td>
          </tr>
          
          <tr>
           		<td valign="top" align="right">制品图片：</td>
           		<td>
                    <div id="addDiv" style="float: left;position: relative;">
                 		<div style="float:left;" id="addDiv" ><img src="${data.front}" id="showAPic" style="width:200px; height: 80px;" onclick="attachDialog(this.src)"/></div>
               		</div>
               	</td>
           </tr>
           <tr>
                <td valign="top" align="right"></td>
           		<td>
           			<div id="ui-upload-holder" class=" fl mr10" style="margin: 10px 40px"> 
                		<div id="ui-upload-txt">选择文件</div> 
                 		<input type="file" name="picture" id="picture"  class="ui-upload-input"/>
                 		<div><label class="gray9 ml10" style="margin-top:0px;" >建议尺寸：200px*80*，支持jpg、png格式、1M以内的图片</label></div> 
                    </div>
           		</td>
          </tr>         
        </table>
        
      </div>
      <div class="btn"><input type="submit" value="确定" class="btn_cs">
      <a href="#" class="btn_hs ml20" onClick="$.tbox.close()" >取消</a></div> 
      </form>
    </div>
</div>

   <!--查看弹出图片 -->
  <div id="attachDialog" style="display: none">
	  <div class="popup_bg"></div>
		<div class="dialog" style='left:30%;width:1000px;top:30%;'>
		  <div class="clearfix">
		      <div class="title"><a href="#" class="out" onclick="$('#attachDialog').hide();"></a>查看</div>
		      <div class="cotent" style='max-height:600px;'>
		         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table"> 
		          <tr>            
		            <td align="center"><img src="" style='height:580px;' class="see_img02"/></td>
		          </tr>
		        </table>
		      </div>
		      <div class="btn"><a href="#" class="btn_cs" onclick="$('#attachDialog').hide();">确认</a></div> 
		    </div>
		</div>
	</div>
	<!--查看弹出图片 -->
  </body>
</html>
