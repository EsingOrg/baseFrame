<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>店铺信息查看</title>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
</head>
  <script type="text/javascript">
  
  //修改店铺联系人
  function updateLinkmanSubmit(){
	  if((obj = dmCheck.returnObj("#updateForm")))	return obj.focus();//校验输入数据格式是否正确
	  //发送修改请求
	  $.ajax({ 
	         type:"POST",
	         url:"<%=basePath %>shop/updateLinkman.do",
	         data:$("#updateForm").serialize(),
	         success:function(result){
	        	 $('#updateDialog').hide();
	         	if(result.flag.code == "000000"){
	         		dm.alert("修改成功！",{
            			title:"提示",				//弹窗的标提
            			okName:"确定",			//如同alert确定按钮的value
            			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
            			callback:function(){	//按确定后执行的函数
            				window.location.href="shopPerShowLinkman.do?key=${key}&isShow=${isShow}";
            			}
	         		});
	         	}else{
	         		dm.alert("操作失败！");
	         	}
	         }
	  });
  }
  //删除联系人
  function delLinkMan(id,shopId){
	  	dm.confirm("是否删除联系人？",{
			title:"确认",				//标题
			okName:"确定",			//如同confirm确定按钮的value
			cancleName:"取消",		//如同confirm取消按钮的value
			callback:function(){	//按确定的执行的函数
				//发送删除请求
				  $.ajax({ 
				         type:"POST",
				         url:"<%=basePath %>shop/delLinkman.do",
				         data:{"contactId":id,"shopId":shopId},
				         success:function(result){
				        	 $('#updateDialog').hide();
				         	if(result.flag.code == "000000"){
				         		dm.alert("删除成功！",{
			            			title:"提示",				//弹窗的标提
			            			okName:"确定",			//如同alert确定按钮的value
			            			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
			            			callback:function(){	//按确定后执行的函数
			            				window.location.href="shopPerShowLinkman.do?key=${key}&isShow=${isShow}";
			            			}
				         		});
				         	}else{
				         		dm.alert("操作失败！");
				         	}
				         }
				  });
			}
		});

  }
  //查看图片
  	function attachDialog(src){
		$("#attachDialog img").attr('src', src);
		$("#attachDialog").show();
	}
      
  </script>

