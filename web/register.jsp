<%--
  Created by IntelliJ IDEA.
  User: zhaoyang
  Date: 2018/11/30
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <style type="text/css">
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
            background: url(images/style/1.jpg) center top;
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
            box-sizing: border-box; /*不会把盒子撑开*/
        }

        .content::before {
            content: "";
            position: absolute;
            top: 0px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            z-index: -1; /*-1 可以当背景*/
            -webkit-filter: blur(10px);
            filter: blur(20px);
            margin: -30px; /*消除边缘透明*/
            background: url(/images/style/1.jpg) center top;
            background-size: cover; /*平铺*/
            background-attachment: fixed; /*位置固定*/
        }

        .t1 {
            position: absolute;
            top: 26%;
            left: 33%;
        }

        input.button {
            display: block;
            float: left;
            position: relative;
            height: 30px;
            width: 85px;
            margin: 0 90px 18px 0;
            text-decoration: none;
            font: 16px "Microsoft YaHei", Helvetica, Arial, sans-serif;
            font-weight: bold;
            line-height: 25px;
            text-align: center;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
        }

        input.button:active {
            border: none;
            bottom: -4px;
            margin-bottom: 22px;

            -webkit-box-shadow: 0 1px 1px #fff;
            -moz-box-shadow: 0 1px 1px #fff;
            box-shadow: 1px 1px 0 #fff, inset 0 1px 1px rgba(0, 0, 0, 0.3);
        }

        input.button:active:before, input.button:active:after {
            border: none;

            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        input.button:before, input.button:after {
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

        input.button:before {
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

        input.gray, input.gray:hover, input.gray:visited {
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
        label{
            display:inline-block;
            width: 80px;
            text-align: justify;
            text-align-last: justify;
        }

    </style>
</head>
<body>
<div class="main">
    <a href="index.jsp" style="text-decoration: none;color: #814021;"><-返回首页</a>
    <div class="content">

        <h1 style="text-align: center; color: #814021; font-size: 30px;font-weight: 700;">注册</h1>
        <form action="register_check" method="post">

            <div class="t1">

                <label>姓名</label>：<input type="text" name="username" required><br>
                <label>密码</label>：<input type="password" name="password" required><br>
                <label>手机号</label>：<input type="tel" name="phone"><br>
                <label>座机号</label>：<input type="tel" name="cellphone"><br>
                <label>邮箱号码</label>：<input type="email" name="email"><br>
                <label>地址</label>：<input type="text" name="address"><br><br>
                <input type="submit" value="注册" class="button gray">
                <input type="reset" value="重置" class="button gray">
            </div>
        </form>
    </div>
</div>
</body>
</html>
