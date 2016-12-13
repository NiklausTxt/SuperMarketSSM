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
<title>QK商城-登录</title>
<link rel="stylesheet" href="<%=basePath %>css/base.css">
<script src="<%=basePath %>js/jquery-min.js"></script>
<script src="<%=basePath %>js/ajax.js"></script>
<script type="text/javascript">
	function validInput() {
		if ($("input[name='loginname']").val().trim() == "") {
			alert("用户名不能为空！");
			return false;
		} else if ($("input[name='nloginpwd']").val().trim() == "") {
			alert("密码不能为空！");
			return false;
		} else {
			document.getElementById('formlogin').submit();
		}

		return true;
	}
</script>
</head>
<body>
	<input id="currentPath" value="<%=basePath%>" type="hidden">
	<div class="site-wrapper" id="login">
		<div class="login-top">
			<div class="blank-nav clearfix">
				<a href="index.jsp"> <img src="<%=basePath %>images/logo.png"
					class="site-logo float-l">
				</a>
			</div>
		</div>
		<div id="content">
			<div class="login-wrap">
				<div class="login-form">
					<div class="login-box">
						<div class="mt">
							<h1>QK会员</h1>
							<div class="regist-link">
								<a href="register.jsp" target="_blank">立即注册 >></a>
							</div>
						</div>
						<div>
							<form id="formlogin" method="post" action="${pageContext.request.contextPath }/login.action">
								<div class="item item-fore1">
									<label for="loginname" class="login-label name-label"></label>
									<input id="loginname" type="text" class="itxt" name="loginname"
										tabindex="1" placeholder="用户名"> <span
										class="clear-btn"></span>
								</div>
								<div id="entry" class="item item-fore2">
									<label class="login-label pwd-label" for="nloginpwd"></label> <label
										id="sloginpwd" style="display: none;"></label> <input
										type="password" id="pwd" name="nloginpwd"
										class="itxt itxt-error" tabindex="2" placeholder="密码">
								</div>
								<div class="item">
									<div class="login-btn">
										<a onclick="return validInput();" id="login-submit"
											tabindex="10">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>