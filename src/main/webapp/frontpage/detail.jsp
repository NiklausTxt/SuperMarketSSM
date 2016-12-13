<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>QK商城-商品详情</title>
<link rel="stylesheet" href="css/base.css">
<script src="js/jquery-min.js"></script>
<script src="js/main.js"></script>   
</head>
<body>

<div class="site-wrapper" id="detail-page">
    <div class="head-container">
    <div class="head">
        <div class="top_head">
            <img src="images/home-icon.png" class="home-icon">
            <div class="top-msg"><a href="index.jsp">QK商城</a></div>
            <div class="top-msg">您好，</div>
					<div class="top-msg">
						<c:if test="${ not empty sessionScope.user}">
							<a href="user-center.jsp" >${sessionScope.user["username"]}</a>
						</c:if>
					</div>
					<div class="top-msg">  欢迎来到QK商城！</div>
					<c:if test="${ not empty sessionScope.user}">
						<a href="../exit">[退出登录]</a>
					</c:if>
					<c:if test="${ empty sessionScope.user}">
					<div class="top-login-msg">
						<a href="login.jsp">请登录</a>
					</div>

					<div class="top-login-msg">
						<a href="register.jsp">注册</a>
					</div>
					</c:if>
                    
            <div class="top-right">
                <div class="shopping-cart">
                    <a href="cart.jsp">购物车</a>
                </div>
                <div class="user-center" >
                    <a href="javascript:void(0);">我的中心
                        <img src="images/arrow-down-grey.png">
                    </a>
                    <div class="user-center-list">
                        <a href="javascript:void(0);">我的中心<img src="images/arrow-up-grey.png"></a>
                        <div class="dropdown">
                            <ul>
                                <li class="tit"><a href="user-center.jsp">个人信息</a></li>
                                <li><a href="user-center-pw.jsp">修改密码</a></li>
                                <li><a href="user-center-addr.jsp">收货地址</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div>
                    <a href="order_list.jsp">我的订单</a>
                </div>
            </div>
        </div>
    </div>
    <div class="nav clearfix">
        <a href="index.jsp">
            <img src="images/logo.png" class="site-logo float-l">
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
                    <input type="text" name="inp-search" id="inp-search" placeholder="请输入您要的商品" >
                    <input onclick="search();" value="搜 索" type="button">
                </div>
            </div>
            
        </div>
    </div>
    </div>

    <div class="breadcrumbs">
        <div class="container">
            <a href='index.jsp'>首页</a><span class="sep">&gt;</span>
            <a href='list.jsp'>商品列表</a><span class="sep">&gt;</span>
            <span>商品详情</span>
        </div>
    </div>
    <div class="goods-detail">
        <div class="good-img"><img src="images/book4-max.png"></div>
        <h3>世界汉学</h3>
        <p class="desc">带你了解不一样的汉学。</p>
        <p class="price">￥130.00</p>
        <a class="btn" href="cart.jsp">加入购物车</a>
    </div>
</div>
    

<div id="footer">
    <div class="footer-container">
        <p>轻课学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有&nbsp;&nbsp;&nbsp;&nbsp;</p>
    </div>
</div>

</body>
</html>