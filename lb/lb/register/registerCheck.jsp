<%@page import="java.sql.*"  %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String name = request.getParameter("user");
String email = request.getParameter("email"); 
String password = request.getParameter("password"); 
String type = request.getParameter("type"); 

if (name.isEmpty() || password.isEmpty()||type.isEmpty()) {
    out.print("用户名或密码不能为空,2秒后跳转。");
    response.setHeader("refresh", "2;url=register.jsp");
} else {
    // 对输入参数进行简单的安全过滤，避免SQL注入攻击
    name = name.replace("'", "");
    password = password.replace("'", "");
    email = email.replace("'", "");
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/lb?useUnicode=true&characterEncoding=utf8";
        Connection con = DriverManager.getConnection(url, "root", "root");
        Statement stmit = con.createStatement();
        String sql1 = "insert into user values ('" + name + "','" + password + "','" + email + "','" + type + "')";
        stmit.executeUpdate(sql1);
        response.sendRedirect("../login/login.jsp");
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        //处理数据库异常
    }
}

%>
</body>
</html>