<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

String bookId = request.getParameter("bookId");


Connection con = null;
PreparedStatement pstmt = null;
String sql = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/lb?useUnicode=true&characterEncoding=UTF-8";
    con = DriverManager.getConnection(url, "root", "root");

    sql = "delete from information where id = ?";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, bookId);
    int rows = pstmt.executeUpdate(); 
    if (rows > 0) {
        response.sendRedirect("examineCheck.jsp");
    } else {
        out.print("删除失败！");
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try { if (pstmt != null) pstmt.close(); } catch (SQLException se) { }
    try { if (con != null) con.close(); } catch (SQLException se) { }
}
%>