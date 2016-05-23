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
         
    <!-- 列表框  --> 
	<div class="main_con">
		<div class="menubox clearfix">
		<ul>
		  <li id="one1" class="hover">收益详情</li>
		</ul>
		<div class="clearfix">
		  <a href="javascript:void(0);" onclick="window.location.href='useDetailList.do';" class="btn_cs fr mr20">返回</a>
		</div>
	  </div> 
	  <form action="showDetail.do" id="dataForm">
	  	<input type="hidden" name="experienceId" value="${detail.experienceId }"/>
	  <div class="part" id="con_one_1">   
        <div>
          
          <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
            <tr class="title">
			  <td>序号</td>
			  <td>买金克重（克）</td>
			  <td>当天金价（元/克）</td>
			  <td>价值（元）</td>
			  <td>当天利率</td>
			  <td>天息</td>
			  <td>发放状态</td>
			  <td>发放时间</td>                                 
			</tr>
          	<c:forEach items="${pageList.data.pageResult.list}" var="buy" varStatus="st">
	    		<tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
	    			<td>${st.count}</td>
	    			<td>${buy.weight }</td>
	    			<td>${buy.price }</td>
	    			<td>${buy.amount }</td>
	    			<td>${buy.rate }</td>
	    			<td>${buy.dayAmount }</td>
	    			<td>
	    				<c:if test="${buy.giveFlag == 'Y'}">
	    					已发
	    				</c:if>
	    				<c:if test="${buy.giveFlag == 'N'}">
	    					未发
	    				</c:if>
	    			</td>
	    			<td>${buy.giveTime }</td>
	    		</tr>
	    	</c:forEach>          
          </table> 
          	<div class='paging' style="margin-top: 25px;">
				<dim:page url="showDetail.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
					curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
			</div>
        </div>  
      </div> 
      </form>       
    </div>
    <!-- 列表框END  --> 
    
  </div>
  <!---------------列表内容结束--------------->
  
  
</body>
</html>