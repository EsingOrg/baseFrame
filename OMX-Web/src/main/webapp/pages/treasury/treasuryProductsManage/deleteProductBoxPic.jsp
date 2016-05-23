<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>删除图片</title>
   <script type="text/javascript">
  function suaud(){
	  document.getElementById('auditing').submit();
  }
  </script>
  </head>
  
  <body>
<div class="popup_bg"></div>
<div class="dialog">

  <div class="clearfix"> 
      <div class="title"><a href="javascript:;" onClick="$.tbox.close()" class="out"></a>删除图片</div>
      <div class="cotent clearfix">
      <form action="<%=basePath %>treasury/updateTheKingProduct.do?type=1" method="post" id="auditing">
         <div class="conn">
         	<input type="text" value="${id }" name="id" style="display: none"/>
             <p class="tl f16 mt10" style="text-align:center">您确认要删除该图片吗？</p>
         </div> 
         <div class="btn"><a href="javascript:suaud();" class="btn_cs" >确定</a><a href="#" class="btn_hs ml20" onClick="$.tbox.close()">取消</a></div>
       </form>
      </div>     
    </div>
</div>
  </body>
</html>

