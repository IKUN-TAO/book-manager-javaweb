<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>管理员个人中心</title>
	<link rel="stylesheet" href="../css/adminPer.css">
</head>
<body>
<%
String user=(String)session.getAttribute("user");
%>
	<h1>欢迎光临</h1>
	<div class="container">
			欢迎<%=user %>同学来到图书馆里系统。
	</div>
</body>
</html>