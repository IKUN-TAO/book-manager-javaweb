<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书信息</title>
<link rel="stylesheet" href="../css/unquiry.css">

</head>
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
<%
    // 获取查询关键词，注意设置编码方式
    request.setCharacterEncoding("UTF-8");
    String bookname = request.getParameter("bookname");
    String author = request.getParameter("bookauthor");
    String publisher = request.getParameter("bookpublisher");

    // 构造SQL查询语句
    String sql = "select * from information where 1=1";
    if (bookname != null && !bookname.isEmpty()) {
        sql += " and lbName like ?";
    }
    if (author != null && !author.isEmpty()) {
        sql += " and author like ?";
    }
    if (publisher != null && !publisher.isEmpty()) {
        sql += " and publisher like ?";
    }

    // 执行SQL查询语句
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/lb?useUnicode=true&characterEncoding=UTF-8";
    Connection con = DriverManager.getConnection(url, "root", "root");

    // 新增一个PreparedStatement对象来删除图书信息
    PreparedStatement deletePstmt = con.prepareStatement("delete from information where id = ?");
    PreparedStatement pstmt = con.prepareStatement(sql);
    int index = 1;
    if (bookname != null && !bookname.isEmpty()) {
        pstmt.setString(index++, "%" + bookname + "%");
    }
    if (author != null && !author.isEmpty()) {
        pstmt.setString(index++, "%" + author + "%");
    }
    if (publisher != null && !publisher.isEmpty()) {
        pstmt.setString(index++, "%" + publisher + "%");
    }
    ResultSet rs = pstmt.executeQuery();

    boolean hasResult = rs.next();
    if (hasResult) {
        do {
            %>
            <tr>
                <td><%=rs.getString("id") %></td>
                <td><%=rs.getString("lbName") %></td>
                <td><%=rs.getString("author") %></td>
                <td><%=rs.getString("publisher") %></td>
                <td><%=rs.getString("data") %></td>
                <td><%=rs.getString("price") %>元</td>
            </tr>
            <%
        } while (rs.next());
    } else {
        %>
        <tr>
            <td colspan="5">没有查询到符合条件的图书信息</td>
        </tr>
        <%
    }

    rs.close();
    pstmt.close();
    con.close();
%>
</table>
