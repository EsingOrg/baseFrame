<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>提现审核确认</title>
<script type="text/javascript">
dmCheck.init("#auditing");
  function suaud(){
	  if((obj = dmCheck.returnObj("#auditing")))	return;
	  document.getElementById('auditing').submit();
  }
  </script>
  </head>
  <body>
	
<div class="popup_bg"></div>
<div class="dialog">
  <div class="clearfix">
      <div class="title"><a href="javascript:;" onClick="$.tbox.close()" class="out"></a>提现放款不通过</div>
      <div class="cotent">
      <form action="<%=basePath %>finance/updateFinancevLoanPass.do" method="post" id="auditing">
      	<input type="hidden" value="${usr.id }" name="id" />
         	<input type="hidden" value="${usr.status }" name="status"/>
         	<input type="hidden" value="${usr.userId }" name="userId"/>
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table"> 
          <tr>            
            <td ><textarea name="remark" cols="63" rows="3" class="border" validate="q|leng" leng="1,100"></textarea></td>
          </tr>
        </table>
      </form>
      </div>
      <div class="btn"><a href="javascript:suaud();" class="btn_cs">确认</a><a href="#" class="btn_hs ml20" onclick="$.tbox.close()">取消</a></div> 
    </div>
</div>	
  </body>
</html>

