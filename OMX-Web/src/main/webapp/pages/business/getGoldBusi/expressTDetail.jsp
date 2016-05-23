<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<head>
  <title>提金业务--快递到家--订单详情</title>
  <link rel="stylesheet" type="text/css" href="<%=basePath%>css/common.css"/>
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
				  <li>用户名：{{= userName}}</li>
				  <li>姓名：{{= userFullName}}</li>
<li>提金克重：{{= takeWeight}} 克</li>
<li>制品：{{= productName}}</li>
<li>数量：{{= productCount}} 件</li>
<li>扣除存源：{{= minusSave}} 克</li>
<li>扣除买源：{{= minusBuy}} 克</li>
<li>加工费：{{= fee}} 元</li>
<li>剩余存源：{{= remainSave}} 克</li>
<li>剩余买源：{{= remainBuy}} 克</li>
<li>邮保费：{{= postFee}} 元</li>
<li>收货地址：{{= addr}} </li>
				  <li>提交时间：{{= createTime}}</li>
                </ul>
			 </script>
		</div>
		<div class="initialorder clearfix orderDet" id="SYS_SEND_NODE">
              <script id="SYS_SEND_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">平台发货</div>
                <ul class="init_con clearfix">
<li>实发净重：{{= netWeight}} 克</li>
<li>毛重：{{= grossWeight}} 克</li>
<li>包数：{{= packageCount}} 包</li>
                  <li>物流方：{{= logisticCompany}}</li>
		          <li>物流编号：{{= logisticNo}}</li>
		          <li>备注：{{= remark}}</li>
				  <li>发货人：{{= sendBy}}</li>
		          <li>发货时间：{{= sendTime}}</li>
                </ul>
			  </script>
         </div>	
         <div class="initialorder clearfix orderDet" id="PERSONAL_RECEIVE_NODE">
              <script id="PERSONAL_RECEIVE_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">用户收货</div>
                <ul class="init_con clearfix">
                  <li>收货人：{{= receiveBy}}</li>
                  <li>收货时间：{{= receiveTime}}</li>
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