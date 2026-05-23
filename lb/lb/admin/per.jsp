<%@page import="java.sql.*"  %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../css/examine.css">
<title>个人中心</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String name=(String)session.getAttribute("user");

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/lb?useUnicode=true&characterEncoding=gbk";
Connection con =DriverManager.getConnection(url,"root","root");

PreparedStatement pstmt = null;
String sql = "select * from user where name=?";
pstmt = con.prepareStatement(sql);
pstmt.setString(1, name);
ResultSet rs = pstmt.executeQuery();
%>
<h1>个人中心</h1>
	<div class="container">
		<form action="adminPerCheck.jsp" method="post">
		<%
		if(rs.next()){
		%>
			<label for="name">姓名：</label>
			<input type="text" id="book-name" name="name" value=<%=name%>  readonly>

			<label for="password">密码：</label>
			<input type="text" id="password" name="password" value=<%=rs.getString(2)%> readonly>

			<label for="email">邮箱：</label>
			<input type="text" id="eamil" name="email" value=<%=rs.getString(3)%> >

			<input type="submit" value="确认修改">
				<%
		}
		rs.close();
		con.close();
		%>
		</form>
	</div>
</body>
</html>