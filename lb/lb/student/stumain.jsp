<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书管理系统 | 图书管理员主页</title>
</head>
<link rel="stylesheet" href="../css/adminstu.css">
<body>
	<header>
		<h1>欢迎来到图书管理系统</h1>
		<form action="../login/login.jsp">
    <input type="submit" value="退出系统" class="button">
	</header>
	<nav nav class="container">
		<ul>
			<li><a href="../admin/unquiry.jsp" target="content-frame">所有图书信息</a></li>
			<li><a href="examine.jsp" target="content-frame">图书信息查询</a></li>
			<li><a href="../admin/borrow.jsp" target="content-frame">借阅图书</a></li>
			<li><a href="../admin/per.jsp" target="content-frame">个人中心</a></li>
	</nav>
	<iframe src="adminPer.jsp" name="content-frame" width="100%" height="600"></iframe>
</body>
</html>