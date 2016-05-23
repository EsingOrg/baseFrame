<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
  <title>个人存金--订单详情</title>
</head>
<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
         
		<!--内容 -->
        <div class="main_title">订单详情</div>
		<div class="main_con">

			<c:forEach items="${pageList.data.list}" var="order" varStatus="st">
				<c:if test="${order.node == 'INIT_NODE'}">
					<div class="initialorder clearfix">
						<div class="init_title">初始订单 </div>
		                <ul class="init_con clearfix">
		                  <li>订单号：${order.orderNo }</li>
		                  <li>用户名：${order.userName }</li>
		                  <li>姓名：${order.userFullName }</li>
		                  <li>身份证：${order.idCard }</li>
		                  <li>联系电话：${order.userPhone }</li>
		                  <li>黄金凭证：
		                  	<c:if test="${order.certFlag =='Y'}">
		                  		有(<a href="javascript:void(0);" onclick="alertPicture('${order.certPicId}');" class="orange">查看</a>)
		                  	</c:if>
		                  	<c:if test="${order.certFlag =='N'}">
		                  		没有
		                  	</c:if>
		                  </li>
		                  <li>预约时间：${order.bookTime }</li>
		                  <li>预约码：${order.bookCode }</li>
		                  <li>店铺名：${order.shopName }</li>
		                  <li>换金克重：${order.bookWeight }</li>
		                  <li>黄金来源：${order.sourceName}</li>
		                  <li>店铺名称：${order.shopFullName}</li>
		                  <li>所在区域：${order.shopArea }</li>
		                  <li>营业时间：${order.businessTime }</li>
		                  <li>提交时间：${order.createTime }</li> 
		                  <c:if test="${st.last}">
		                  		<li>状态：${order.statusName }</li> 
		                  </c:if>
		                </ul>
	                </div>
				</c:if>
				<c:if test="${order.node == 'SHOP_PROCESS_NODE'}">
					<div class="initialorder clearfix">
						<div class="init_title">店铺处理</div>
		                <ul class="init_con clearfix">
		                  <li>店测克重：${order.shopCheckWeight }</li>
		                  <li>成色：${order.shopCheckQuality }</li>
		                  <li>店换克重：${order.shopChangeWeight }</li>
		                  <li>手续费：${order.fee }</li>
		                  <li>处理人：${order.handler }</li>
		                  <li>处理时间：${order.handleTime }</li>
		                  <li>备注：${order.remark }</li>
		                  <c:if test="${st.last}">
		                  		<li>状态：${order.statusName }</li> 
		                  </c:if>
		                </ul>
	                </div>
				</c:if>
				<c:if test="${order.node == 'SYS_SEND_NODE'}">
					<div class="initialorder clearfix">
						<div class="init_title">平台发货</div>
		                <ul class="init_con clearfix">
		                  <li>物流方：${order.logisticCompany }</li>
		                  <li>物流编号：${order.logisticNo }</li>
		                  <li>备注：${order.remark }</li>
		                  <li>发货人：${order.handler }</li>
		                  <li>发货时间：${order.handleTime }</li>
		                  <c:if test="${st.last}">
		                  		<li>状态：${order.statusName }</li> 
		                  </c:if>
		                </ul>
	                </div>
				</c:if>
				
				<c:if test="${order.node == 'SYS_PROCESS_NODE'}">
					<div class="initialorder clearfix">
						<div class="init_title">平台处理</div>
		                <ul class="init_con clearfix">
		                  <li>处理人：${order.handler }</li>
		                  <li>处理时间：${order.handleTime }</li>
		                  <c:if test="${st.last}">
		                  		<li>状态：${order.statusName }</li> 
		                  </c:if>
		                </ul>
	                </div>
				</c:if>
				<c:if test="${order.node == 'SHOP_RECEIVE_NODE'}">
					<div class="initialorder clearfix">
						<div class="init_title">店铺收货</div>
		                <ul class="init_con clearfix">
		                  <li>备注：${order.remark }</li>
		                  <li>发货人：${order.handler }</li>
		                  <li>发货时间：${order.handleTime }</li>
		                  <c:if test="${st.last}">
		                  		<li>状态：${order.statusName }</li> 
		                  </c:if>
		                </ul>
	                </div>
				</c:if>
				<c:if test="${order.node == 'PERSONAL_CONFIRM_NODE'}">
					<div class="initialorder clearfix">
						<div class="init_title">个人确认</div>
		                <ul class="init_con clearfix">
		                  <li>确认时间：${order.handleTime }</li>
		                  <c:if test="${st.last}">
		                  		<li>状态：${order.statusName }</li> 
		                  </c:if>
		                </ul>
	                </div>
				</c:if>                      
				<c:if test="${order.node == 'PERSONAL_CANCEL_NODE'}">
					<div class="initialorder clearfix">
						<div class="init_title">个人取消</div>
		                <ul class="init_con clearfix">
		                  <li>取消时间：${order.handleTime }</li>
		                  <c:if test="${st.last}">
		                  		<li>状态：${order.statusName }</li> 
		                  </c:if>
		                </ul>
	                </div>
				</c:if>                      
				<c:if test="${order.node == 'PERSONAL_RECEIVE_NODE'}">
					<div class="initialorder clearfix">
						<div class="init_title">用户收货</div>
		                <ul class="init_con clearfix">
		                  <li>收货人：${order.handler }</li>
		                  <li>收货时间：${order.handleTime }</li>
		                  <c:if test="${st.last}">
		                  		<li>状态：${order.statusName }</li> 
		                  </c:if>
		                </ul>
	                </div>
				</c:if>
				<c:if test="${order.node == 'SYS_CANCEL_NODE'}">
					<div class="initialorder clearfix">
						<div class="init_title">平台作废</div>
		                <ul class="init_con clearfix">
		                  <li>作废时间：${order.handleTime }</li>
		                  <c:if test="${st.last}">
		                  		<li>状态：${order.statusName }</li> 
		                  </c:if>
		                </ul>
	                </div>
				</c:if>
			</c:forEach>
          <div class="btn mt30 mb30"><a href="personSwopGold.do?tabIndex=${tabIndex }" class="btn_cs">返回</a></div>
                       
		</div>  
                       
           
        
		<!--内容  --END-->
	<!--查看图片弹出框--START-->
	<div id="addDialog" style="display: none">
		<div class="popup_bg"></div>
		<div class="dialog">
		  <div class="clearfix">
		      <div class="title"><a href="#" class="out" onclick="$('#addDialog').hide();"></a>查看</div>
		      <div class="cotent">
		         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table"> 
		          <tr>            
		            <td align="center"><img src=""  id="pic" class="see_img02" /></td>
		          </tr>
		        </table>
		      </div>
		      <div class="btn"><a href="javascript:$('#addDialog').hide();" class="btn_cs">确认</a></div> 
		    </div>
		</div>
	</div>	
   <!--查看图片弹出框--END-->       
</div>
<!---------------右边内容结束--------------->
<script>
	$(function(){
		$(".init_con li").each(function(e){
    		var hh=$(this).height();
    		if(hh>40){
    			$(this).css({width:"100%"});
    		}
    		
    	});
	});
</script>
</body>
</html>
