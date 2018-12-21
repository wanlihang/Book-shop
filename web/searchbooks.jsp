<%--
  Created by IntelliJ IDEA.
  User: wanlihang
  Date: 2018/12/7
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>搜索书籍</title>
    <style>
        table{
            border-top: 1px solid #E5E5E5;
            margin: 80px auto;
            width: 1200px;
            border-collapse:collapse;
        }
        tr{
            border-bottom: 1px solid #E5E5E5;
        }
        td{
            border: 0px;
            text-align: center;
        }
        a{
            text-decoration: none;
            color:  #333;
        }
    </style>
</head>
<body>
    <h1 align="center">书籍目录</h1>
    <table align="center">
        <%
            String mesg = request.getParameter("mesg");
            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
            Connection conn = DriverManager.getConnection(url);
            String sql = "select name,id,image,price,description from book";
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            int i = 0;
            while (rs.next())
            {
                if (rs.getString("name").contains(mesg))
                {
                    i++;
        %>
            <tr>
                <td width="200px">
                    <a href="details.jsp?id=<%=rs.getString("id")%>" title="点击查看详情">
                        <img style="width: 80px; height: 80px;border: 1px solid #ededed;" src="images/bookStore/<%=rs.getString("image")%>.png">
                    </a>
                </td>
                <td width="700px">
                    <a href="details.jsp?id=<%=rs.getString("id")%>" title="点击查看详情">
                        《<%=rs.getString("description")%>》
                    </a>
                </td>
                <td width="300px" style="color: red;">
                    ¥<%=rs.getString("price")%>
                </td>
            </tr>

        <%
                }
            }
            if(i == 0){
        %>
            <h1 align="center">查无结果</h1>
            <p align="center">两秒后返回......</p>
        <%
                response.setHeader("refresh", "2;/index.jsp");
            }
        %>
    </table>
    <div align="center">
        <a href="index.jsp">返回</a>
    </div>
</body>
</html>
