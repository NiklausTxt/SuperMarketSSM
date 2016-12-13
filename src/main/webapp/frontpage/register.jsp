<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>QK商城-注册</title>
<link rel="stylesheet" href="css/base.css">
<script src="js/jquery-min.js"></script>
<script src="js/main.js"></script>   
<script type="text/javascript">

function checkLogin() {
	alert($("input[name='regName']").val()+","+$("input[name='pwd']").val()+","+$("input[name='pwdRepeat']").val());
    if ($("input[name='regName']").val().trim() == "") {
		alert("用户名不能为空！");
		return false;
	} else if ($("input[name='pwd']").val().trim() == "" || $("input[name='pwdRepeat']").val().trim() == "") {
		alert("密码不能为空！");
		return false;
	} else if($("input[name='pwd']").val().trim() != $("input[name='pwdRepeat']").val().trim()){
		alert("两次密码输入不一致！");
		return false;
	}else {
		document.getElementById('register-form').submit();
	}

	return true;
    
  }
</script>
</head>
<body>
<div class="site-wrapper" id="login">
    <div class="login-top">
        <div class="blank-nav clearfix">
            <a href="index.jsp">
                <img src="images/logo.png" class="site-logo float-l">
            </a>
        </div>
    </div>
    <div id="content">
        <div class="login-wrap">
        <div class="reg-form">
            <h1>会员注册</h1>
            <form action="${pageContext.request.contextPath }/register.action"  id="register-form" method="post">
                <div class="form-item form-item-account" id="form-item-account">
                    <label>用　户　名</label>
                    <input type="text" id="form-account" name="regName" class="field">
                </div>
                <div class="input-tip">
                    <span></span>
                </div>
                <div class="form-item">
                    <label>设 置 密 码</label>
                    <input type="password" name="pwd" id="form-pwd" class="field">
                </div>
                <div class="input-tip">
                    <span></span>
                </div>
                <div class="form-item">
                    <label>确 认 密 码</label>
                    <input type="password" name="pwdRepeat" id="form-equalTopwd" class="field">
                </div>
                <div class="input-tip">
                    <span></span>
                </div>
                <div class="form-agreen">
                    <div><input type="checkbox" name="agreen"  checked="" style="margin-right: 10px;">我已阅读并同意<a href="javascript:;" id="protocol">《用户注册协议》</a> </div>
                    <div class="input-tip">
                        <span></span>
                    </div>
                </div>
                <div>
                    <div class="register-btn">
                       <!--  <a href="javascript:document.getElementById('register-form').submit();">注册</a> -->
                        <a onclick="return checkLogin();" id="login-submit"	tabindex="10">注123册</a>
                       <!--  <a onclick="return validInput();" id="login-submit"	tabindex="10">登&nbsp;&nbsp;&nbsp;&nbsp;录</a> -->
                    </div>
                </div>
            </form>
        </div>
    </div>
    </div>
</div>
</body>
</html>