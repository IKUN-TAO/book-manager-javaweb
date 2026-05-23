<%@page import="java.sql.*"  %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/borrow.css">
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String bookId = request.getParameter("bookId");
String id=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/lb?useUnicode=true&characterEncoding=gbk";
Connection con = DriverManager.getConnection(url,"root","root");
Statement stmit = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

PreparedStatement pstmt = null;
String sql = "select * from information where id=?";
pstmt = con.prepareStatement(sql);
pstmt.setString(1, bookId);
ResultSet rs = pstmt.executeQuery();
%>


<header><h1>图书修改</h1></header>
<main>
	<form action="updateSuccess.jsp" method="POST" name="upForm">
		<%
		if(rs.next()){
		%>
		<table align="center">
			<tr>
			<td>图书编号</td>
				<td><input type="text" value="<%=rs.getString(1)%> " name="bookid"  class="txt" readonly></td>
			</tr>
			<tr>
				<td>图书名称</td>
				<td><input type="text" value="<%=rs.getString(2)%> " name="book-name" class="txt"></td>
			</tr>
			<tr>
				<td>作者</td>
				<td><input type="text" value="<%=rs.getString(3)%> " name="author" class="txt"></td>
			</tr>
			<tr>
				<td>出版社</td>
				<td><input type="text" value="<%=rs.getString(4)%> " name="chubanshe" class="txt"></td>
			</tr>
			<tr>
				<td>出版日期</td>
				<td><input type="text" value="<%=rs.getString(5)%> " name="riqi" class="txt"></td>
			</tr>
			<tr>
				<td>价格</td>
				<td><input type="text" value="<%=rs.getString(6)%> " name="price" class="txt"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="修改" onclick="return check()">
			</tr>
		</table>
			<%
		}
		rs.close();
		stmit.close();
		con.close();
		%>
	</form>
</main>
</body>
</html>