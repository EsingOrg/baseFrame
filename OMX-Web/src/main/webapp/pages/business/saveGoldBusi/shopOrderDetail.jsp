<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
  <title>店铺存金--订单详情</title>
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
                  <li>订单号：{{= orderNo}}</li>
                  <li>用户名：{{= shopName}}</li>
                  <li>店铺名称：{{= shopFullName}}</li>
                  <li>存金克重：{{= bookWeight}} 克</li>
				  <li>毛重：{{= grossWeight}} 克</li>
                  <li>包数：{{= packageCount}} 包</li>
                  <li>提交时间：{{= createTime}}</li>
				  {{if logisticType=='POST'}}
                    <li><label style="color:red">发货方式：物流发货</label></li>
                    <li><label style="color:red">物流方：{{= logisticCompany}}</label></li>
                    <li><label style="color:red">物流号：{{= logisticNo}}</label></li>
                  {{/if}}
				  {{if logisticType=='SELF_TO'}}
                    <li><label style="color:blue">发货方式：店铺送货到平台</label></li>
                    <li><label style="color:blue">委托人：{{= consigner}}</label></li>
                    <li><label style="color:blue">委托人身份证号：{{= consignerIdCard}}</label></li>
                    <li><label style="color:blue">委托人手机号：{{= consignerPhone}}</label></li>
                    <li><label style="color:blue">预约时间：{{= bookTime}}</label></li> 
                  {{/if}}
                </ul>
			 </script>
            </div>
		 
            <div class="initialorder clearfix orderDet" id="SYS_RECEIVE_NODE">
             <script id="SYS_RECEIVE_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">平台收货</div>
                <ul class="init_con clearfix">
                  <li>平台实收净重：{{= sysNetWeight}} 克</li>
                  <li>备注：{{= remark}}</li>
                  <li>收货人：{{= receiveBy}}</li>
                  <li>收货时间：{{= receiveTime}}</li>
                </ul>
               </script>
            </div>
            
            <div class="initialorder clearfix orderDet" id="SYS_CHECK_NODE">
             <script id="SYS_CHECK_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">平台检测</div>
                <ul class="init_con clearfix">
				  <li>检测克重：{{= sysCheckWeight}} 克</li>
                  <li>成色：{{= sysCheckQuality}}</li>
                  <li>备注：{{= remark}}</li>
                  <li>检测人：{{= handler}}</li>
                  <li>检测时间：{{= handleTime}}</li>
                </ul>
			 </script>
            </div>
            
            <div class="initialorder clearfix orderDet" id="SHOP_CONFIRM_NODE">
             <script id="SHOP_CONFIRM_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">店铺确认</div>
                <ul class="init_con clearfix">
                  <li>确认人：{{= handler}}</li>
                  <li>确认时间：{{= handleTime}}</li>
                </ul>
			 </script>
            </div>
            <div class="initialorder clearfix orderDet" id="SHOP_CANCEL_NODE">
             <script id="SHOP_CANCEL_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">店铺取消</div>
                <ul class="init_con clearfix">
                  <li>取消时间：{{= handleTime}}</li>
                </ul>
			 </script>
            </div>
            
            <div class="initialorder clearfix orderDet" id="SYS_CANCEL_NODE">
              <script id="SYS_CANCEL_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">平台作废</div>
                <ul class="init_con clearfix">
                  <li>处理人：{{= handler}}</li>
                  <li>处理时间：{{= handleTime}}</li>
                </ul>
			  </script>
          </div>
          <div class="btn mt30 mb30" id="back"><a href="${url}?&tabIndex=${tabIndex}&t=<%=Math.random() %>" class="btn_cs">返回</a></div>
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
        	var data = ${detail.list};
        	$.each(data,function(i,n){
        		//显示环节
              $('#'+n.node+'_TEMP').tmpl(n).appendTo('#'+n.node);
              $('#'+n.node).css('display','block');
              if(data.length-1==i){
            	 $('ul:last').append("<li>状态："+n.statusName+"</li>");
              }
        	});
        	$(".init_con li").each(function(e){
        		var hh=$(this).height();
        		if(hh>40){
        			$(this).css({width:"100%"});
        		}
        		
        	});
        });
</script>
</html>
