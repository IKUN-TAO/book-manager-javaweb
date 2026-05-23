<%@ page import="java.sql.*"  %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
request.setCharacterEncoding("UTF-8");
Class.forName("com.mysql.jdbc.Driver");

// 数据库连接信息
String url = "jdbc:mysql://localhost:3306/lb?useUnicode=true&characterEncoding=utf-8&useSSL=false";
String user = "root";
String password = "root";

// 创建数据库连接
Connection con = DriverManager.getConnection(url, user, password);

// 准备SQL查询语句，使用占位符代替变量
String sql = "SELECT * FROM information WHERE lbName = ?";

// 创建PreparedStatement对象，并设置占位符的值
PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1, request.getParameter("book-name"));

// 执行查询操作，返回结果集
ResultSet rs = pst.executeQuery();

// 处理查询结果
if (rs.next()) {
 // 如果存在与book-name相同的书名，则将相关信息插入到re表中
 String sql1 = "INSERT INTO re(book, name, date, cond) VALUES (?, ?, ?, ?)";
 PreparedStatement pst1 = con.prepareStatement(sql1);
 pst1.setString(1, request.getParameter("book-name"));
 pst1.setString(2, request.getParameter("borrower-name"));
 pst1.setString(3, request.getParameter("borrow-date"));
 pst1.setString(4, "已借阅");

 int count = pst1.executeUpdate();
 if (count > 0) {
     // 如果插入成功，则输出相关信息     
     out.println("借书成功，书名为" + request.getParameter("book-name"));
     response.setHeader("refresh", "3;url=cond.jsp");
 } else {
     // 否则输出相关提示信息
     out.println("借阅书籍信息失败");
 }

 pst1.close();
} else {
 // 否则输出相关提示信息
 out.println("数据库中不存在相关书籍信息");
}

// 关闭ResultSet、PreparedStatement和Connection对象
rs.close();
pst.close();
con.close();

%>