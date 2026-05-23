<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书管理系统登录</title>
<link rel="stylesheet" href="../css/login.css">
</head>
<script>
		function check(){
			if(document.loginForm.user.value==""){
				alert("请输入账号。");
				document.loginForm.user.focus();
				return false;
			}
			if(document.loginForm.password.value==""){
				alert("请输入密码。");
				document.loginForm.password.focus();
				return false;
			}
			if(document.loginForm.type.value==""){
				alert("请选择类型。");
				document.loginForm.type.focus();
				return false;
			}
			return true;
		}
		
		</script>
<body>
	<div class="login-page">
	  <div class="form">
		  <h1>登录页面</h1>
	    <form class="login-form" action="loginCheck.jsp" method="post" name="loginForm">
	      <input type="text" placeholder="用户名"/ name="user">
	      <input type="password" placeholder="密码"/ name="password">
	       <select name="type">
		  						<option value="">请选择</option>
		  						<option value="学生">学生</option>
		  						<option value="管理员">管理员</option>
		  					</select>
		 <input  type="submit" name="sumit" value="登录" onclick="return check()" class="button">
	      <p class="message">还没有账号？ <a href="../register/register.jsp">现在注册</a></p>
	    </form>
	  </div>
	</div>
</body>
</html>