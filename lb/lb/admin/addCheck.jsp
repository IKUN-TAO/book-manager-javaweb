
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
Statement stmit =con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

String bookid=request.getParameter("bookid");
String bookname=request.getParameter("book-name");
String author=request.getParameter("author");
String chubanshe=request.getParameter("chubanshe");
String riqi=request.getParameter("riqi");
String price=request.getParameter("price");
//查是否相等
String sql="select*from information where id='"+bookid+"'";
ResultSet rs=stmit.executeQuery(sql);
if(rs.next()){
	out.print("编号已存在,请重新定义.");
	response.setHeader("refresh", "2;url=add.jsp");
}else if(bookid!=null && bookname!=null && author!=null&& chubanshe!=null&& riqi!=null&& price!=null){
	String sql1 = "insert into information values('" + bookid + "','" + bookname + "','" + author + "','" + chubanshe + "','" + riqi + "','" + price + "')";
	stmit.executeUpdate(sql1);
	out.print("数据添加成功。");
	response.setHeader("refresh", "2;url=examine.jsp");
}

rs.close();
stmit.close();
con.close();

%>
</body>
</html>