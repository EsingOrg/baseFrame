<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>个人信息</title>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
</head>
<body>

  <!---------------列表内容开始--------------->
  <div class="r_main clearfix">
  
    <!-- 搜索表框  -->
    <form id="dataForm" action="emailList.do" method="post">
    	<div class="main_con">
          <div class="admin_input clearfix">
          	  <p>标题： 
			  	<input type="text" name="title" class="yhgl_input"  maxlength="40" value="${ms.title }"/>
	          </p>
	          <p>时间： 
			  		<input type="text" name="startTime" class="yhgl_input date" id="createTime1" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'createTime2\')}'})" value="${ms.startTime}"/>
				<span class="mr5">至</span>
				<input type="text" name="endTime" class="yhgl_input date" id="createTime2" onclick="WdatePicker({minDate: '#F{$dp.$D(\'createTime1\')}'})" value="${ms.endTime}"/>
	         
	          </p>
	          <p>发送人： 
			  	<input type="text" name="sender" class="yhgl_input" value="${ms.sender}" maxlength="40"/>
	          </p>
	          
	          <p class="lo_btn"> 
	            <input name="input" type="submit" class="search" value="搜索" />
	            <shiro:hasPermission name="YYGL_XXGL_YJ_XZ"> 
	   		    <a href="javascript:void(0);" class="btn_cs ml10" onclick="openPoup('','no')"><i class="newly"></i>新增</a>
	   		    </shiro:hasPermission>
			  </p>
		  </div>
       </div>
        
    <!-- 搜索表框END -->  
         
    <!-- 列表框  --> 
	<div class="main_con">
		<div class="">
		  <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
			<tr class="title">
			  <td>序号</td>
			  <td>标题</td> 
			  <td>内容</td> 
			  <td>数量</td> 
			  <td>发送人</td> 
			  <td>发送时间</td> 
			  <td>操作</td>                
			</tr>
			<c:forEach items="${pageList.data.pageResult.list}" var="email" varStatus="st">
		    <tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
		      <td>${st.count}</td>
		      <td>${email.title}</td>
		      <td>${email.content}</td>
		      <td>${email.count}</td>
	    	  <td>${email.realName}</td>
	    	  <td>${email.createTime}</td>
	    	  <td>
	    		<a class="orange" href="javascript:void(0);" onclick="openPoup(${email.id},'yes')">查看</a>
	    		<shiro:hasPermission name="YYGL_XXGL_YJ_ZCBJFS">
	    		<a class="orange" href="javascript:void(0);" onclick="openPoupM(${email.id},'no')">再次编辑发送</a>
	    		</shiro:hasPermission>
	    	  </td>
		    </tr>
		    </c:forEach>
		  </table>
		</div>             
	  <!-- 分页 -->    

	  	<div class='paging'style="margin-top: 25px;">
			<dim:page url="emailList.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
				curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
		</div>
      <!-- 分页END -->           
    </div>
    <!-- 列表框END  --> 
    </form> 
  </div>
  
  <!---------------列表内容结束--------------->
  <c:if test="${errMsg ne '' && errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
  </script>
  </c:if>
  
 <script type="text/javascript">
 function openPoup(id, flag){
	   $.tbox.popup("toEditEmail.do?isEdit=" + flag + "&id=" + id + "&t=" + Math.random());
};
function openPoupM(id, flag){
	   $.tbox.popup("toEditEmail.do?isEdit=" + flag + "&m=m&id=" + id + "&t=" + Math.random());
};
 </script>
</body>
</html>