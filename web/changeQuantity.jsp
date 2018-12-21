<%--
  Created by IntelliJ IDEA.
  User: wanlihang
  Date: 2018/12/1
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍数量</title>
</head>
<body>
<%
    Class.forName("org.sqlite.JDBC");
    String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
    String id = request.getParameter("id");
    if (request.getParameter("quantity") != null) {
        String sta = request.getParameter("quantity");
        Connection conn = DriverManager.getConnection(url);
        String sql = "update orderitem set quantity= " + sta + " where id=" + id;
        Statement stat = conn.createStatement();
        stat.executeUpdate(sql);
        stat.close();
        conn.close();
    } else {
        Connection conn2 = DriverManager.getConnection(url);
        String sql2 = "delete from orderitem  where id=" + id;
        Statement stat2 = conn2.createStatement();
        stat2.executeUpdate(sql2);
        stat2.close();
        conn2.close();
    }
%>
</body>
</html>
