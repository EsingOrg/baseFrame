<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>提现审核确认</title>
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
      <div class="title"><a href="javascript:;" onClick="$.tbox.close()" class="out"></a>提现放款确认</div>
      <div class="cotent clearfix">
      <form action="<%=basePath %>finance/updateFinancevLoanPass.do" method="post" id="auditing">
         <div class="conn">
         	<input type="hidden" value="${usr.id }" name="id" />
         	<input type="hidden" value="${usr.status }" name="status"/>
         	<input type="hidden" value="${usr.userId }" name="userId"/>
             <p class="tl f16 mt10" style="text-align:center">您确认要放款通过吗？</p>
         </div> 
         <div class="btn"><a href="javascript:suaud();" class="btn_cs" >确定</a><a href="#" class="btn_hs ml20" onClick="$.tbox.close()">取消</a></div>
       </form>
      </div>     
    </div>
</div>
  </body>
</html>

