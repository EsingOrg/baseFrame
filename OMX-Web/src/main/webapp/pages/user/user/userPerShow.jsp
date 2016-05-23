<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人信息查看</title>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
</head>
<body>
	<!---------------右边内容开始--------------->
	<div class="r_main clearfix">

		<!--内容 -->
		<div class="main_con">

			<!--用户名-->
			<div class="upper clearfix">
				<div class="per_li clearfix">
					<div class="per_img">
						<img src="<%=basePath%>images/user_portrait.jpg" />
					</div>
					<ul>
						<li>用户名：<span title="${name}">${name}</span></li>
						<li>可用余额：<fmt:formatNumber pattern="##,####,###,##0.00"
								value="${uaib.data.singleResult.availableAmount}" />元
						</li>
						<li>冻结金额：<fmt:formatNumber pattern="##,####,###,##0.00"
								value="${uaib.data.singleResult.frozenAmount}" />元
						</li>
						<li>充值总额：<fmt:formatNumber pattern="##,####,###,##0.00"
								value="${uaib.data.singleResult.rechargeAmount}" />元
						</li>
						<li>提现总额：${uaib.data.singleResult.withdraw}元</li>
						<li>黄金总资产：<fmt:formatNumber pattern="##,####,###,##0.000"
								value="${uaib.data.singleResult.totalWeight}" />克
						</li>
						<li>活金：<fmt:formatNumber pattern="##,####,###,##0.000"
								value="${uaib.data.singleResult.availableWeight}" />克
						</li>
						<li>冻结活金：<fmt:formatNumber pattern="##,####,###,##0.000"
								value="${uaib.data.singleResult.frozenWeight}" />克
						</li>
						<li>定期金：${uaib.data.singleResult.termWeight}克</li>
						<li>累计利息：<fmt:formatNumber pattern="##,####,###,##0.00"
								value="${uaib.data.singleResult.totalInterest}" />元
						</li>
						<li>累计买金克重：<fmt:formatNumber pattern="##,####,###,##0.000"
								value="${uaib.data.singleResult.buyWeight}" />克
						</li>
						<li>累计卖金克重：${uaib.data.singleResult.saleWeight}克</li>
						<li>累计存金克重：${uaib.data.singleResult.saveWeight}克</li>
						<li>累计提金克重：<fmt:formatNumber pattern="##,####,###,##0.000"
								value="${uaib.data.singleResult.takeWeight}" />克
						</li>
						<li>累计换金克重：<fmt:formatNumber pattern="##,####,###,##0.000"
								value="${uaib.data.singleResult.changeWeight}" />克
						</li>
					</ul>
				</div>
			</div>
			<!--用户名--END-->

			<!-- TAB头 -->
			<div class="menubox clearfix">
				<ul>
					<li id="one1"
						onclick="window.location.href='userPerShow.do?key=${key}&name=${name }';"
						class="${tabIndex == '1' ? 'hover' : ''}">个人信息</li>
					<li id="one2"
						onclick="window.location.href='userPerShowBuylog.do?key=${key}&name=${name }';"
						class="${tabIndex == '2' ? 'hover' : ''}">买金记录</li>
					<li id="one3"
						onclick="window.location.href='userPerShowSalelog.do?key=${key}&name=${name }';"
						class="${tabIndex == '3' ? 'hover' : ''}">卖金记录</li>
					<li id="one4"
						onclick="window.location.href='userPerShowKeeplog.do?key=${key}&name=${name }';"
						class="${tabIndex == '4' ? 'hover' : ''}">存金记录</li>
					<li id="one4"
						onclick="window.location.href='userPerShowDiplog.do?key=${key}&name=${name }';"
						class="${tabIndex == '5' ? 'hover' : ''}">提金记录</li>
					<li id="one4"
						onclick="window.location.href='userPerShowExclog.do?key=${key}&name=${name }';"
						class="${tabIndex == '6' ? 'hover' : ''}">换金记录</li>
				</ul>

				<a href="javascript:void(0);"
					onclick="window.location.href='userPerList.do';"
					class="btn_cs fr mr20">返回</a> <a href="javascript:void(0);"
					onclick="window.location.href='userPerShow.do?isEdit=true&key=${key}&name=${name}';"
					class="btn_cs fr mr20">修改</a>

			</div>
			<!-- TAB--END -->

			<!-- TAB1 -->
			<div class="part" id="con_one_1"
				style="display:${tabIndex == '1' ? '' : 'none'};">

				<div class="pat_title clearfix">注册信息</div>
				<ul class="part_center clearfix">
					<li><div class="til">姓名：</div>
						<div class="info">${u.data.singleResult.userFullName}</div></li>
					<li><div class="til">性别：</div>
						<div class="info">${u.data.singleResult.gender}</div></li>
					<li><div class="til">身份证号：</div>
						<div class="info">${u.data.singleResult.idcard}</div></li>
					<li><div class="til">出生日期：</div>
						<div class="info">${u.data.singleResult.birthday}</div></li>
					<li><div class="til">手机号码：</div>
						<div class="info">${u.data.singleResult.userPhone}</div></li>
					<li><div class="til">邮箱地址：</div>
						<div class="info">${u.data.singleResult.email}</div></li>
				</ul>
			</div>
			<!-- TAB1--END -->
			<form
				action="${tabIndex == '2' ? 'userPerShowBuylog.do' : tabIndex == '3' ? 'userPerShowSalelog.do' : tabIndex == '4' ? 'userPerShowKeeplog.do' : tabIndex == '5' ? 'userPerShowDiplog.do' : 'userPerShowExclog.do'}"
				method="post" id="dataForm">
				<input type="hidden" name="key" value="${key }" /> <input
					type="hidden" name="name" value="${name }" />
				<!-- TAB2 -->
				<div class="part" id="con_one_2"
					style="display:${tabIndex == '2' ? '' : 'none'};">
					<div>
						<table width="100%" border="0" cellspacing="0" cellpadding="3"
							class="main_table tc">
							<tr class="title">
								<td>序号</td>
								<td>订单号</td>
								<td>买金克重（克）</td>
								<td>成交金价（元/克）</td>
								<td>成交额（元）</td>
								<td>交易时间</td>
							</tr>
							<c:forEach items="${pageList.data.pageResult.list}" var="buy"
								varStatus="st">
								<tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
									<td>${st.count}</td>
									<td>${buy.orderNo }</td>
									<td>${buy.weight }</td>
									<td>${buy.dealPrice }</td>
									<td>${buy.amount }</td>
									<td>${buy.createTime }</td>
								</tr>
							</c:forEach>
						</table>

					</div>
					<!--分页-->
				</div>
				<!-- TAB2--END -->
				<!-- TAB3 -->
				<div class="part" id="con_one_3"
					style="display:${tabIndex == '3' ? '' : 'none'};">
					<div>

						<table width="100%" border="0" cellspacing="0" cellpadding="3"
							class="main_table tc">
							<tr class="title">
								<td>序号</td>
								<td>订单号</td>
								<td>卖金克重（克）</td>
								<td>成交金价（元/克）</td>
								<td>成交额（元）</td>
								<td>扣除买源（克）</td>
								<td>扣除存源（克）</td>
								<td>剩余买源（克）</td>
								<td>剩余存源（克）</td>
								<td>手续费（元）</td>
								<td>交易时间</td>
							</tr>
							<c:forEach items="${pageList.data.pageResult.list}" var="buy"
								varStatus="st">
								<tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
									<td>${st.count}</td>
									<td>${buy.orderNo }</td>
									<td>${buy.weight }</td>
									<td>${buy.dealPrice }</td>
									<td>${buy.amount }</td>
									<td>${buy.minusBuy }</td>
									<td>${buy.minusSave }</td>
									<td>${buy.remainBuy }</td>
									<td>${buy.remainSave }</td>
									<td>${buy.fee }</td>
									<td>${buy.createTime }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- TAB3--END -->

				<!-- TAB4 -->
				<div class="part" id="con_one_4"
					style="display:${tabIndex == '4' ? '' : 'none'};">
					<div>
						<table width="100%" border="0" cellspacing="0" cellpadding="3"
							class="main_table tc">
							<tr class="title">
								<td>序号</td>
								<td>订单号</td>
								<td>店铺名</td>
								<td>存金克重（克）</td>
								<td>预约时间</td>
								<td>预约码</td>
								<td>店测克重（克）</td>
								<td>提交时间</td>
								<td>最后操作时间</td>
								<td>状态</td>
							</tr>
							<c:forEach items="${pageList.data.pageResult.list}" var="keep"
								varStatus="st">
								<tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
									<td>${st.count}</td>
									<td>${keep.orderNo }</td>
									<td>${keep.shopName }</td>
									<td>${keep.bookWeight }</td>
									<td>${keep.bookTime }</td>
									<td>${keep.bookCode }</td>
									<td>${keep.shopCheckWeight }</td>
									<td>${keep.createTime }</td>
									<td>${keep.updateTime }</td>
									<td>${keep.statusName }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- TAB4--END -->

				<!-- TAB5 -->
				<div class="part" id="con_one_5"
					style="display:${tabIndex == '5' ? '' : 'none'};">
					<div class="pat_title clearfix">快递到家</div>
					<c:if test="${tabIndex == '5'}">
							<div>
								<table width="100%" border="0" cellspacing="0" cellpadding="3"
									class="main_table tc">
									<tr class="title">
										<td>序号</td>
										<td>订单号</td>
										<td>提金克重（克）</td>
										<td>提交时间</td>
										<td>扣除存源（克）</td>
										<td>扣除买源（克）</td>
										<td>邮保费（元）</td>
										<td>加工费（元）</td>
										<td>剩余存源（克）</td>
										<td>剩余买源（克）</td>
										<td>最后操作时间</td>
										<td>状态</td>
									</tr>
									<tbody id="todayGrid">
									</tbody>
								</table>
								<div id="pageTag1"></div>
							</div>
					</c:if>
					<div class="pat_title clearfix">店铺自提</div>
					<c:if test="${tabIndex == '5'}">
							<div>
								<table width="100%" border="0" cellspacing="0" cellpadding="3"
									class="main_table tc">
									<tr class="title">
										<td>序号</td>
										<td>订单号</td>
										<td>店铺名</td>
										<td>提金克重（克）</td>
										<td>预约时间</td>
										<td>预约码</td>
										<td>实提克重（克）</td>
										<td>扣除存源（克）</td>
										<td>扣除买源（克）</td>
										<td>手续费（元）</td>
										<td>剩余存源（克）</td>
										<td>剩余买源（克）</td>
										<td>提交时间</td>
										<td>最后操作时间</td>
										<td>状态</td>
									</tr>
									<tbody id="allGird">
									</tbody>
								</table>
								<div id="pageTag2"></div>
							</div>
					</c:if>
				</div>
				<!-- TAB5--END -->

				<!-- TAB6 -->
				<div class="part" id="con_one_6"
					style="display:${tabIndex == '6' ? '' : 'none'};">
					<div>

						<table width="100%" border="0" cellspacing="0" cellpadding="3"
							class="main_table tc">
							<tr class="title">
								<td>序号</td>
								<td>订单号</td>
								<td>店铺名</td>
								<td>换金克重（克）</td>
								<td>预约时间</td>
								<td>预约码</td>
								<td>店测克重（克）</td>
								<td>店换克重（克）</td>
								<td>手续费（元）</td>
								<td>提交时间</td>
								<td>最后操作时间</td>
								<td>状态</td>
							</tr>
							<c:forEach items="${pageList.data.pageResult.list}" var="exc"
								varStatus="st">
								<tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
									<td>${st.count}</td>
									<td>${exc.orderNo }</td>
									<td>${exc.shopName }</td>
									<td>${exc.weight }</td>
									<td>${exc.bookTime }</td>
									<td>${exc.bookCode }</td>
									<td>${exc.shopCheckWeight }</td>
									<td>${exc.shopChangeWeight }</td>
									<td>${exc.fee }</td>
									<td>${exc.createTime }</td>
									<td>${exc.updateTime }</td>
									<td>${exc.statusName }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- TAB6--END -->
				<div
					style="margin-top: 25px;display:${tabIndex == '1' ? 'none' :  tabIndex == '5' ? 'none' : ''};"
					id="pageId">
					<dim:page url=""
						totalCount="${pageList.data.pageResult.recordCount }"
						formId="dataForm"
						showPages="${pageList.data.pageResult.pageSize }"
						curPage="${pageList.data.pageResult.pageIndex }"
						totalPages="${pageList.data.pageResult.pageTotal }" />
				</div>
			</form>
		</div>
		<!--内容  --END-->

	</div>
	<!---------------右边内容结束--------------->

	<div id="attachDialog" style="display: none">
		<div class="dia_img">
			<a href="javascript:void(0);" class="out"
				onclick="$('#attachDialog').hide();"><i class="d_error"></i></a> <img
				src="" />
		</div>
	</div>
	<!-- 快递到家查询form -->
	<form action="" id="takeRecordSelf">
	<input type="hidden" name="key" value="${key }" /> 
	<input type="hidden" name="name" value="${name }" />
	</form>
	<!-- 快递到家列表数据 -->
	<script id="todayData" type="text/x-jquery-tmpl">
{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1}}</td>
        <td>{{= orderNo }}</td>
	    <td>{{= takeWeight}}</td>
	    <td>{{= createTime}}</td>
	    <td>{{= minusSave}}</td>
	    <td>{{= minusBuy}}</td>
	    <td>{{= postFee}}</td>
	    <td>{{= processFee}}</td>
	    <td>{{= remainSave}}</td>
	    <td>{{= remainBuy}}</td>
	    <td>{{= updateTime}}</td>
	    <td>{{= statusName}}</td>
      </tr>
 {{/each}}
