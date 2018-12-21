<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>显示书籍</title>
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
            background: #5599FF;
        }

        .form {
            width: 800px;
            height: 300px;
            font-family: verdana, arial, sans-serif;
            font-size: 11px;
            font-family: "微软雅黑 Light";
            color: #333333;
            border-width: 1px;
            border-color: #999999;
            border-collapse: collapse;
            font-size: 20px;
        }</style>
</head>
<body>
<center>
    <form class="form" action="searchUserNews2.jsp" method="post" style="margin-top: 200px">
        <label style="font-size: 30px;">用户名:</label>
        <input style="width:600px;height:50px;font-size: 20px;text-align: center" name="id" class="form-control"
               type="text" placeholder=请输入用户名>
        <br>
        <br>
        <br>
        <button class="button" type="submit">查询</button>
        <button class="button" data-dismiss="modal">取消</button>
    </form>
</center>
</body>
</html>