<body>
  <!---------------右边内容开始--------------->
  <div class="r_main clearfix">
         
    <!--内容 -->
    <div class="main_con"> 
    
      <!--用户名-->
	  <div class="upper clearfix">                  
		<div class="per_li clearfix">
		  <div class="per_img"><img src="<%=basePath %>images/user_portrait.jpg"/></div>
		  <ul>
		    <li>用户名：<span title="${name}">${name}</span></li>
		    <li>可用余额：<fmt:formatNumber pattern="##,####,###,##0.00" value="${uaib.data.singleResult.availableAmount}"/>元</li>
		    <li>冻结金额：<fmt:formatNumber pattern="##,####,###,##0.00" value="${uaib.data.singleResult.frozenAmount}"/>元</li>
		    <li>充值总额：<fmt:formatNumber pattern="##,####,###,##0.00" value="${uaib.data.singleResult.rechargeAmount}"/>元</li>
			<li>提现总额：${uaib.data.singleResult.withdraw}元</li>
			<li>黄金总资产：<fmt:formatNumber pattern="##,####,###,##0.000" value="${uaib.data.singleResult.totalWeight}"/>克</li>
			<li>活金：<fmt:formatNumber pattern="##,####,###,##0.000" value="${uaib.data.singleResult.availableWeight}"/>克</li>
			<li>冻结活金：<fmt:formatNumber pattern="##,####,###,##0.000" value="${uaib.data.singleResult.frozenWeight}"/>克</li>
            <li>定期金：${uaib.data.singleResult.termWeight}克</li>
             <li>累计利息：<fmt:formatNumber pattern="##,####,###,##0.00" value="${uaib.data.singleResult.totalInterest}"/>元</li>
             <li>累计买金克重：<fmt:formatNumber pattern="##,####,###,##0.000" value="${uaib.data.singleResult.buyWeight}"/>克</li>
             <li>累计卖金克重：${uaib.data.singleResult.saleWeight}克</li>
            <li>累计存金克重：${uaib.data.singleResult.saveWeight}克</li>
            <li>累计提金克重：<fmt:formatNumber pattern="##,####,###,##0.000" value="${uaib.data.singleResult.takeWeight}"/>克</li>
          </ul>                
        </div>
      </div>
	  <!--用户名--END-->
	  
	  <!-- TAB头 -->
	  <div class="menubox clearfix">
		<ul>
		  <li id="one1" onclick="window.location.href='shopPerShow.do?key=${key}&isShow=${isShow}&name=${name }';" class="${tabIndex == '1' ? 'hover' : ''}">店铺信息</li>		  
		  <li id="one4" onclick="window.location.href='shopPerShowExclog.do?key=${key}&isShow=${isShow}&name=${name }';" class="${tabIndex == '6' ? 'hover' : ''}">店铺操作人</li>
		  <li id="one2" onclick="window.location.href='shopPerShowBuylog.do?key=${key}&isShow=${isShow}&name=${name }';" class="${tabIndex == '2' ? 'hover' : ''}">买金记录</li>
		  <li id="one3" onclick="window.location.href='shopPerShowSalelog.do?key=${key}&isShow=${isShow}&name=${name }';" class="${tabIndex == '3' ? 'hover' : ''}">卖金记录</li>
		  <li id="one4" onclick="window.location.href='shopPerShowKeeplog.do?key=${key}&isShow=${isShow}&name=${name }';" class="${tabIndex == '4' ? 'hover' : ''}">存金记录</li>
		  <li id="one4" onclick="window.location.href='shopPerShowDiplog.do?key=${key}&isShow=${isShow}&name=${name }';" class="${tabIndex == '5' ? 'hover' : ''}">提金记录</li>
		  
		</ul>
		<div class="clearfix">
		  <a href="javascript:void(0);" onclick="window.location.href='shopPerList.do';" class="btn_cs fr mr20">返回</a>
		  <a href="javascript:void(0);" onclick="window.location.href='shopPerShow.do?isEdit=true&key=${key}&name=${name}';" class="btn_cs fr mr20">修改</a>
		</div>
	  </div>
	  <!-- TAB--END -->
	  
	  <!-- TAB1 -->
	  <div class="part" id="con_one_1" style="display:${tabIndex == '1' ? '' : 'none'};">
	  
		<div class="pat_title clearfix">注册信息</div>
		<ul class="part_center clearfix">
		  <li><div class="til">店铺名称：</div><div class="info">${tempdata.data.singleResult.name }</div></li>
		  <c:if test="${tempdata.data.singleResult.flag == 'N'}">
			  <li><div class="til">营业执照登记注册号：</div><div class="info">${tempdata.data.singleResult.licenceNo}</div></li>
			  <li><div class="til">店铺纳税号：</div><div class="info">${tempdata.data.singleResult.taxNo}</div></li>
			  <li><div class="til">组织机构代码：</div><div class="info">${tempdata.data.singleResult.orgCode}</div></li>
		  </c:if>
		  <c:if test="${tempdata.data.singleResult.flag == 'Y'}">
		  	  <li><div class="til">社会信用代码：</div><div class="info">${tempdata.data.singleResult.creditCode}</div></li>
		  </c:if>
		  <li><div class="til">法人：</div><div class="info">${tempdata.data.singleResult.corporation}</div></li>
		  <li><div class="til">法人身份证：</div><div class="info">${tempdata.data.singleResult.corporationCardId}</div></li>   
		  <li><div class="til">手机号：</div><div class="info">${tempdata.data.singleResult.phone}</div></li>
		  <li><div class="til">邮箱：</div><div class="info">${tempdata.data.singleResult.email}</div></li>              
		</ul>  
		<div class="pat_title clearfix">基本信息</div>
		<ul class="part_center clearfix">
		  <li><div class="til">所在城市：</div><div class="info">${tempdata.data.singleResult.provinces}${tempdata.data.singleResult.city}</div></li>
		  <li><div class="til">店铺地址：</div><div class="info">${tempdata.data.singleResult.address}</div></li>
		  <li><div class="til">营业时间：</div><div class="info">${tempdata.data.singleResult.startTime}-${tempdata.data.singleResult.endTime}</div></li>
		  <li><div class="til">座机：</div><div class="info">${tempdata.data.singleResult.tel}</div></li>
		  <li><div class="til">加工费用说明：</div><div class="info">${tempdata.data.singleResult.desc}</div></li>
		  <li><div class="til">公司名称：</div><div class="info">${tempdata.data.singleResult.companyName}</div></li> 
		  <li><div class="til">备注：</div><div class="info">${tempdata.data.singleResult.remark}</div></li>             
		</ul>
		<div class="pat_title clearfix">联系人</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="main_table mb20">
       		<tr class="title">
                <td align="center">序号</td>
                <td align="center">店铺联系人</td>
                <td align="center">联系人电话</td>
                <td align="center">备注</td>                        
             </tr>
             <c:forEach items="${cotman.data.list}" var="user" varStatus="st">
             	<tr>
                    <td align="center">${st.count}</td>
                    <td align="center">${user.name }</td>
                    <td align="center">${user.phone }</td>
                    <td align="center">${user.remark }</td>
               </tr>
             </c:forEach>
           </table>  
	  	<div class="pat_title clearfix">店铺附件</div>
        <ul class="part_annex clearfix">
        	<c:if test="${tempdata.data.singleResult.flag == 'N'}">
		        <li><div>营业执照</div><div class="mt10">
			        <img src="/platform/ReadPic/pic/url?url=${tempdata.data.imgListResult.licencePic[0]}"  onclick="attachDialog(this.src)"/>
			        </div>
		        </li>
		        <li><div>税务登记证</div><div class="mt10">
			        <img src="/platform/ReadPic/pic/url?url=${tempdata.data.imgListResult.taxPic[0]}" onclick="attachDialog(this.src)" />
			        </div>
		        </li>
		        <li><div>组织机构代码证</div><div class="mt10">
			        <img src="/platform/ReadPic/pic/url?url=${tempdata.data.imgListResult.orgPic[0]}"  onclick="attachDialog(this.src)"/>
			        </div>
		        </li>
	        </c:if>
	        <c:if test="${tempdata.data.singleResult.flag == 'Y'}">
	        	<li><div>社会信用证</div><div class="mt10">
			        <img src="/platform/ReadPic/pic/url?url=${tempdata.data.imgListResult.creditPic[0]}"  onclick="attachDialog(this.src)"/>
			        </div>
		        </li>
	        </c:if>
	        <li><div>身份证正面</div><div class="mt10">
	        <img src="/platform/ReadPic/pic/url?url=${tempdata.data.imgListResult.frontPic[0]}"  onclick="attachDialog(this.src)"/>
	        </div></li> 
	        <li><div>身份证反面</div><div class="mt10">
	        <img src="/platform/ReadPic/pic/url?url=${tempdata.data.imgListResult.backPic[0]}"  onclick="attachDialog(this.src)"/>
	        </div></li> 
	    </ul>
          
      </div>
      <!-- TAB1--END -->
      <form action="${tabIndex == '2' ? 'shopPerShowBuylog.do' : tabIndex == '3' ? 'shopPerShowSalelog.do' : tabIndex == '4' ? 'shopPerShowKeeplog.do' : tabIndex == '5' ? 'shopPerShowDiplog.do' : 'shopPerShowExclog.do'}" method="post" id="dataForm">
       <input type="hidden" name="key" value="${key }"/>
      <input type="hidden" name="name" value="${name }"/>
      <!-- TAB2 -->   
	  <div class="part" id="con_one_2" style="display:${tabIndex == '2' ? '' : 'none'};">    
		<div>
		  <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
			<tr class="title">
			  <td>序号</td>
              <td>订单号</td>
			  <td>买金克重（克）</td>
			  <td>成交金价（元/克）</td>
			  <td>成交额（元）</td>
			  <td>交易时间</td>                                  
			</tr>
			<c:forEach items="${pageList.data.pageResult.list}" var="buy" varStatus="st">
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
	  <div class="part" id="con_one_3" style="display:${tabIndex == '3' ? '' : 'none'};">   
        <div>
          
          <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
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
          	<c:forEach items="${pageList.data.pageResult.list}" var="buy" varStatus="st">
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
	  <div class="part" id="con_one_4" style="display:${tabIndex == '4' ? '' : 'none'};">   
        <div>
          <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
            <tr class="title">
              <td>序号</td>
              <td>订单号</td>
			  <td>存金克重（克）</td>
			  <td>发货方式</td>
			  <td>物流方</td>
			  <td>物流号</td>
			  <td>预约时间</td>
			  <td>平台实收净重（克）</td>
			  <td>检测克重（克）</td>
			  <td>提交时间</td>
			  <td>最后操作时间</td>
			  <td>状态</td>                            
            </tr>
          	<c:forEach items="${pageList.data.pageResult.list}" var="keep" varStatus="st">
	    		<tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
	    			<td>${st.count}</td>
	    			<td>${keep.orderNo }</td>
	    			<td>${keep.bookWeight }</td>
	    			
	    			<td>${keep.logisticTypeName }</td>
	    			<td>${keep.logisticCompany }</td>
	    			<td>${keep.logisticNo }</td>
	    			
	    			<td>${keep.bookTime }</td>
	    			<td>${keep.sysNetWeight }</td>
	    			<td>${keep.sysCheckWeight }</td>
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
	  <div class="part" id="con_one_5" style="display:${tabIndex == '5' ? '' : 'none'};">   
        <div>
          <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
            <tr class="title">
              <td>序号</td>
              <td>订单号</td>
			  <td>提金克重（克）</td>
			  <td>提交时间</td>
			  <td>扣除存源（克）</td>
			  <td>扣除买源（克）</td>
			  <td>手续费（元）</td>
			  <td>剩余存源（克）</td>
			  <td>剩余买源（克）</td>      
			  <td>最后操作时间</td> 
			  <td>状态</td>                       
            </tr>
          	<c:forEach items="${pageList.data.pageResult.list}" var="dip" varStatus="st">
	    		<tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
	    			<td>${st.count}</td>
	    			<td>${dip.orderNo }</td>
	    			<td>${dip.bookWeight }</td>
	    			<td>${dip.createTime }</td>
	    			<td>${dip.minusSave }</td>
	    			<td>${dip.minusBuy }</td>
	    			<td>${dip.fee }</td>
	    			<td>${dip.remainSave }</td>
	    			<td>${dip.remainBuy }</td>
	    			<td>${dip.updateTime }</td>
	    			<td>${dip.statusName }</td>
	    		</tr>
	    	</c:forEach>            
          </table>  
        </div>
      </div>
      <!-- TAB5--END -->
      
      <!-- TAB6 -->
	  <div class="part" id="con_one_6" style="display:${tabIndex == '6' ? '' : 'none'};">   
        <div>
          
          <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
            <tr class="title">
                    <td align="center">序号</td>
                    <td align="center">用户名</td>
                    <td align="center">姓名</td>
                    <td align="center">权限</td>
                    <td align="center">状态</td>                         
            </tr>
          	<c:forEach items="${pageList.data.pageResult.list}" var="exc" varStatus="st">
	    		<tr <c:if test="${st.count%2 eq 0 }">class="grey"</c:if>>
	    			<td>${st.count}</td>
	    			<td>${exc.loginName }</td>
	    			<td>${exc.name }</td>
	    			<td>${exc.roles }</td>
	    			<td>
	    				<c:if test="${exc.status == 'N'}">
	    					启用
	    				</c:if>
	    				<c:if test="${exc.status == 'Y'}">
	    					停用
	    				</c:if>
	    			</td>
	    		</tr>
	    	</c:forEach>         
          </table> 
        </div>  
      </div>
      <!-- TAB6--END -->
      
	<!--内容  --END-->
	<div style="margin-top: 25px;display:${tabIndex == '1' ? 'none' :  ''};" id="pageId">
			<dim:page url="" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
						curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
		</div>
       </form>   
  </div>
  <!---------------右边内容结束--------------->

   </div>
   
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

 
</body>
</html>