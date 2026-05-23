<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>删除图书界面</title>
	<link rel="stylesheet" type="text/css" href="../css/borrow.css">
</head>
<body>
	<h1>图书删除服务</h1>
	<div class="container">
		<form action="deleteCheck.jsp" method="post">
			<label for="book-name">图书名称：</label>
			<input type="text" id="book-name" name="bookname" placeholder="请输入图书名称" required>

			<label for="author">作者：</label>
			<input type="text" id="author" name="author" placeholder="请输入作者" required>
			<input type="submit" value="删除">
		</form>
	</div>
</body>
</html>