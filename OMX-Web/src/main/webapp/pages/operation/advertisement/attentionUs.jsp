<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
  <%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
  <title>关注我们</title>
  
  <!-- 系统用户显示模板 -->
	<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
{{each(i,user) users}}
      <tr>
        <td>{{= i+1}}</td>  
	    <td>{{= user.title}}</td>
		<td><img src ="/platform/ReadPic/pic/url?url={{= user.picUrl}}"></td>
		<td>
		   <a onclick="popDiv('<%=basePath %>advertisement/checkAttentionUs.do?id={{= user.id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="changeStatus orange">查看</a>
			<shiro:hasPermission name="YYGL_GG_GZWM_XG">
		   <a onclick="popDiv('<%=basePath %>advertisement/modifyAttentionUs.do?id={{= user.id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="changeStatus orange">修改</a>
			</shiro:hasPermission>
        </td>
     </tr>
{{/each}}
	</script>
    <script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  sysUserListLoad();//jquery 模板demo
        });
        var sysUserListLoad = function(){
        	//造的测试数据，实际应用时，将ajax返回的json数据替换这里的data即可
       	 var data = ${pageList.data.pageResult.list};
       	 $('#sysUserListTemplate').tmpl({users:data}).appendTo("#sysUserListGrid");
     };
    
    </script>
     
  </head>
  <body>
  <c:if test="${errMsg ne '' && errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
  </script>
  </c:if>
	<div class="systemUser">				
			<div class="r_main clearfix ">
				<div class="main_con">
				 <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" id="sysUserListGrid">
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>标题</td>
						    <td>图片</td>
							<td>操作</td>
						</tr>
				        </thead>
					<tbody></tbody>
				</table>
				</div>
				<!--分页-->
				<%-- <div style="margin-top: 25px;">
					<dim:page url="userList.do" formId="testPageForm" showPages="10"
						curPage="22" totalPages="50" />
				</div> --%>
				<!--分页  --END-->
			</div>
		</div>

 </body>
  <script type="text/javascript">
 
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    };
 </script>
</html>
