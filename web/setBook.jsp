<%--
  Created by IntelliJ IDEA.
  User: zhaoyang
  Date: 2018/12/1
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍录入</title>
    <style>
        form {
                    width: 400px;
                    margin: 20px;
                    align: center;
                }

        * {
            margin: 0px;
            padding: 0px;
        }

        html, body {
            font-size: 19px;
            font-family: 'Verdana', 'Arial';
            color: rgba(0, 0, 0, 0.8);
            width: 100%;
            height: 100%;
        }

        .main {
            width: 100%;
            height: 100%;
            position: relative;
            background: url(/images/style/1.jpg) center top;
            background-size: cover;
        }

        .content {
            width: 800px;
            height: 400px;
            position: absolute;
            top: 40%;
            left: 50%;
            overflow: hidden;
            margin-top: -200px;
            margin-left: -400px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
            z-index: 100;
            padding: 50px;
            box-sizing: border-box;
            /*不会把盒子撑开*/
        }

        .content::before {
            content: "";
            position: absolute;
            top: 0px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            z-index: -1;
            /*-1 可以当背景*/
            -webkit-filter: blur(10px);
            filter: blur(20px);
            margin: -30px; /*消除边缘透明*/
            background: url(/images/style/1.jpg) center top;
            background-size: cover;
            /*平铺*/
            background-attachment: fixed;
            /*位置固定*/
        }

        .t1 {
            position: absolute;
            top: 22%;
            left: 28%;
        }

        input.button, a.button {
            display: block;
            float: left;
            position: relative;
            height: 30px;
            width: 85px;
            margin: 0 108px 18px 0;
            text-decoration: none;
            font: 16px "Microsoft YaHei", Helvetica, Arial, sans-serif;
            font-weight: bold;
            line-height: 25px;
            text-align: center;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
        }

        input.button:active, a.button:active {
            border: none;
            bottom: -4px;
            margin-bottom: 22px;

            -webkit-box-shadow: 0 1px 1px #fff;
            -moz-box-shadow: 0 1px 1px #fff;
            box-shadow: 1px 1px 0 #fff, inset 0 1px 1px rgba(0, 0, 0, 0.3);
        }

        input.button:active:before, input.button:active:after,
        a.button:active:before, a.button:active:after {
            border: none;

            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        input.button:before, input.button:after, a.button:before, a.button:after {
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

        input.button:before, a.button:before {
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

        input.gray, input.gray:hover, input.gray:visited, a.gray, a.gray:hover, a.gray:visited {
            color: #555;
            border-bottom: 4px solid #b2b1b1;
            text-shadow: 0px 1px 0px #fafafa;

            background: #eee;
            background: -webkit-gradient(linear, left top, left bottom, from(#eee), to(#e2e2e2));
            background: -moz-linear-gradient(top, #eee, #e2e2e2);

            box-shadow: inset 1px 1px 0 #f5f5f5;
        }

        .gray, .gray:hover {
            color: #555;
            border-bottom: 4px solid #b2b1b1;
            background: #eee;
        }

        .gray:hover {
            background: #e2e2e2;
        }

        .gray:before, .gray:after {
            border: 1px solid #cbcbcb;
            border-bottom: 1px solid #a5a5a5;
        }

        .gray:hover {
            background: #e2e2e2;
            background: -webkit-gradient(linear, left top, left bottom, from(#e2e2e2), to(#eee));
            background: -moz-linear-gradient(top, #e2e2e2, #eee);
        }
    </style>
</head>

<body>
<%
    Class.forName("org.sqlite.JDBC");
    String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
    String sql = "SELECT id,name from category ";
    Connection conn = DriverManager.getConnection(url);
    Statement stat = conn.createStatement();
    ResultSet rs = stat.executeQuery(sql);
%>
<div class="main">
    <div class="content">
        <form action="set_book" method="post">
            <div class="t1">
                <fieldset>
                    <legend>书籍录入</legend>
                    <label>书籍类别：
                        <select name="category_id">
                            <%
                                while (rs.next()) {
                            %>
                            <option value=<%=rs.getString("id")%>><%=rs.getString("name")%>
                            </option>
                            <%}%>
                        </select>
                    </label><br>
                    <label>书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" name="bookname" autofocus required maxlength="15"></label><br>
                    <label>作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：<input type="text" name="author" required maxlength="20"></label><br>
                    <label>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：<input type="number" name="price" min="1" required maxlength="7"></label><br>
                    <label>图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片：<input type="text" name="image" required></label><br>
                    <label>书籍描述：<input type="textarea" maxlength="100" name="description" required></label>
                    <label>
                    </label>
                </fieldset>
                <br>
                <input type="submit" value="录入" class="button gray">
                <input type="reset" value="重置" class="button gray">
            </div>
        </form>
    </div>
</div>

</body>
</html>
