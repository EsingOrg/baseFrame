<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看</title>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
</head>

<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
         
		<!--内容 -->
        <div class="main_title">查看</div>
		<div class="main_con">
            <ul class="view clearfix" >
            	<li>
                    <div class="til">店铺名：</div>
                    <div class="infl">${jData.data1 }</div>
                    <div class="til">店铺名称：</div>
                    <div class="infl">${jData.data2 }</div>
                    <div class="til">物流方：</div>
                    <div class="infl">${jData.data3 }</div>
                    <div class="til">物流号：</div>
                    <div class="infl">${jData.data4 }</div>
                </li>  
                <li>
                    <div class="til">订单克重：</div>
                    <div class="infl">${jData.data5 }</span></div>
                    <div class="til">实发净重：</div>
                    <div class="infr">${jData.data6 }克</div> 
                    <div class="til">毛重：</div>
                    <div class="infr">${jData.data7 }克</div>  
                    <div class="til">包数：</div>
                    <div class="infr">${jData.data8 }包</div>                 
                </li>
                
                 <li>
                    <div class="til">发货人：</div>
                    <div class="infl">${jData.data9 }</div>
                    <div class="til">发货时间：</div>
                    <div class="infl">${jData.data10 }</div>
                    <div class="til">发货方式：</div>
                    <div class="infl">${jData.data11 }克</div>
                    <div class="til">备注：</div>
                    <div class="infl">${jData.data12 }</div>
                </li>
                <li style="color:red; ">
                    <div class="til">发货方式：</div>
                    <div class="infl">${jData.data13 }</div>
                    <div class="til">委托人：</div>
                    <div class="infl">${jData.data14 }</div>
                    <div class="til">委托人手机号：</div>
                    <div class="infl">${jData.data15 }</div>
                    <div class="til">委托人身份证：</div>
                    <div class="infl">${jData.data16 }</div>
                </li>
                <li style="color:red; ">
                    <div class="til">预约时间：</div>
                    <div class="infl">${jData.data17 }</div>
                </li>
                <li>
                    <div class="til">平台实收净重：</div>
                    <div class="infl">${jData.data18 }</div>
                    <div class="til">备注：</div>
                    <div class="infl">${jData.data19 }</div>
                    <div class="til">收货人：</div>
                    <div class="infl">${jData.data20 }克</div>
                    <div class="til">收货时间：</div>
                    <div class="infl">${jData.data21 }</div>
                </li> 
                <li>
                    <div class="til">检测克重：</div>
                    <div class="infl">${jData.data22 }</div>
                    <div class="til">成色：</div>
                    <div class="infl">${jData.data23 }</div>
                    <div class="til">备注：</div>
                    <div class="infl">${jData.data24 }克</div>
                    <div class="til">检测人：</div>
                    <div class="infl">${jData.data25 }</div>
                </li>
                <li>
                    <div class="til">检测时间：</div>
                    <div class="infl">${jData.data26 }</div>
                    <div class="til">状态：</div>
                    <div class="infl">${jData.data27 }</div>
                </li> 
                <li>
                    <div class="til">状态：</div>
                    <div class="infl">${jData.data28 }</div>
                </li>                               
            </ul>
            <div class="btn mt30 mb30"><a href="deliveryGoodsList.do?type=1" class="btn_cs ml20">返回</a></div>
        </div>
 
        <!-- 搜索框 -->
			<form action="personSaveGold.do" method="post"
				id="searchBox">
				<input type="hidden" name="key" value="${key }">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							订单号： <input type="text" name="orderNo" class="yhgl_input"
								value="${req.orderNo}" maxlength="23" />
						</p>
					    <p>
							手机号： <input type="text" name="userPhone" class="yhgl_input"
								value="${req.userPhone}" maxlength="20" />
						</p>
						<p>
							姓名： <input type="text" name="userName" class="yhgl_input"
								value="${req.userName}" maxlength="20" />
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="查询" /> 
							<input name="input" type="button" class="export ml10" value="导出" />
						</p>
					</div>
				</div>
			</form>
			<!--搜索表框  --END-->
        <div class="main_con">
        <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
              <tr class="title">
                <td align="center">序号</td> 
                <td align="center">订单号</td> 
                <td align="center">用户名</td> 
                <td align="center">姓名</td> 
                <td align="center">手机号</td> 
                <td align="center">订单类型</td>
                <td align="center">存金克重（克）</td> 
                <td align="center">状态</td> 
                <td align="center">操作</td>              
              </tr>
              <c:forEach items="${lData.data.pageResult.list}" var="p1" varStatus="st">
				<tr>
					<td align="center">${st.count}</td>
					<td align="center">${p1.word1 }</td>
					<td align="center">${p1.word2 }</td>
					<td align="center">${p1.word3 }</td>
					<td align="center">${p1.word4 }</td>
					<td align="center">${p1.word5 }</td>
					<td align="center">${p1.word6 }</td>
					<td align="center">${p1.word7 }</td>
					<td align="center">
						<a class="orange" href="javascript:void(0);" onclick="window.location.href='personOrderDetail.do?key=${key }&orderid=${p1.id };'">订单详情</a>
					</td>
				</tr>
			 </c:forEach>          
            </table>
        </div>

		<!--内容  --END-->
          
</div>
<!---------------右边内容结束--------------->
</body>
</html>
