<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加图书界面</title>
	<link rel="stylesheet" type="text/css" href="../css/borrow.css">
</head>
<body>
	<h1>图书添加服务</h1>
	<div class="container">
		<form action="addCheck.jsp" method="post">
			<label for="book-name">图书编号：</label>
			<input type="text" id="book-name" name="bookid" placeholder="请输入图书编号" required>
		
			<label for="book-name">图书名称：</label>
			<input type="text" id="book-name" name="book-name" placeholder="请输入图书名称" required>

			<label for="author">作者：</label>
			<input type="text" id="author" name="author" placeholder="请输入作者" required>
			
			<label for="chubanshe">出版社：</label>
			<input type="text" id="author" name="chubanshe" placeholder="请输入出版社" required>
			
			<label for="riqi">出版日期：</label>
			<input type="text" id="author" name="riqi" placeholder="请输入出版日期" required>
			
			<label for="jiage">价格：</label>
			<input type="text" id="author" name="price" placeholder="请输入价格" required>
			
			<input type="submit" value="添加">
		</form>
	</div>
</body>
</html>