<%--
  Created by IntelliJ IDEA.
  User: wanlihang
  Date: 2018/11/28
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>切换不同状态的我的订单</title>
    <style>
        .button { /* 按钮美化 */
            width: 80px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }

        .button:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;
        }

        table.hovertable {
            font-family: verdana, arial, sans-serif;
            color: #333333;
            border-width: 1px;
            border-color: #999999;
            border-collapse: collapse;
            width: 1200px;
        }

        th{height: 50px; font-size: 18px; font-family: 微软雅黑; text-align: center}
        td {
            font-family: "微软雅黑 Light";
            line-height: 40px;
            font-size: 18px;
            color: #666666;
            text-align: center
        }
    </style>
</head>

<body>
<div>
    <table class="hovertable" border="solid" align="center" rules="rows">
        <tr>
            <th>订单编号</th>
            <th>下单时间</th>
            <th>支付金额</th>
            <th>订单状态</th>
            <th>用户名称</th>
        </tr>
        <%
            String sta = request.getParameter("state");
            String username = request.getParameter("username");

            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
            Connection conn = DriverManager.getConnection(url);

            String sql = "select id,ordertime,price,state,username from orders where username =" + username;

            String add0 = " and state = 0 ";
            String add1 = " and state = 1 ";
            String add = " order by ordertime desc";
            if (sta.equals("0")) {
                sql += add0;
            }
            if (sta.equals("1")) {
                sql += add1;
            }
            sql += add;
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()) {
        %>
        <tr>
            <td>
                <%=rs.getString("id")%>
            </td>
            <td>
                <%=rs.getString("ordertime")%>
            </td>
            <td>
                <%=rs.getString("price")%>
            </td>
            <td>
                <%=(rs.getString("state").equals("1") ? "已完成" : "未完成")%>
            </td>
            <td>
                <%=username%>
            </td>
        </tr>
        <%
            }
            stat.close();
            conn.close();
        %>
    </table>
</div>
</body>
</html>
