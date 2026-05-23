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
   <th>操作</th>
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

    // PreparedStatement对象来删除图书信息
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
                <!-- 在按钮事件中调用修改操作 -->
                <td>
                <button onclick="updateBook(<%=rs.getString("id") %>);">修改</button>
                <!-- 在按钮事件中调用删除操作 -->
                <button onclick="deleteBook(<%=rs.getString("id") %>);">删除</button>
                </td>
            </tr>
            <%
        } while (rs.next());
    } else {
        %>
        <tr>
            <td colspan="6">没有查询到符合条件的图书信息</td>
        </tr>
        <%
    }

    rs.close();
    pstmt.close();
    con.close();
%>
</table>

<script>
function deleteBook(bookId) {
    // 弹出确认对话框，如果用户确认删除则执行删除操作
    if (confirm("确认要删除该图书吗？")) {
        // 获取表单
        var form = document.getElementById("delete-form");
        // 设置表单要提交的参数
        var input = document.createElement("input");
        input.name = "bookId";
        input.value = bookId;
        form.appendChild(input);
        // 提交表单
        form.submit();
    }
}
function updateBook(bookId) {
    // 弹出确认对话框，如果用户确认修改则执行修改操作
    if (confirm("确认要修改该图书吗？")) {
        // 获取表单
        var form = document.getElementById("update-form");
        // 设置表单要提交的参数
        var input = document.createElement("input");
        input.name = "bookId";
        input.value = bookId;
        form.appendChild(input);
        // 提交表单
        form.submit();
    }
}
</script>
<!-- 定义隐藏的表单，用于实现删除操作 -->
<form id="delete-form" method="post" action="deleteBook.jsp" style="display:none;"></form>
<form id="update-form" method="post" action="updateBook.jsp" style="display:none;"></form>
</body>
</html>