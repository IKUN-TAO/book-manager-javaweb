<%@page import="java.sql.*"  %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/lb?useUnicode=true&characterEncoding=gbk";
Connection con =DriverManager.getConnection(url,"root","root");

String sql = "UPDATE user SET password=?, eamil=? WHERE name=?";
PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1, request.getParameter("password"));
pst.setString(2, request.getParameter("email"));
pst.setString(3, request.getParameter("name"));
pst.executeUpdate();

response.sendRedirect("per.jsp");

pst.close();
con.close();
%>
</body>
</html>