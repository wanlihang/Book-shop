<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/2
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.String" %>
<html>
<head>
    <title>书籍详情</title>
    <style>
        body
        {
            width: 99%;
            height: 98%;
            position: relative;
            background: url(images/style/4.jpg) center top;/*以最上、最中间为原点*/
            background-size: cover;/*把背景图像扩展至足够大*/

        }
        .detail_right
        {
            width: 450px;
            height: 400px;
            position: absolute;
            top: 20%;
            left: 48%;
            background: lightskyblue;

            border-radius: 10px;/*圆角*/
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
            z-index: 100;/*元素置顶*/
            padding: 20px;/*内边距20*/
            box-sizing: border-box;/*防止撑开盒子*/
        }
        .detail_right::before {
            content: "";
            position: absolute;
            top: 0px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            z-index: -1;/*-1 可以当背景*/
            -webkit-filter: blur(10px);/*filter设置透明度*/
            filter: blur(20px);
            margin: -20px;  /*消除边缘透明*/
            background: url(images/style/4.jpg) center top;
            background-size: cover;/*平铺，把背景图像扩展至足够大*/
            background-attachment: fixed;/*位置固定*/
        }
        .detail_nam
        {
            font-family: DFKai-SB;/*楷体*/
            font-size: 3em;
            text-align: center;
        }
        .detail_aut
        {
            font-family: DFKai-SB;
            font-size: 4.5mm;
            text-align: center;
        }
        .detail_pri
        {
            font-family: DFKai-SB;
            font-size: 6mm;
            text-align: center;
        }

        .detail_des
        {
            font-family: DFKai-SB;
            font-size: 6mm;
            text-indent: 2em;
        }
        a.button {
            display: block;
            float: left;
            position: relative;
            height: 30px;
            width: 85px;
            margin: 0 0px 18px 300px;/*外边距，上右下左*/
            text-decoration: none;
            font: 16px "Microsoft YaHei", Helvetica, Arial, sans-serif;/*大小，字体*/
            font-weight: bold;/*正常粗细*/
            line-height: 25px;/*行高*/
            text-align: center;
            -webkit-border-radius: 3px;/*-webkit- ，针对safari，chrome浏览器的内核CSS写法*/
            -moz-border-radius: 3px;/*-moz-，针对firefox浏览器的内核CSS写法*/
            border-radius: 3px;
        }
        a.button:active {
            border: none;
            bottom: -4px;
            margin-bottom: 22px;
            -webkit-box-shadow: 0 1px 1px #fff;
            -moz-box-shadow:  0 1px 1px #fff;
            box-shadow:  1px 1px 0 #fff, inset 0 1px 1px rgba(0, 0, 0, 0.3);/*向框添加一个或多个阴影。inset:将外部阴影 (outset) 改为内部阴影。*/
        }
        a.button:active:before, a.button:active:after {
            border: none;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }
        a.button:before, a.button:after
        {
            content: '';
            position: absolute;
            left: -1px;
            height: 25px;
            width: 80px;
            bottom: -1px;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
        }
        a.button:before
        {
            height: 23px;
            bottom: -4px;
            border-top: 0;
            -webkit-border-radius: 0 0 3px 3px;
            -moz-border-radius: 0 0 3px 3px;
            border-radius: 0 0 3px 3px;
            -webkit-box-shadow: 0 1px 1px 0px #bfbfbf;
            -moz-box-shadow: 0 1px 1px 0px #bfbfbf;
            box-shadow: 0 1px 1px 0px #bfbfbf;
        }
        a.gray,a.gray:hover, a.gray:visited
        {
            color: #555;
            border-bottom: 4px solid #b2b1b1;
            text-shadow: 0px 1px 0px #fafafa;
            background: #eee;
            background: -webkit-gradient(linear, left top, left bottom, from(#eee), to(#e2e2e2));/*gradient 渐变属性*/
            background: -moz-linear-gradient(top,  #eee,  #e2e2e2);
            box-shadow: inset 1px 1px 0 #f5f5f5;
        }
        .gray,.gray:hover
        {
            color: #555;
            border-bottom: 4px solid #b2b1b1;
            background: #eee;
        }
        .gray:hover
        {
            background: #e2e2e2;
        }
        .gray:before, .gray:after
        {
            border: 1px solid #cbcbcb;
            border-bottom: 1px solid #a5a5a5;
        }
        .gray:hover
        {
            background: #e2e2e2;
            background: -webkit-gradient(linear, left top, left bottom, from(#e2e2e2), to(#eee));
            background: -moz-linear-gradient(top,  #e2e2e2,  #eee);
        }
        .detail_img
        {
            width: 360px;
            height: 400px;
            position: absolute;
            top: 20%;
            left: 18%;
            z-index: 100;
        }
    </style>
</head>
<body>
    <%
        Class.forName("org.sqlite.JDBC");
        String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
        String newid= request.getParameter("id");
        String sql = "select name,author,price,image,description,category_id from book"
                +" where id = " + newid;
        Connection conn = DriverManager.getConnection(url);
        Statement stat = conn.createStatement();
        ResultSet rs = stat.executeQuery(sql);
        while (rs.next())
        {
    %>
        <div class="detail_main">
            <div class="detail_img">
                <img src="images/bookStore/<%=rs.getString("image")%>.png">
            </div>
            <div class="detail_right">
                <div class="detail_nam"><%=rs.getString("name")%></div>
                <div class="detail_aut"><%="作者/译者："+rs.getString("author")%></div>
                <div class="detail_des"><%=rs.getString("description")%></div>
                <div class="detail_pri"><%="价格："+rs.getString("price")+"元"%></div>
                <a href="index.jsp" target="_self" class="button gray">返回首页</a>
            </div>
        </div>
    <%
    }
    stat.close();
    conn.close();
    %>
</body>
</html>
