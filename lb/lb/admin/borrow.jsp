<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>借阅图书</title>
	<link rel="stylesheet" href="../css/borrow.css">
</head>
<body>
	<h1>图书借阅服务</h1>
	<div class="container">
		<form action="borrowCheck.jsp" method="post">
			<label for="book-name">图书名称：</label>
			<input type="text" id="book-name" name="book-name" placeholder="请输入图书名称" required>
			
			<label for="borrower-name">借书人姓名：</label>
			<input type="text" id="borrower-name" name="borrower-name" placeholder="请输入借书人姓名" required>

			<label for="borrow-date">借出日期：</label>
			<input type="date" id="borrow-date" name="borrow-date" required>

			<br><br>
			<input type="submit" value="借阅">
		</form>
	</div>
</body>
</html>