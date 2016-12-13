<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>QK商城－收货地址</title>
<link rel="stylesheet" href="css/base.css">
<script src="js/jquery-min.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
function addAddress(){
	var receiver = $("input[name='receiver']").val();
	var address = $("input[name='address']").val(); 
	var phone = $("input[name='phone']").val();
	var data = {
			"receiver":receiver,
			"address":address,
			"phone":phone
			}
	alert(data.phone);
	
	$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath }/addAddress.action",
			data : data,
			timeout : 20000,
			error : function() {
				alert('error');
			},
			success:function(){
				alert("修改成功！");
			},

		});
	}
</script>
</head>
<body>
<input id="currentPath" value="<%=basePath%>" type="hidden">
	<div class="site-wrapper" id="user-center">
		<div class="head-container">
			<div class="head">
				<div class="top_head">
					<img src="images/home-icon.png" class="home-icon">
					<div class="top-msg">
						<a href="index.jsp">QK商城</a>
					</div>
					<div class="top-msg">您好，</div>
					<div class="top-msg">
						<c:if test="${ not empty sessionScope.user}">
							<a href="<%=basePath%>frontpage/user-center.jsp">${sessionScope.user["username"]}</a>
						</c:if>
					</div>
					<div class="top-msg">欢迎来到QK商城！</div>

					<c:if test="${ not empty sessionScope.user}">
						<a href="<%=basePath%>exit.action">[退出登录]</a>
					</c:if>

					<c:if test="${ empty sessionScope.user}">
						<div class="top-login-msg">
							<a href="<%=basePath%>frontpage/login.jsp">请登录</a>
						</div>

						<div class="top-login-msg">
							<a href="<%=basePath%>frontpage/register.jsp">注册</a>
						</div>
					</c:if>
					<div class="top-right">
						<div class="shopping-cart">
							<a href="<%=basePath%>frontpage/cart.jsp">购物车</a>
						</div>
						<div class="user-center">
							<a href="javascript:void(0);">我的中心 <img
								src="images/arrow-down-grey.png">
							</a>
							<div class="user-center-list">
								<a href="javascript:void(0);">我的中心<img
									src="images/arrow-up-grey.png"></a>
								<div class="dropdown">
									<ul>
										<li class="tit"><a href="<%=basePath%>frontpage/user-center.jsp">个人信息</a></li>
										<li><a href="<%=basePath%>frontpage/user-center-pw.jsp">修改密码</a></li>
										<li><a href="<%=basePath%>frontpage/user-center-addr.jsp">收货地址</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div>
							<a href="<%=basePath%>frontpage/order_list.jsp">我的订单</a>
						</div>
					</div>
				</div>
			</div>
			<div class="nav clearfix">
				<a href="<%=basePath%>frontpage/index.jsp"> <img src="images/logo.png"
					class="site-logo float-l">
				</a>
				<div id="search-box">
					<input id="search-mode" value="all" type="hidden">
					<div id="search-type">
						<ul>
							<li class="selected" data-value="all" data-ph="请输入您要的商品">全部</li>
							<li data-value="book" data-ph="请输入您要的书籍">书籍</li>
							<li data-value="cloth" data-ph="请输入您要的服饰">服饰</li>
							<li data-value="food" data-ph="请输入您要的食品">食品</li>
						</ul>
						<div class="search-form">
							<input type="text" name="inp-search" id="inp-search"
								placeholder="请输入您要的商品"> <input onclick="search2();"
								value="搜 索" type="button">
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="breadcrumbs">
			<div class="container">
				<a href='index.jsp'>首页</a><span class="sep">&gt;</span> <span>用户中心</span>
			</div>
		</div>
		<div class="content">
			<div class="container">
				<div class="left-box">
					<h3>个人中心</h3>
					<ul class="uc-nav-list">
						<li><a href="<%=basePath%>frontpage/user-center.jsp"
							class="active">个人信息</a></li>
						<li><a href="<%=basePath%>frontpage/user-center-pw.jsp">修改密码</a></li>
						<li><a href="<%=basePath%>frontpage/user-center-addr.jsp">收货地址</a></li>
					</ul>
				</div>
				<div class="right-box">
					<h1>
						收货地址<span>(点击可编辑)</span>
					</h1>
					<div class="field">
						<label>收件人:</label> <input type="text" name="receiver" placeholder="张三"
							value="${sessionScope.address['getname']}" style="margin-left: 18px;"></input>
					</div>
					<div class="field">
						<label>收件地址:</label> <input type="text" name="address" 
							value="${sessionScope.address['adress']}" placeholder="浙江省杭州市天目山路202号"></input>
					</div>
					<div class="field">
						<label>联系电话:</label> <input type="text" name="phone" 
							value="${sessionScope.address['getphone']}" placeholder="15867145676"></input>
					</div>
					<div class="field float-r">
						<a href="javascript:;" class="btn" onclick="return addAddress()">保存</a>
					</div>
				</div>
			</div>
		</div>


	</div>

	<div id="footer">
		<div class="footer-container">
			<p>轻课学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有&nbsp;&nbsp;&nbsp;&nbsp;</p>
		</div>
	</div>
</body>
</html>
