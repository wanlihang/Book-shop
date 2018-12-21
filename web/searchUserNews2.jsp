<%--
Created by IntelliJ IDEA.
User: zzz
Date: 2018/11/25
Time: 15:24
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>显示搜索的书籍</title>
    <style>
        .button { /* 按钮美化 */
            width: 170px; /* 宽度 */
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
            background: #5599FF;}


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
<body style="background-image: url(/images/style/timg.jpg)">
<form method="post" id="form1">
    <input class="button" type="button" value="返回" onclick="returnIndex()">
</form>
<%
    int flag=0;
    String id,username,password,phone,cellphone,email,address;
    id=username=password=phone=cellphone=email=address="无数据";
    String a =request.getParameter("id");
    Class.forName("org.sqlite.JDBC");
    String url ="jdbc:sqlite:D:/javaweb/bookstore.db";
    String sql = "select * from user ";
    Connection conn = DriverManager.getConnection(url);
    Statement stat = conn.createStatement();
    ResultSet rs = stat.executeQuery(sql);
    while (rs.next())
    {
        if(a.equals(rs.getString("username")))
        {
            id=(rs.getString("id"));
            username=(rs.getString("username"));
            password=(rs.getString("password"));
            phone=(rs.getString("phone"));
            cellphone=(rs.getString("cellphone"));
            email=(rs.getString("email"));
            address=(rs.getString("address"));
            flag=1;
            break;
        }
    }
%>
<%
    if(flag==0)
    {
        out.println("<h1 <h1 align=\"center\">不存在此用户");
        out.println("</h1>");

    }%>
<script>
    function returnIndex()
    {
        window.history.back(-1);

    }
</script>
<center>
    <table class="hovertable" border="solid" width="800px" height="300px">
        <tr height="100px" align="center">
            <th>id</th>
            <th>用户名</th>
            <th>密码</th>
            <th>电话号码</th>
            <th>手机号码</th>
            <th>邮箱</th>
            <th>地址</th>
        </tr>
        <tr height="200px" align="center">
            <td><%=id%></td>
            <td><%=username%></td>
            <td><%=password%></td>
            <td><%=phone%></td>
            <td><%=cellphone%></td>
            <td><%=email%></td>
            <td><%=address%></td>
        </tr>
    </table>
</center>
<%
    stat.close();
    conn.close();
%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.lang.String" %>

</body>
</html>
