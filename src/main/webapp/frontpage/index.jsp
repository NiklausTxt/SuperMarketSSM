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
<title>QK商城</title>
<link rel="stylesheet" href="<%=basePath %>css/base.css">
<script src="<%=basePath %>js/jquery-min.js"></script>
<script src="<%=basePath %>js/main.js"></script>
<script src="<%=basePath %>js/goods.js"></script>

</head>
<body>
	<input id="currentPath" value="<%=basePath%>" type="hidden">
	<div class="site-wrapper" id="homepage">
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
			<div id="hot-section">
				<div id="spotlight">
					<ul>
						<li style="display: list-item;"><a class="spotlight-item"
							href="#"> <img src="images/spotlight1.jpg" alt="">
						</a></li>
						<li style="display: none;"><a class="spotlight-item" href="#">
								<img src="images/spotlight2.png" alt="">
						</a></li>
						<li style="display: none;"><a class="spotlight-item" href="#">
								<img src="images/spotlight3.jpg" alt="">
						</a></li>

					</ul>
					<div id="ul-banner-circle">
						<span class="span-circle" style="background-color: #e53935;"></span>
						<span class="span-circle" style="background-color: #828282;"></span>
						<span class="span-circle" style="background-color: #828282;"></span>
					</div>
				</div>
				<div id="left-nav-container">
					<div class="left-nav">
						<ul class="left-nav_ul">
							<li class="left-nav_ul_li"><a onclick="satrtSearch('书籍');"><span>书籍</span></a>
								<ul class="li-nav">
									<li class="li-nav-title">
										<p>
											<a onclick="satrtSearch('书籍');" >书籍</a>
										</p>
										<hr class="net_hr">
									</li>
									<li class="li-nav-content" >
										<div>
										<%-- <%=basePath%>listGoods.action --%>
											<a onclick="satrtSearch('文学类');" >文学类</a>
											<a onclick="satrtSearch('小说类');" >小说类</a> 
											<a onclick="satrtSearch('社科类');" >社科类</a> 
										</div>
									</li>
								</ul></li>
							<li class="left-nav_ul_li"><a onclick="satrtSearch('服饰');"><span>服饰</span></a>
								<ul class="li-nav">
									<li class="li-nav-title">
										<p>
											<a onclick="satrtSearch('服饰');">服饰</a>
										</p>
										<hr class="net_hr">
									</li>
									<li class="li-nav-content">
										<div>
											<a onclick="satrtSearch('男装');" >男装</a>
											<a onclick="satrtSearch('女装');" >女装</a> 
											<a onclick="satrtSearch('童装');" >童装</a> 
										</div>
									</li>
								</ul></li>
							<li class="left-nav_ul_li"><a onclick="satrtSearch('食品');"><span>食品</span></a>
								<ul class="li-nav">
									<li class="li-nav-title">
										<p>
											<a onclick="satrtSearch('食品');">食品</a>
										</p>
										<hr class="net_hr">
									</li>
									<li class="li-nav-content">
										<div>
											<a onclick="satrtSearch('茶酒冲饮');" >茶酒冲饮</a>
											<a onclick="satrtSearch('水产生鲜');" >水产生鲜</a> 
											<a onclick="satrtSearch('粮油干货');" >粮油干货</a> 
										</div>
									</li>
								</ul></li>
						</ul>
					</div>
					<div id="top-articles">
						<h4>新品上市</h4>
						<ul>
							<li><a href="<%=basePath%>frontpage/detail.jsp">夏日防晒三件套</a></li>
							<li><a href="<%=basePath%>frontpage/detail.jsp">户外必备神器</a></li>
							<li><a href="<%=basePath%>frontpage/detail.jsp">《小王子》英文版</a></li>
							<li><a href="<%=basePath%>frontpage/detail.jsp">个性情侣装</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--banner end-->
		<div class="content">
			<div class="content-container">
				<div class="section-header clearfix">
					<h3>书籍</h3>
					<div class="more">
						<a href="<%=basePath%>frontpage/list.jsp">更多 &gt;&gt;</a>
					</div>
				</div>

				<div class="shelve clearfix">
					<div class="float-r clearfix">
						<div class="goods">
							<div class="goods-box float-l">
								<div class="goods-item">
									<a href="<%=basePath%>frontpage/detail.jsp"> <img src="images/book1.png" alt="">
									</a>
								</div>
								<div class="info">
									<a href="<%=basePath%>frontpage/detail.jsp"><h2 class="substr">世界汉学</h2></a> <a
										href="<%=basePath%>frontpage/detail.jsp"><p>130.00元/册</p></a>
								</div>
							</div>
							<div class="goods-box float-l">
								<div class="goods-item">
									<a href="<%=basePath%>frontpage/detail.jsp"> <img src="images/book2.png" alt="">
									</a>
								</div>
								<div class="info">
									<a href="<%=basePath%>frontpage/detail.jsp"><h2 class="substr">Water Babie</h2></a> <a
										href="<%=basePath%>frontpage/detail.jsp"><p>30.00元/册</p></a>
								</div>
							</div>
							<div class="goods-box float-l">
								<div class="goods-item">
									<a href="<%=basePath%>frontpage/detail.jsp"> <img src="images/book3.png" alt="">
									</a>
								</div>
								<div class="info">
									<a href="<%=basePath%>frontpage/detail.jsp"><h2 class="substr">镜像</h2></a> <a
										href="<%=basePath%>frontpage/detail.jsp"><p>60.00元/套</p></a>
								</div>
							</div>
							<div class="goods-box float-l">
								<div class="goods-item">
									<a href="<%=basePath%>frontpage/detail.jsp"> <img src="images/book4.png" alt="">
									</a>
								</div>
								<div class="info">
									<a href="<%=basePath%>frontpage/detail.jsp"><h2 class="substr">古镇记忆</h2></a> <a
										href="<%=basePath%>frontpage/detail.jsp"><p>30.00元/套</p></a>
								</div>
							</div>
							<div class="goods-box float-l">
								<div class="goods-item">
									<a href="<%=basePath%>frontpage/detail.jsp"> <img src="images/book5.png" alt="">
									</a>
								</div>
								<div class="info">
									<a href="<%=basePath%>frontpage/detail.jsp"><h2 class="substr">Campanella</h2></a> <a
										href="<%=basePath%>frontpage/detail.jsp"><p>360.00元/套</p></a>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>


		<div class="content">
			<div class="content-container">
				<div class="section-header clearfix">
					<h3>优惠信息</h3>
					<div class="more">
						<a href="<%=basePath%>frontpage/list.jsp">更多 &gt;&gt;</a>
					</div>
				</div>
				<div class="shelve clearfix float-l" style="padding-top: 5px;">
					<div class="goods">
						<div class="goods-box float-l">
							<div class="goods-item">
								<a href="<%=basePath%>frontpage/detail.jsp"> <img src="images/sale1.png" alt="">
								</a>
							</div>
							<div class="info">
								<a href="<%=basePath%>frontpage/detail.jsp"><h2 class="substr">儿童马甲</h2></a> <a
									href="detail.jsp">
									<p>
										<span class="ori_price">90.00元</span><span>60.00元</span>
									</p>
								</a>
							</div>
						</div>
						<div class="goods-box float-l">
							<div class="goods-item">
								<a href="<%=basePath%>frontpage/detail.jsp"> <img src="images/sale2.png" alt="">
								</a>
							</div>
							<div class="info">
								<a href="<%=basePath%>frontpage/detail.jsp"><h2 class="substr">情侣装</h2></a> <a
									href="<%=basePath%>frontpage/detail.jsp">
									<p>
										<span class="ori_price">130.00元</span><span>70.00元</span>
									</p>
								</a>
							</div>
						</div>
						<div class="goods-box float-l">
							<div class="goods-item">
								<a href="<%=basePath%>frontpage/detail.jsp"> <img src="images/sale3.png" alt="">
								</a>
							</div>
							<div class="info">
								<a href="<%=basePath%>frontpage/detail.jsp"><h2 class="substr">名品汇女包</h2></a> <a
									href="<%=basePath%>frontpage/detail.jsp">
									<p>
										<span class="ori_price">1250.00元</span><span>600.00元</span>
									</p>
								</a>
							</div>
						</div>
						<div class="goods-box float-l">
							<div class="goods-item">
								<a href="<%=basePath%>frontpage/detail.jsp"> <img src="images/sale4.png" alt="">
								</a>
							</div>
							<div class="info">
								<a href="<%=basePath%>frontpage/detail.jsp"><h2 class="substr">旗袍</h2></a> <a
									href="<%=basePath%>frontpage/detail.jsp">
									<p>
										<span class="ori_price">450.00元</span><span>200.00元</span>
									</p>
								</a>
							</div>
						</div>
						<div class="goods-box float-l">
							<div class="goods-item">
								<a href="<%=basePath%>frontpage/detail.jsp"> <img src="images/sale5.png" alt="">
								</a>
							</div>
							<div class="info">
								<a href="<%=basePath%>frontpage/detail.jsp"><h2 class="substr">爵士帽</h2></a> <a
									href="<%=basePath%>frontpage/detail.jsp">
									<p>
										<span class="ori_price">45.00元</span><span>30.00元</span>
									</p>
								</a>
							</div>
						</div>
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