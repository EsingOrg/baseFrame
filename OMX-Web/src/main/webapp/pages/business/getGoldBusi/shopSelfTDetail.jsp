<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<head>
  <title>店铺自提--订单详情</title>
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
		         <li>身份证：{{= idCard}}</li>
		         <li>联系电话：{{= userPhone}}</li>
		         <li>预约时间：{{= bookTime}}</li>
		         <li>预约码：{{= bookCode}}</li>
		         <li>提金克重：{{= bookWeight}}</li>
		         <li>店铺名：{{= shopName}}</li>
		         <li>所在区域：{{= shopArea}}</li>
		         <li>营业时间：{{= businessTime}}</li>
		         <li>扣除存源：{{= minusSave}}</li>
		         <li>扣除买源：{{= minusBuy}}</li>
		         <li>剩余存源：{{= remainSave}}</li>
		         <li>剩余买源：{{= remainBuy}}</li>
		         <li>提交时间：{{= createTime}}</li> 
		        </ul>
			 </script>
            </div>
            <div class="initialorder clearfix orderDet" id="SHOP_PROCESS_NODE">
            <script id="SHOP_PROCESS_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">店铺处理</div>
                <ul class="init_con clearfix">
                  <li>实提克重：{{= takeWeight}}</li>
		          <li>扣除买源：{{= minusBuy}}</li>
		          <li>扣除存源：{{= minusSave}}</li>
		          <li>剩余买源：{{= remainBuy}}</li>
		          <li>剩余存源：{{= remainSave}}</li>
		          <li>手续费：{{= fee}}</li>
		          <li>备注：{{= remark}}</li>
		          <li>处理人：{{= handler}}</li>
		          <li>处理时间：{{= handleTime}}</li>
              </ul>
             </script>
            </div>
            
            <div class="initialorder clearfix orderDet" id="PERSONAL_CONFIRM_NODE">
              <script id="PERSONAL_CONFIRM_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">个人确认</div>
                <ul class="init_con clearfix">
                  <li>确认时间：{{= handleTime}}</li>
                </ul>
			  </script>
            </div>
            
			<div class="initialorder clearfix orderDet" id="SYS_SEND_NODE">
              <script id="SYS_SEND_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">平台发货</div>
                <ul class="init_con clearfix">
					{{if logisticType=='POST'}}
                    <li><label >发货方式：物流发货</label></li>
                    <li><label >物流方：{{= logisticCompany}}</label></li>
                    <li><label >物流号：{{= logisticNo}}</label></li>
                    {{/if}}
					{{if logisticType =='SELF_FROM'}}
					<li><label >发货方式：{{= logisticTypeName}}</label></li>
					{{/if}}
		          <li>备注：{{= remark}}</li>
				  <li>发货人：{{= sendBy}}</li>
		          <li>发货时间：{{= sendTime}}</li>
                </ul>
			  </script>
            </div>	
            
            <div class="initialorder clearfix orderDet" id="SHOP_RECEIVE_NODE">
              <script id="SHOP_RECEIVE_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">店铺收货</div>
                <ul class="init_con clearfix">
                  <li>备注：{{= remark}}</li>
		          <li>收货人：{{= handler}}</li>
		          <li>收货时间：{{= handleTime}}</li>
                </ul>
			  </script>
            </div>
            
             <div class="initialorder clearfix orderDet" id="SYS_PROCESS_NODE">
              <script id="SYS_PROCESS_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">平台处理</div>
                <ul class="init_con clearfix">
                  <li>处理人：{{= handler}}</li>
                  <li>处理时间：{{= handleTime}}</li>
                </ul>
			  </script>
            </div>
            
            <div class="initialorder clearfix orderDet" id="PRESONAL_CANCEL_NODE">
              <script id="PRESONAL_CANCEL_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">个人取消</div>
                <ul class="init_con clearfix">
                  <li>取消时间：{{= updateTime}}</li>
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