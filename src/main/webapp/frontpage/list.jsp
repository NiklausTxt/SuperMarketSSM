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
<title>QK商城－商品列表</title>
<link rel="stylesheet" href="<%=basePath %>css/base.css">
<script src="<%=basePath %>js/jquery-min.js"></script>
<script src="<%=basePath %>js/main.js"></script>
<script src="<%=basePath %>js/goods.js"></script>
</head>
<body>
	<input id="currentPath" value="<%=basePath%>" type="hidden">
	<div class="site-wrapper" id="list-page">
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
				<a href='index.jsp'>首页</a><span class="sep">&gt;</span> <span>商品列表</span>
			</div>
		</div>
		<div class="content">
			<div class="container">
				<div class="goods-list-box">
					<div class="goods-list clearfix">
						<c:forEach items="${sessionScope.goodsList2 }" var="list">

							<div class="goods-item">
								<div class="figure figure-img">
									<a href="detail.jsp"> <img src="${list.url }"
										width="200" height="200" alt="" />
									</a>
								</div>
								<p class="desc">${list.description }</p>
								<h2 class="title">
									<a href="detail.jsp">${list.name }</a>
								</h2>
								<p class="price">${list.price }元</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div id="J_renovateWrap" class="xm-recommend-container"></div>
		</div>
	</div>


	<div id="footer">
		<div class="footer-container">
			<p>轻课学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有&nbsp;&nbsp;&nbsp;&nbsp;</p>
		</div>
	</div>

</body>
</html>