<%--
  Created by IntelliJ IDEA.
  User: wanlihang
  Date: 2018/11/25
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>购物车</title>
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

            font-family: "微软雅黑 Light";
            color: #333333;
            border-width: 1px;
            border-color: #999999;
            border-collapse: collapse;

            width: 1000px;
        }
        th{height: 40px; font-size: 15px; font-family: 微软雅黑;}
        td {
            line-height: 30px;
            font-size: 15px;
            color: #666666;
        }
        .shopping_content{width: 1210px;margin: auto;position: relative;}
        .momey_input
        {
            border-radius: 5px;
            outline: 0px;
            height: 20px;
            width: 50px;
            border: 1px solid #CCCCCC;
            text-align: center;
        }
        .div_outMumey
        {
            height: 40px;
            width: 130px;
            border-radius: 5px;
            background: #CCCCCC;
            color: white;
            text-align: center;
            line-height: 40px;
            font-size: 20px;
            margin-left: -875px;
            margin-top: 10px;
        }

    </style>
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript">
        $(function() {
            var zz=document.getElementsByClassName("span_momey");
            var cc=document.getElementsByClassName("momey_input");
            var i=0,b=0;
          for(i=0;i<zz.length;i++)
            {
                b+=parseFloat(zz[i].innerHTML)*parseFloat(cc[i].value);
            }
            var out_momey = $(".out_momey");
            out_momey.html(b);
        })
    </script>
</head>
<body>
<%
    if (session.getAttribute("username") == null) {
        out.println("<script>alert('请先登录');</script>");
        response.setHeader("refresh", "0;/index.jsp");
    } else {
%>

<div>


    <script> <!-- 判断复选框是否选中,如果为0则不提交-->

    function checkForm() {
        var list = document.getElementsByTagName("input");
        for (var i = 0; i < list.length; i++) {
            if (list[i].type == "checkbox" && list[i].checked)
                break;
        }
        if (i == list.length) {
            alert("请至少选择一本书籍");
            return false;
        }
        return true;
    }
    </script>

    <center>
        <div class="shopping_content">
            <div class="shopping_table">
        <table class="hovertable" border="solid" style="margin-top: 70px;text-align: center" rules="rows" >
            <caption style="font-size: 31px;font-family:微软雅黑 Light"><%=session.getAttribute("username")%>的购物车</caption>
            <tr>

                <th>选择订单</th><th>图片</th>
                <th>数量</th>
                <th>单价</th>
                <th>书籍编号</th>
                <th>书籍名称</th>
                <th>修改/删除</th>
            </tr>
            <%
                Class.forName("org.sqlite.JDBC");
                String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
                String sql = "SELECT orderitem.id,orderitem.quantity,orderitem.price,orderitem.book_id,book.image, orderitem.username ,book.name from orderitem,book where orderitem.book_id=book.id and orderitem.username='" + session.getAttribute("username") + "'";
                Connection conn = DriverManager.getConnection(url);
                Statement stat = conn.createStatement();
                ResultSet rs = stat.executeQuery(sql);
                while (rs.next()) {
            %>
            <tr>

                <td>
                    <input type="checkbox" name="book_group" form="form1" value="<%=rs.getString("book_id")%>">
                </td>
                <td>
                    <img width="100px" height="100px" src="images/bookStore/<%=rs.getString("image")%>.png">
                </td>


                <td align="center" valign="middle">
                    <form style="margin-bottom: 0px">
                        <input class="momey_input" type="number" min="1" max="99" maxlength="2"
                               value="<%=rs.getString("quantity")%>" id=<%=rs.getString("id")%>>
                    </form>
                </td>
                <td class="span_momey">
                    <%=rs.getString("price")%>
                </td>
                <td>
                    <%=rs.getString("book_id")%>
                </td>
                <td>
                    <%=rs.getString("name")%>
                </td>
                <td align="center">
                    <table align="center">
                        <tr align="center">
                            <form>
                                <td align="center">
                                    <input type="submit" onclick="changeQuantity(<%=rs.getString("id")%>)"
                                           class="button" value="修改数量">
                                </td>
                                <td align="center">
                                    <input type="submit" onclick="deleteOrderitem(<%=rs.getString("id")%>)" value="删除"
                                           class="button">
                                </td>
                            </form>
                        </tr>
                    </table>
                </td>
            </tr>
            <%
                }
                stat.close();
                conn.close();
            %>
        </table>
                <div class="div_outMumey"  >
                    总价：<span class="out_momey"></span>
                </div>

            </div></div>
        <hr>

        <br> <br>
        <br>
        <form action="orderitem.jsp" method="post" id="form1">
            <input type="submit" vlaue="结算" class="button" onclick="return checkForm();" >


        </form>

    </center>
</div>
<center>
    <a href="orders.jsp" style="display: block">
        <button class="button" style="width: 200px">查看我的订单</button>
    </a><br>
    <a href="index.jsp" style="display: block">
    <button class="button" style="width: 200px">离开购物车</button>
</a>
</center>

<script type="text/javascript">
    var xmlHttp;

    function changeQuantity(id) {
        var value = document.getElementById(id).value;
        if (value < 1 || value >99) {
            alert("修改失败");
            return;
        }
        xmlHttp = GetXmlHttpObject();
        if (xmlHttp == null) {
            alert("Browser does not support HTTP Request");
            return;
        }
        var url = "changeQuantity.jsp";
        url = url + "?id=" + id + "&quantity=" + value;
        url = url + "&sid=" + Math.random();
        xmlHttp.onreadystatechange = stateChanged;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
        // if(this.form.)
        alert("修改成功");
    }

    function deleteOrderitem(id) {
        xmlHttp = GetXmlHttpObject();
        if (xmlHttp == null) {
            alert("Browser does not support HTTP Request");
            return;
        }
        var url = "changeQuantity.jsp";
        url = url + "?id=" + id;
        url = url + "&sid=" + Math.random();
        xmlHttp.onreadystatechange = stateChanged;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
        alert("删除成功");
    }

    function stateChanged() {
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
            document.getElementById("txtHint").innerHTML = xmlHttp.responseText;
        }
    }

    function GetXmlHttpObject() {
        var xmlHttp = null;
        try {
            // Firefox, Opera 8.0+, Safari
            xmlHttp = new XMLHttpRequest();
        }
        catch (e) {
            //Internet Explorer
            try {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            }
            catch (e) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
        }
        return xmlHttp;
    }
</script>
<%}%>
</body>
</html>