</script>
	<!-- 快递到家列表数据 -->
	<!-- 店铺自提列表数据 -->
	<script id="allData" type="text/x-jquery-tmpl">
	{{each(index,keep) list}}
		<tr {{if index %2 == 0}}class="grey" {{/if}}>
			<td>{{= index+1}}</td>
			<td>{{= keep.orderNo}}</td>
	    	<td>{{= keep.shopName}}</td>
	    	<td>{{= keep.bookWeight}}</td>
	    	<td>{{= keep.bookTime}}</td>
	    	<td>{{= keep.bookCode}}</td>
	    	<td>{{= keep.takeWeight}}</td>
	    	<td>{{= keep.minusSave}}</td>
	    	<td>{{= keep.minusBuy}}</td>
	    	<td>{{= keep.fee}}</td>
	    	<td>{{= keep.remainSave}}</td>
	    	<td>{{= keep.remainBuy}}</td>
	    	<td>{{= keep.createTime}}</td>
	    	<td>{{= keep.updateTime}}</td>
	    	<td>{{= keep.statusName}}</td>
		</tr>
	{{/each}}
		
</script>
	<!-- 店铺自提列表数据 -->
	<script type="text/javascript">
  //查看图片
  	function attachDialog(src){
		$("#attachDialog img").attr('src', src);
		$("#attachDialog").show();
	}
  	//查询快递到家数据
  	function getTakeDataPost(){
  		$.ajax({ 
            type : "POST", 
            url : "<%=basePath%>user/postToHome.do", 
            data : {"key":'${key}'}, 
            success : function(data) {
            	postToHome(data);
            }
  		});
  	}
  	//查询店铺自提数据
  	function getTakeDataSelf(){
  		$.ajax({ 
            type : "POST", 
            url : "<%=basePath%>user/shopTakeSelf.do", 
            data : {"key":'${key}'}, 
            success : function(data) {
            	shopTakeSelf(data);
            }
  		});
  	}
  
  	$(function(){
  		var tabIndex =${tabIndex};
  		if(tabIndex == '5'){
  			getTakeDataPost();
  			getTakeDataSelf();
  		}
  	});
  	//将快递到家数据放入table中
  	function postToHome(data){
  	//清空表格数据
 		$("#todayGrid").empty();
 		//填充数据
 		$('#todayData').tmpl(data.pageResult).appendTo("#todayGrid");
 		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag1","formId":"takeRecordSelf","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"<%=basePath%>user/postToHome.do",toPageCallBack:postToHome});
  	}
  //将店铺自提数据放入table中
  	function shopTakeSelf(data){
  	  	//清空表格数据
  	 		$("#allGird").empty();
  	 		//填充数据
  	 		$('#allData').tmpl(data.pageResult).appendTo("#allGird");
  	 	//初始化分页标签
  			DMGold.PageTags.init({"divId":"pageTag2","formId":"takeRecordSelf","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
  				          "pageCount":data.pageResult.pageTotal,"url":"<%=basePath%>user/shopTakeSelf.do","toPageCallBack" : shopTakeSelf
			});
		}
	</script>

</body>
</html>