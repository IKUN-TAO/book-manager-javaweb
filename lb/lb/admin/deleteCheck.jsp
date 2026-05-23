<%@ page import="java.sql.*"  %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>删除书籍</title>
</head>
<body>
<%
response.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=UTF-8");
request.setCharacterEncoding("UTF-8");
Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://localhost:3306/lb?useUnicode=true&characterEncoding=utf-8&useSSL=false";
String user = "root";
String password = "root";
Connection con = DriverManager.getConnection(url, user, password);

PreparedStatement pst = null;
ResultSet rs = null;

String bookname = request.getParameter("bookname");
String author = request.getParameter("author");

if (bookname != null && author != null) {
    bookname = new String(request.getParameter("bookname").getBytes("ISO-8859-1"), "UTF-8");
    author = new String(request.getParameter("author").getBytes("ISO-8859-1"), "UTF-8");

    String sql = "SELECT * FROM information WHERE lbName=?";
    try {
        pst = con.prepareStatement(sql);
        pst.setString(1, bookname);
        rs = pst.executeQuery();
       
        if (rs.next() && author.equals(rs.getString("author"))) {
            //书籍存在，删除
            sql = "DELETE FROM information WHERE lbName=? AND author=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, bookname);
            pst.setString(2, author);
            pst.executeUpdate();
            out.print("数据删除成功。");
            response.setHeader("refresh", "2;url=examine.jsp");
        } else {
            //书籍不存在
            System.out.print(sql);
            out.print("书籍不存在。");
            response.setHeader("refresh", "2;url=delete.jsp");
        }
    }
    catch(SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if(rs!=null) rs.close();
            if(pst!=null) pst.close();
            if(con!=null) con.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
</body>
</html>