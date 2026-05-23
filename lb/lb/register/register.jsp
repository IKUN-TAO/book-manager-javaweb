<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书管理系统注册</title>
	<link rel="stylesheet" type="text/css" href="../css/register.css">
</head>
<body>
	<div class="register-page">
	  <div class="form">
		   <h1>注册页面</h1>
	    <form class="register-form" action="registerCheck.jsp" method="post" name="registerForm">
	      <input type="text" placeholder="用户名"/ name="user">
	      <input type="email" placeholder="电子邮件地址"/ name="email">
	      <input type="password" placeholder="密码"/ name="password">
	      <select name="type">
		  						<option value="">请选择</option>
		  						<option value="学生">学生</option>
		  						<option value="管理员">管理员</option>
		  					</select>
	      <input  type="submit" name="sumit" value="注册" onclick="return check()" class="button">
	      <p class="message">已经有账号了？ <a href="../login/login.jsp">现在登录</a></p>
	    </form>
	  </div>
	</div>

</body>
</html>