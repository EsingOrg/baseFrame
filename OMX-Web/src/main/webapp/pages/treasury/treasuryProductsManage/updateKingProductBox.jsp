<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>修改制品</title>
<script type="text/javascript">
  function suaud(){
	  $('#auditing').submit();
  }
  $(function(){
		$("#picture").uploadPreview({ Img: "showAPic" });//图片预览
	});
  function delpic(){
	  dm.confirm("您确定要删除吗?",{
			title:"询问",				//标题
			okName:"确定",			//如同confirm确定按钮的value
			cancleName:"取消",		//如同confirm取消按钮的value
			callback:function(){	//按确定的执行的函数
				
				$("#showAPic").attr("src","");
				$("#picId").val("-1");
			}
		});
	  
  }
  </script>
  </head>
  <body>

<div class="popup_bg"></div>
<div class="dialog">
  <div class="clearfix"> 
      <div class="title"><a href="javascript:;" onClick="$.tbox.close()" class="out"></a>修改制品</div>
      <div class="cotent">
       <form action="<%=basePath %>treasury/updateKingProduct.do" method="post" id="auditing" enctype="multipart/form-data">
       	<input type="hidden" name="token" value="${token}"/><!--  重复提交Token-->
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
         	<tr>
         		<td valign="top" width="30%" align="right">制品ID：</td>
         		<td>${pageList.data.singleResult.productNo }<input type="hidden" name="productNo" value="${pageList.data.singleResult.productNo }"/></td>
         	
         	</tr>
          <tr>
            <td valign="top" width="30%" align="right"><span class="red">*</span>制品名称：</td>
            <td><input name="name" value="${pageList.data.singleResult.productName }" type="text" class="yhgl_input" /></td>
          </tr> 
          <tr>
            <td valign="top" align="right"><span class="red">*</span>规格：</td>
            <td><input name="size" type="text" value="${pageList.data.singleResult.productSize }" class="yhgl_input" />克</td>
          </tr> 

          <tr>
           		<td valign="top" align="right">制品图片：</td>
           		<td>
                    <div id="addDiv" style="float: left;position: relative;">
                 		<div style="float:left;" id="addDiv" ><img src="/platform/ReadPic/pic/url?url=${pageList.data.singleResult.picUrl}" id="showAPic" style="width:200px; height: 80px;" onclick="attachDialog(this.src)"/></div>
                 		<input type="hidden" name="picId" id="picId" value="${pageList.data.singleResult.picId }"/>
                 		<c:if test="${pageList.data.singleResult.picUrl != null}"><a href="#" onclick="delpic()"><span class="red" >删除</span></a></c:if>
               		</div>
               	</td>
           </tr>
           <tr>
                <td valign="top" align="right"></td>
           		<td>
           			<div id="ui-upload-holder" class=" fl mr10" style="margin: 10px 40px"> 
                		<div id="ui-upload-txt">选择文件</div> 
                 		<input type="file" name="picture" id="picture" class="ui-upload-input"/>
                 		<div><label class="gray9 ml10" style="margin-top:0px;" >建议尺寸：200px*80*，支持jpg、png格式、1M以内的图片</label></div> 
                    </div>
           		</td>
          </tr>         
        </table>
        </form>
      </div>
      <div class="btn"><a href="javascript:suaud();" class="btn_cs">确定</a><a href="#" class="btn_hs ml20" onClick="$.tbox.close()" >取消</a></div> 
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
		            <td align="center"><img src=""  style='height:580px;' class="see_img02"/></td>
		          </tr>
		        </table>
		      </div>
		      <div class="btn"><a href="#" class="btn_cs" onclick="$('#attachDialog').hide();">确认</a></div> 
		    </div>
		</div>
	</div>
	<!--查看弹出图片 -->
  </body>
  <script type="text/javascript">
 
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
 	function openDivPwd(id,loginName){
 		loginNames = encodeURIComponent(encodeURIComponent(loginName));
 		popDiv('<%=basePath %>system/sysuser_modify_pwd.jsp?id='+id+'&ln='+loginNames+'&t=<%=Math.random() %>');
 	}
 	
 	 function attachDialog(src){
			$("#attachDialog img").attr('src', src);
			$("#attachDialog").show();
		  }
 </script>
</html>
