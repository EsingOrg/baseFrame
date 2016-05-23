<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
  	<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
  	<script charset="utf-8" src="<%=basePath %>/js/common/registerShop.js"></script>
	<script type="text/javascript"  src="<%=basePath %>js/common/ajaxfileupload.js"></script>
    <title>${title}</title>
  </head>
  <body>

<div class="popup_bg"></div>
<div class="dialog">
  <div class="clearfix"> 
      <div class="title"><a href="javascript:;" onClick="$.tbox.close()" class="out"></a>${title}</div>
      <div class="cotent">
       <form action="<%=basePath %>chaining/editorFriendlyLink.do" method="post" id="auditing">
         <c:if test="${type=='modify'}">
       	 	<input type="hidden" value="${pageList.data.id}" name="id" id="id"/>
       	 </c:if>
       	 <c:if test="${type=='add'}">
       	 	<input type="hidden" value="0" name="id" id="id"/>
       	 </c:if>
       	 <input type="hidden" value="${type}" name="type" id="type"/>
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
         	<tr>
         		<td valign="top" width="30%" align="right">名称：</td>
         		<td><input type="text" value="${pageList.data.title}" class="yhgl_input" name="title" id="title"/></td>
         	</tr> 
         	<tr>
         		<td valign="top" width="30%" align="right">链接：</td>
         		<td><input type="text" value="${pageList.data.url}" class="yhgl_input" name="url" id="url"/></td>
         	</tr> 
         	<c:if test="${type=='modify'}">
         	 	<td valign="top" width="30%" align="right"></td>
       	 		<td><input type="radio" name="openType" value="SELF" id="openType" <c:if test="${pageList.data.openType=='SELF'}">checked="checked"</c:if> >本页面打开
         			<input type="radio" name="openType" value="PAGE" id="openType" <c:if test="${pageList.data.openType=='PAGE'}">checked="checked"</c:if>>新页面打开
         		</td>
       	   </c:if>
       	   <c:if test="${type=='check'}">
         	 	<td valign="top" width="30%" align="right"></td>
       	 		<td><input type="radio" name="openType" value="SELF" id="openType" <c:if test="${pageList.data.openType=='SELF'}">checked="checked"</c:if> >本页面打开
         			<input type="radio" name="openType" value="PAGE" id="openType" <c:if test="${pageList.data.openType=='PAGE'}">checked="checked"</c:if>>新页面打开
         		</td>
       	   </c:if>
       	   <c:if test="${type=='add'}">
       	 		<td valign="top" width="30%" align="right"></td>
       	 		<td><input type="radio" name="openType" value="SELF" id="openType" checked="checked" >本页面打开
         			<input type="radio" name="openType" value="PAGE" id="openType">新页面打开
         		</td>
       	    </c:if>        
        </table>
	        <div class="btn">
		      	<c:if test="${type=='modify' }">
		      		<input type="submit" value="提交" class="btn_cs"/>
		      		<input type="button" class="btn_cs ml10 notReadOnly" value="取消" onclick="cancel();"/>
		      	</c:if>
		      	<c:if test="${type=='add' }">
		      		<input type="submit" value="提交" class="btn_cs"/>
		      		<input type="button" class="btn_cs ml10 notReadOnly" value="取消" onclick="cancel();"/>
		      	</c:if>
				<c:if test="${type=='check' }">
				<input type="button" class="btn_cs ml10 notReadOnly" value="返回" onclick="cancel();"/>
		      	</c:if>      	
	      	</div>
	      	<!--上传图片弹出框-->
			<div id="showuUnload" style="display: none;">
					<div class='popup_bg' ></div>
						<div class='popup_con'>
						<div class='bd'>
							 <div class='prompt'>
							<div id='loading' style='display:none;'>上传中...</div>
									<div> 请选择文件：<input type='file' id='uploadFile' name="upFile" />
										<p class="prompt" id="picMsg"></p>
									</div>
									</div>
								<div class='button'  style="margin-left: 60px; border: 0px solid;">
									<a href='javascript:void(0)' class='btn01' id='uploadBtn'>上传</a>&nbsp;&nbsp;&nbsp;
									<a href='javascript:void(0)' class='btn01' onclick="cancel()">取消</a>
								</div>
							</div>
					 </div>
				</div>
        </form>
      </div>
       
    </div>
</div>
  </body>
  <script type="text/javascript">
  dmCheck.init("#publicForm");
  function cancel(){
  	  $.tbox.close();
    };
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    };
 	
 </script>
</html>
