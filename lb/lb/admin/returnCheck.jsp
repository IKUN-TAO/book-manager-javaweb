<%@ page import="java.sql.*"  %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
request.setCharacterEncoding("UTF-8");
Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://localhost:3306/lb?useUnicode=true&characterEncoding=utf-8&useSSL=false";
String user = "root";
String password = "root";

Connection con = DriverManager.getConnection(url, user, password);

String sql = "UPDATE re SET cond = ? WHERE book = ? AND name= ? ";

PreparedStatement pst = con.prepareStatement(sql);
pst.setString(3, request.getParameter("borrower-name"));
pst.setString(1, "已还书");
pst.setString(2, request.getParameter("book-name"));

int count = pst.executeUpdate();

// 处理更新结果
if (count > 0) {    
    out.println("已经归还书名为" + request.getParameter("book-name") + "的书");
    response.setHeader("refresh", "3;url=cond.jsp");
} else {
   
    out.println("归还书籍信息失败");
}

pst.close();
con.close();

%>