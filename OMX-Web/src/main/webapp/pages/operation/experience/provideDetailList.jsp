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
    <form id="dataForm" action="provideDetailList.do" method="post">
    	<div class="main_con" id="dataForm">
          <div class="admin_input clearfix">
          	  <p>用户名： 
			  	<input type="text" name="userName" class="yhgl_input" value="${fue.userName }" maxlength="40"/>
	          </p>
	          <p>状态： 
	          <dim:select name="state" enumType="ExperienceStatus" headName="全部" headValue="" exclude="" cssClass="yhgl_sel"></dim:select>
	          </p>
	          <p>发放时间： 
			  		<input type="text" name="gsTime" class="yhgl_input date" id="gsTime" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'geTime\')}'})" value="${fue.gsTime }"/>
				<span class="mr5">至</span>
				<input type="text" name="geTime" class="yhgl_input date" id="geTime" onclick="WdatePicker({minDate: '#F{$dp.$D(\'gsTime\')}'})" value="${fue.geTime }"/>
	          </p>
	          <p>到期时间： 
			  		<input type="text" name="esTime" class="yhgl_input date" id="esTime" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'eeTime\')}'})" value="${fue.esTime }"/>
				<span class="mr5">至</span>
				<input type="text" name="eeTime" class="yhgl_input date" id="eeTime" onclick="WdatePicker({minDate: '#F{$dp.$D(\'esTime\')}'})" value="${fue.eeTime }"/>
	          </p>
	          <p>体验金来源：
	          <dim:select name="source" enumType="ExperienceSource" headName="全部" headValue="" exclude="" cssClass="yhgl_sel"></dim:select> 
	          </p>
	          <p class="lo_btn"> 
	            <input name="input" type="submit" class="search" value="搜索" />
	            <shiro:hasPermission name="YYGL_TYJ_FFMX_DC">
	   		    <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportProvideDetail.do');"/>
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
			  <td>用户名</td> 
			  <td>体验金金额（元）</td> 
			  <td>体验金来源</td> 
			  <td>状态</td>      
			  <td>收益期（天）</td>     
			  <td>发放时间</td>     
			  <td>到期时间</td>         
			</tr>
			<c:forEach items="${pageList.data.pageResult.list}" var="user" varStatus="st">
		    <tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
		      <td>${st.count}</td>
		      <td>${user.userName}</td>
		      <td>${user.amount}</td>
	    	  <td>${user.source}</td>
	    	  <td>${user.status}</td>
	    	  <td>${user.incomeDay}</td>
	    	  <td>${user.startTime}</td>
	    	  <td>${user.endTime}</td>
		    </tr>
		    </c:forEach>
		  </table>
		</div>             
	  <!-- 分页 -->    
	  <div class='paging'style="margin-top: 25px;">
			<dim:page url="provideDetailList.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
				curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
		</div>
      <!-- 分页END -->           
    </div>
    <!-- 列表框END  --> 
     </form>
  </div>
  <!---------------列表内容结束--------------->
  
  
</body>
</html>