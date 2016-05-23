<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>店铺审核信息查看</title>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
</head>
<body>
  <!---------------右边内容开始--------------->
    <div class="r_main clearfix">
         
		<!--内容 -->
        <div class="main_title">查看</div>
		<div class="main_con clearfix"> 
            <div class="border_b clearfix">   
            	<ul class="see_info clearfix" >
                <li>
                    <div class="til">店铺名称：</div>
                    <div class="info">${data.data.singleResult.name } </div>
                </li>
                <li>
                    <div class="til">&nbsp;</div>
                    <div class="info">&nbsp;</div>
                </li>
                <c:if test="${data.data.singleResult.flag == 'N' }">
	                <li>
	                    <div class="til">营业执照登记注册号：</div>
	                    <div class="info">${data.data.singleResult.licenceNo } </div>
	                </li>  
	                <li>
	                    <div class="til">税务登记证号：</div>
	                    <div class="info">${data.data.singleResult.taxNo }  </div>
	                </li> 
	                <li>
	                    <div class="til">组织机构代码：</div>
	                    <div class="info">${data.data.singleResult.orgCode }  </div>
	                </li> 
                </c:if>
                <c:if test="${data.data.singleResult.flag == 'Y' }">
                	<li>
	                    <div class="til">社会信用代码：</div>
	                    <div class="info">${data.data.singleResult.creditCode  }  </div>
	                </li> 
                </c:if>
                <li>
                    <div class="til">法人：</div>
                    <div class="info">${data.data.singleResult.corporation } </div>
                </li> 
                <li>
                    <div class="til">手机：</div>
                    <div class="info">${data.data.singleResult.corporatePhone } </div>
                </li>  
                <li>
                    <div class="til">联系人：</div>
                    <div class="info">${data.data.singleResult.contact } </div>
                </li>  
                <li>
                  <div class="til">联系方式：</div>
                    <div class="info">${data.data.singleResult.contactPhone } </div>
                </li>  
                <li>
                    <div class="til">所在城市：</div>
                    <div class="info">${data.data.singleResult.provinces }${data.data.singleResult.city }  </div>
                </li> 
                <c:if test="${data.data.singleResult.flag == 'N' }">
	                <li>
	                    <div class="til">营业执照：</div>
	                    <div class="info">
	                    <c:forEach items="${data.data.imgListResult.licencePic}" var="pic" varStatus="st">
				        <img src="/platform/ReadPic/pic/url?url=${pic}"  onclick="attachDialog(this.src)"/>
				        </c:forEach>
	                    </div>
	                </li> 
	                <li>
	                    <div class="til">税务登记证：</div>
	                    <div class="info">
	                    <c:forEach items="${data.data.imgListResult.taxPic}" var="pic" varStatus="st">
				        <img src="/platform/ReadPic/pic/url?url=${pic}"  onclick="attachDialog(this.src)"/>
				        </c:forEach>
	                    </div>
	                </li> 
	                <li>
	                    <div class="til">组织机构代码证：</div>
	                    <div class="info">
	                    <c:forEach items="${data.data.imgListResult.orgPic}" var="pic" varStatus="st">
				        <img src="/platform/ReadPic/pic/url?url=${pic}"  onclick="attachDialog(this.src)"/>
				        </c:forEach>
	                    </div>
	                </li> 
                </c:if>
                <c:if test="${data.data.singleResult.flag == 'Y' }">
                	<li>
	                    <div class="til">社会信用证：</div>
	                    <div class="info">
	                    <c:forEach items="${data.data.imgListResult.creditPic}" var="pic" varStatus="st">
				        <img src="/platform/ReadPic/pic/url?url=${pic}"  onclick="attachDialog(this.src)"/>
				        </c:forEach>
	                    </div>
	                </li>
                </c:if>
                <li>
                    <div class="til">身份证号正面：</div>
                    <div class="info">
                    <c:forEach items="${data.data.imgListResult.frontPic}" var="pic" varStatus="st">
			        <img src="/platform/ReadPic/pic/url?url=${pic}"  onclick="attachDialog(this.src)"/>
			        </c:forEach>
                    </div>
                </li> 
                <li>
                    <div class="til">身份证反面：</div>
                    <div class="info">
                    <c:forEach items="${data.data.imgListResult.backPic}" var="pic" varStatus="st">
			        <img src="/platform/ReadPic/pic/url?url=${pic}"  onclick="attachDialog(this.src)"/>
			        </c:forEach>
                   </div>
                </li>                                  
            </ul>            
            </div> 
            <div class="border_b clearfix">   
            	<ul class="see_info clearfix" >
	                <li>
	                    <div class="til">处理结果：</div>
	                    <div class="info">${data.data.singleResult.remark } </div>
	                </li>
	                <li>
	                    <div class="til">状态：</div>
	                    <div class="info">${data.data.singleResult.statusCN } </div>
	                </li>
	                <li>
	                    <div class="til">处理人：</div>
	                    <div class="info">${data.data.singleResult.handlerName } </div>
	                </li>
	                <li>
	                    <div class="til">处理时间：</div>
	                    <div class="info">${data.data.singleResult.handleTime } </div>
	                </li>
            	</ul>
            </div>
	        <div class="btn"><a href="javascript:void(0);" onclick="window.location.href='auditList.do?type=${type}'" class="btn_cs ml20">返回</a></div>
		</div>          
        
		<!--内容  --END-->
		
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
          
	</div>
<!---------------右边内容结束--------------->
<script>
//查看图片大图
function attachDialog(src){
	$("#attachDialog img").attr('src', src);
	$("#attachDialog").show();
}
</script>
</body>
</html>