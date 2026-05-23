<%@page import="java.sql.*"  %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书修改</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("bookid");
String bookname=request.getParameter("book-name");
String author=request.getParameter("author");
String chubanshe=request.getParameter("chubanshe");
String riqi=request.getParameter("riqi");
String price=request.getParameter("price");

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/lb?useUnicode=true&characterEncoding=gbk";
Connection con =DriverManager.getConnection(url,"root","root");

String sql = "update information set id=?, lbName=?, author=?, publisher=?, data=?, price=? where id=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, bookname);
pstmt.setString(3, author);
pstmt.setString(4, chubanshe);
pstmt.setString(5, riqi);
pstmt.setString(6, price);
pstmt.setString(7, id);
pstmt.executeUpdate();
pstmt.close();
con.close();
out.print("数据修改成功。");
response.setHeader("refresh", "2;url=unquiry.jsp");
%>
</body>
</html>