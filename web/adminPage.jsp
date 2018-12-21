<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>管理员界面</title>
<style>
    a
    {
        display: block;/*块状*/
        text-decoration: none;/*无下划线*/
        background-color: rgb(49,51,66);/*背景色*/
        height: 100%;
        line-height: 40px;/*字在块中高度*/
        font-size: 18px;/*字体大小*/
        color: white;/*字体颜色*/
    }
    a:hover,a:active
    {/*悬浮*/
        text-decoration: none;
        background-color: rgb(43,181,246);
    }
    iframe
    {
        width: 100%;
        height: 100%;
    }
    body{
        margin: 0;
    }
</style>
</head>

<body style="background-image: url(/images/bg.jpg);background-size: 100% 100%;">
<table border="0" style="width: 100%;height: 100%;text-align: center;vertical-align: center" cellspacing="0"><!--无边框，单元格间距0，文字居中-->
    <tr style="height: 200px;">
        <th style="background-color:rgb(49,51,66);" width="160px;" height="100px;">
            <img src="images/style/admintx.jpg"
                 style="width: 80px;height: 80px;border-radius: 40px; text-align: center">
            <p style="color: white"><%=session.getAttribute("username")%></p><!--管理员头像和ID，ID可改为从数据库获取-->
        </th>
        <th height="100%" rowspan="9"><!--跨6行-->
            <iframe name="iframe" frameborder="0" scrolling="auto"></iframe><!--用于显示页面，无边框-->
        </th>
    </tr>

    <tr style="height: 80px; background-color: rgb(49,51,66);">
        <td></td>
    </tr>

    <tr style="height: 40px;">
        <td style="text-align:center;">
            <a href="setBook.jsp" target="iframe">
                <img src="images/style/luru.jpg" style="width:20px; height:20px; border-radius: 30px;" >书籍录入
            </a>
        </td>
    </tr>

    <tr style="height: 40px;">
        <td style="text-align:center;">
            <a href="showOrders.jsp" target="iframe">
                <img src="images/style/chaxun.jpg"style="width:20px; height:20px; border-radius: 30px;">用户订单查询
            </a>
        </td>
    </tr>
    <tr style="height: 40px;">
        <td style="text-align:center;">
            <a href="changeOrdersState.jsp" target="iframe">
                <img src="images/style/xiugai.jpg"style="width:20px; height:20px; border-radius: 30px;">修改订单状态
            </a>
        </td>
    </tr>
    <tr style="height: 40px;">
        <td style="text-align:center;">
            <a href="searchUserNews.jsp" target="iframe">
                <img src="images/style/xiugai.jpg"style="width:20px; height:20px; border-radius: 30px;">查看用户信息
            </a>
        </td>
    </tr>
    <tr style="height: 40px;">
        <td style="text-align:center;">
            <a href="#" target="">
                留存后续功能
            </a>
        </td>
    </tr>
    <tr style="height: 400px; background-color: rgb(49,51,66);">
        <td></td>
    </tr>
    <tr bgcolor="#87cefa">
        <td>
            <a href="logout" >退出后台</a>
        </td>
    </tr>

</table>
</body>

</html>
