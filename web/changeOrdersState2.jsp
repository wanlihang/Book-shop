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
    <title>修改订单状态</title>
</head>
<body>
<%
    String ordersID = request.getParameter("ordersID");
    String sta = request.getParameter("state");
    Class.forName("org.sqlite.JDBC");
    String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
    Connection conn = DriverManager.getConnection(url);
    String sql = "update orders set state = " + sta + " where id = " + ordersID;
    Statement stat = conn.createStatement();
    stat.executeUpdate(sql);
    stat.close();
    conn.close();
%>
</body>
</html>
