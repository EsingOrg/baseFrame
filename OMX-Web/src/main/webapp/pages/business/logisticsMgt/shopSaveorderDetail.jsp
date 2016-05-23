<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
  <title>平台已收货-店铺存金订单详情</title>
</head>
<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
		<!--内容 -->
        <div class="main_title">订单详情</div>
		<div class="main_con">
        	<div class="initialorder clearfix orderDet" id="INIT_NODE">
        	 <script id="INIT_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">初始订单</div>
                <ul class="init_con clearfix">
                  <li>订单号：{{= orderNo}}&nbsp</li>
                  <li>用户名：{{= userName}}&nbsp</li>
				  <li>店铺名：{{= shopName}}&nbsp</li>
				  <li>存金克重：{{= orderWeight}}&nbsp</li>
                  <li>毛重：{{= grossWeight}}&nbsp</li>
                  <li>包数：{{= packageCount}}&nbsp</li>
                  <li>提交时间：{{= handleTime}}&nbsp</li>
				  <li>发货方式：{{= logisticType}}&nbsp</li>
				  {{if logisticType!='SELF_TO'}}
                    <li>委托人：{{= consigner}&nbsp}</li>
					<li>委托人身份证号：{{= consignerIdCard}}&nbsp</li>
                    <li>委托人手机号：{{= consignerPhone}}&nbsp</li>
                    <li>预约时间：{{= bookTime}}&nbsp</li>
                  {{/if}}
				 {{if logisticType!='POST'}}
                    <li>物流方：{{= logisticTypeName}}&nbsp</li>
					<li>物流号：{{= logisticId}}&nbsp</li>
                  {{/if}}
				<li>状态：{{= statusName}}&nbsp</li>
                </ul>
			 </script>
            </div>

            <div class="initialorder clearfix orderDet" id="SYS_RECEIVE_NODE">
             <script id="SYS_RECEIVE_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">平台收货</div>
                <ul class="init_con clearfix">
                  <li>平台实收净重：{{= sysNetWeight}}</li>
                  <li>备注：{{= remark}}</li>
                  <li>收货人：{{= receiveBy}}</li>
                  <li>收货时间：{{= receiveTime}}</li>
				  <li>状态：{{= statusName}}</li>
                </ul>
               </script>
            </div>
            <div class="initialorder clearfix orderDet" id="SYS_CHECK_NODE">
             <script id="SYS_CHECK_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">平台检测</div>
                <ul class="init_con clearfix">
				  <li>检测克重：{{= sysCheckWeight}}</li>
				  <li>成色：{{= sysCheckQuality}}</li>
                  <li>备注：{{= remark}}</li>
                  <li>检测人：{{= handler}}</li>
                  <li>检测时间：{{= handleTime}}</li>
				  <li>状态：{{= statusName}}</li>
                </ul>
			 </script>
            </div>
             <div class="initialorder clearfix orderDet" id="SHOP_CONFIRM_NODE">
             <script id="SHOP_CONFIRM_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">店铺确认</div>
                <ul class="init_con clearfix">
                  <li>操作人：{{= handler}}</li>
                  <li>确认时间：{{= handleTime}}</li>
				  <li>状态：{{= statusName}}</li>
                </ul>
			 </script>
            </div>
          <div class="btn mt30 mb30" id="back"><a href="${url}?&t=<%=Math.random() %>" class="btn_cs">返回</a></div>
		  <div class="btn mt30 mb30" id="close" style="display:none;"><a href="javascript:$.tbox.close();" class="btn_cs">关闭</a></div>
		</div>  
		<!--内容  --END-->
          
</div>
<!---------------右边内容结束--------------->
</body>
<c:if test="${showonly ne null}">
<script type="text/javascript">
$("#back").css("display","none");
$("#close").css("display","block");
</script>
</c:if>
<script type="text/javascript">
        //页面加载时调用
        $(function(){
        	//获取数据集
        	var data = ${detail.singleResult};
        	$.each(data,function(i,n){
              //显示环节
              $('#'+n.node+'_TEMP').tmpl(n).appendTo('#'+n.node);
              $('#'+n.node).css('display','block');
              if(data.length-1==i){
            	 $('ul:last').append("<li>状态："+n.statusName+"</li>");
              }
        	});
        });
</script>
</html>
