<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../css/examine.css">
	<title>图书信息</title>
</head>
<body>
	<h1>图书信息查询</h1>
	<div class="container">
		<form action="examineCheck.jsp" method="post">
			<label for="book-name">图书名称：</label>
			<input type="text" id="book-name" name="bookname" placeholder="请输入图书名称">

			<label for="author">作者：</label>
			<input type="text" id="author" name="bookauthor" placeholder="请输入作者">

			<label for="publisher">出版社：</label>
			<input type="text" id="publisher" name="bookpublisher" placeholder="请输入出版社">

			<input type="submit" value="查询">
		</form>
	</div>
</body>
</html>