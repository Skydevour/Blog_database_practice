<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>登录</title>
  <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
  <meta name="author" content="Vincent Garreau" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/css/login/style.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login/reset.css"/>
</head>
<body>

<div id="particles-js">
		<div class="login">
			<div class="login-top">
				登录
				<a href="${pageContext.request.contextPath}/register.jsp">注册</a>
			</div>
			<form action="${pageContext.request.contextPath}/user/login">
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="${pageContext.request.contextPath}/images/login/name.png"/></div>
				<div class="login-center-input">
					<input type="text" name="userName" value="" placeholder="请输入您的用户名" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'"/>
					<div class="login-center-input-text">用户名</div>
				</div>
			</div>
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="${pageContext.request.contextPath}/images/login/password.png"/></div>
				<div class="login-center-input">
					<input type="password" name="password"value="" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
					<div class="login-center-input-text">密码</div>
				</div>
			</div>
				<div class="login-button">
					<input type="submit" value="登录" class="login-button1"/>
				</div>
			</form>
		</div>
		<div class="sk-rotating-plane"></div>
</div>

<!-- scripts -->
<script src="${pageContext.request.contextPath}/js/login/particles.min.js"></script>
<script src="${pageContext.request.contextPath}/js/login/app.js"></script>
<script type="text/javascript">
	function Pupop() {
		var errMsg='${errMsg}';
		errMsg=errMsg.trim(); //去空格
		console.log(errMsg);
		if(errMsg.length!=0){
			alert(errMsg);
		}
	}
	function hasClass(elem, cls) {
	  cls = cls || '';
	  if (cls.replace(/\s/g, '').length == 0) return false; //当cls没有参数时，返回false
	  return new RegExp(' ' + cls + ' ').test(' ' + elem.className + ' ');
	}
	 
	function addClass(ele, cls) {
	  if (!hasClass(ele, cls)) {
	    ele.className = ele.className == '' ? cls : ele.className + ' ' + cls;
	  }
	}
	 
	function removeClass(ele, cls) {
	  if (hasClass(ele, cls)) {
	    var newClass = ' ' + ele.className.replace(/[\t\r\n]/g, '') + ' ';
	    while (newClass.indexOf(' ' + cls + ' ') >= 0) {
	      newClass = newClass.replace(' ' + cls + ' ', ' ');
	    }
	    ele.className = newClass.replace(/^\s+|\s+$/g, '');
	  }
	}
		document.querySelector(".login-button").onclick = function(){
				addClass(document.querySelector(".login"), "active")
				setTimeout(function(){
					addClass(document.querySelector(".sk-rotating-plane"), "active")
					document.querySelector(".login").style.display = "none"
				},800)
				setTimeout(function(){
					removeClass(document.querySelector(".login"), "active")
					removeClass(document.querySelector(".sk-rotating-plane"), "active")
					document.querySelector(".login").style.display = "block"
					alert("登录成功")
					
				},5000)
		}
	Pupop();
</script>
</body>
</html>