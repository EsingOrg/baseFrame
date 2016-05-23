<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>个人换存--订单详情</title>
  <script type="text/javascript" src="<%=basePath %>js/common/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
  <script type="text/javascript" src="<%=basePath %>js/common/common.js?s=2015"></script>
  <script type="text/javascript" src="<%=basePath %>js/common/mybox.js"></script>
  <link rel="stylesheet" type="text/css" href="<%=basePath %>css/common.css"/>
  <link rel="stylesheet" type="text/css" href="<%=basePath %>css/mybox.css"/>
  <script>
   var basePath=footerPath="<%=basePath %>";
  </script>
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
			      <li>身份证号：{{= idCard}}</li>
				  <li>联系电话：{{= userPhone}}</li>
			  	  <li>黄金凭证：{{= certFlagName}}&nbsp&nbsp&nbsp&nbsp&nbsp
                       {{if certFlag == 'Y'}}
							<a href="javascript:void(0);" onclick="alertPicture('{{= certPicId}}');" class="orange">查看</a>
					   {{/if}}
                  <li>预约时间：{{= bookTime}}</li>
                  <li>预约码：{{= bookCode}}</li>
                  <li>店铺名称：{{= shopFullName}}</li>
                  <li>换金克重：{{= bookWeight}} </li>
                  <li>黄金来源：{{= sourceName}}</li>
                  <li>提交时间：{{= createTime}}</li>
                  <li>店铺名：{{= shopName}}</li>
                </ul>
			 </script>
            </div>
		 
            <div class="initialorder clearfix orderDet" id="SHOP_PROCESS_NODE">
            <script id="SHOP_PROCESS_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">店铺处理</div>
                <ul class="init_con clearfix">
                  <li>店测克重：{{= shopCheckWeight}} 克</li>
                  <li>成色：{{= shopCheckQuality}}</li>
				  <li>店换克重：{{= shopChangeWeight}} 克</li>
      			  <li>手续费：{{= fee}} 元</li>
                  <li>备注：{{= remark}}</li>
                  <li>处理人：{{= handler}}</li>
                  <li>处理时间：{{= handleTime}} </li>
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
            <div class="initialorder clearfix orderDet" id="SHOP_SEND_NODE">
              <script id="SHOP_SEND_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">店铺发货</div>
                <ul class="init_con clearfix">
                  {{if logisticType=='POST'}}
					<li>发货方式：物流</li>
                    <li>物流方：{{= logisticCompany}}</li>
                    <li>物流编号：{{= logisticNo}}</li>
                  {{/if}}
				  {{if logisticType=='SELF_TO'}}
					<li>发货方式：店铺送货到平台</li>
                    <li>委托人：{{= consigner}}</li>
   					<li>预约时间：{{= shopBookTime}}</li>
                    <li>联系方式：{{= consignerPhone}}</li>
                    <li>委托人身份证号：{{= consignerIdCard}}</li>
                  {{/if}}
                  <li>备注：{{= remark}}</li>
                  <li>发货人：{{= sendBy}}</li>
                  <li>发货时间：{{= sendTime}}</li>
                </ul>
			  </script>
            </div>
            <div class="initialorder clearfix orderDet" id="SYS_RECEIVE_NODE">
             <script id="SYS_RECEIVE_NODE_TEMP" type="text/x-jquery-tmpl">
                <div class="init_title">平台收货</div>
                <ul class="init_con clearfix">
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
                  <li>备注：{{= remark}}</li>
                  <li>检测人：{{= handler}}</li>
                  <li>检测时间：{{= handleTime}}</li>
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
