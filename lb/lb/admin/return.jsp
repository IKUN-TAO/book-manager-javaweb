<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>归还图书</title>
	<link rel="stylesheet" href="../css/borrow.css">
</head>
<body>
	<h1>图书归还服务</h1>
	<div class="container">
		<form action="returnCheck.jsp" method="post">
			<label for="book-name">图书名称：</label>
			<input type="text" id="book-name" name="book-name" placeholder="请输入图书名称" required>

			<label for="borrower-name">借书人姓名：</label>
			<input type="text" id="borrower-name" name="borrower-name" placeholder="请输入借书人姓名" required>

			<input type="submit" value="归还">
		</form>
	</div>
</body>
</html>