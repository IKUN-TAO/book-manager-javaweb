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
String name=request.getParameter("user");
String password=request.getParameter("password"); 
String type=request.getParameter("type"); 
session.setAttribute("user", name);
session.setAttribute("type", type);
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/lb?useUnicode=true&characterEncoding=gbk";
Connection con =DriverManager.getConnection(url,"root","root");
Statement stmit =con.createStatement();

String sql ="select*from user where name='"+name+"'and password='"+password+"'and type='"+type+"'";
ResultSet rs=stmit.executeQuery(sql);
if(rs.next()){
	if ("学生".equals(type)) {
        response.sendRedirect("../student/stumain.jsp");
    }else if("管理员".equals(type)){
    	response.sendRedirect("../admin/adminstu.jsp");
    }
	
}else{
	out.print("密码错误或用户名为空，3秒后自动跳转");
	 response.setHeader("refresh", "3;url=login.jsp");
	/* response.sendRedirect("login.jsp"); */
}

rs.close();
stmit.close();
con.close();
%>

</body>
</html>