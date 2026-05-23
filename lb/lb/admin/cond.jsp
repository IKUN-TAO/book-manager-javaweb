<%@page import="java.sql.*"  %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>借书信息</title>
	<link rel="stylesheet" href="../css/unquiry.css">
</head>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/lb?useUnicode=true&characterEncoding=gbk";
	Connection con =DriverManager.getConnection(url,"root","root");
	Statement stmit =con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	String sql="select*from re";
	ResultSet rs=stmit.executeQuery(sql);
	rs.last();
	
%>
<body>
	<h1>借书信息</h1>
	<table>
		<tr>
			<th>姓名</th>
			<th>借阅书籍</th>
			<th>借阅日期</th>
			<th>状态</th>
		</tr>
		<tr>
				<%
				rs.beforeFirst();
				while(rs.next()){	
				%>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("book") %></td>
				<td><%=rs.getString("date") %></td>
				<td><%=rs.getString("cond") %></td>
			</tr>
			<%
				}
				rs.close();
				stmit.close();
				con.close();
			%>
	</table>
</body>
</html>