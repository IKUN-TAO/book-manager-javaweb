<%@page import="java.sql.*"  %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书信息</title>
	<link rel="stylesheet" href="../css/unquiry.css">
</head>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/lb?useUnicode=true&characterEncoding=gbk";
	Connection con =DriverManager.getConnection(url,"root","root");
	Statement stmit =con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	String sql="select*from information";
	ResultSet rs=stmit.executeQuery(sql);
	rs.last();
	
%>
<body>
	<h1>图书信息</h1>
	<table>
		<tr>
			<th>图书编号</th>
			<th>图书名称</th>
			<th>作者</th>
			<th>出版社</th>
			<th>出版日期</th>
			<th>价格</th>
		</tr>
		<tr>
				<%
				rs.beforeFirst();
				while(rs.next()){	
				%>
				<td><%=rs.getString("id") %></td>
				<td><%=rs.getString("lbName") %></td>
				<td><%=rs.getString("author") %></td>
				<td><%=rs.getString("publisher") %></td>
				<td><%=rs.getString("data") %></td>
				<td><%=rs.getString("price") %>元</td>
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