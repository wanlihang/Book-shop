<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/index.css">
    <title>我的书店</title>
    <style>
        .button { /* 按钮美化 */
            padding:5px;
            width: 80px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: white; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: black; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }
    </style>
</head>
<body>

<%--top--%>
    <div class="site-nav-bg">
        <div class="site-nav w1200">
            <p class="sn-back-home">
                <i><a href="#"><img style="width: 25px; height: 25px; margin-top: 4px" src="/images/home.jpg"></a></i>
            </p>
            <div class="sn-quick-menu">

                <%
                if (session.getAttribute("username") == null) {
                    String li = "<div class=\"login\"><a href=\"login.jsp\"><img src=\"/images/lo1.png\"  height=\"20px\"></a></div>";

                    String r = "<div class=\"login\"><a href=\"register.jsp\"><img src=\"/images/re1.png\"  height=\"20px\"></a></div>";

                    out.print(li);
                    out.print(r);

                } else {
                    out.println("<div class=\"login\" style=\"color: #4F271F; font-size: 18px; margin-top: 0px;\">欢迎您，" + session.getAttribute("username") + "</div>");
                }
                %>
                <div class="login"></div>
                <div class="login"><a href="show_cars.jsp"><img src="/images/car1.png" width="20px" height="20px"></a></div>
                <div class="login"></div>
                <div class="sp-cart"><a href="logout"><img src="/images/zhuxiao1.png" width="20px" height="20px"></a><span></span></div>
            </div>
        </div>
    </div>
<%--header--%>
    <div class="header">
        <div class="headerLayout w1200">
            <div class="headerCon">
                <h1 class="mallLogo">如玉黄金阁</h1>
                <div class="mallSearch">
                    <form action="searchbooks.jsp" class="layui-form" novalidate>
                        <input type="text" name="mesg" required lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
                        <button>
                            <i>搜索</i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

<%--comtent--%>
<div class="content content-nav-base index-content" style="height: 100%;">
    <div class="commod-cont-wrap">
        <div class="commod-cont w1200 clear">
            <div class="left-nav">

                <div class="title">书籍类别</div>
                <div align="center">
                    <%
                        //给 item 赋初值为 1 ，代表现在的书籍类别是 1，
                        if(session.getAttribute("item")==null){
                            session.setAttribute("item", "1");
                        }
                        //开始的页码为1
                        if(session.getAttribute("bookPage")==null){
                            session.setAttribute("bookPage", "1");
                        }
                        //当从其他地方跳转回来，返回上次的书籍类别目录
                        String item = (String)session.getAttribute("item");
                        String pages = (String)session.getAttribute("bookPage");


                        Class.forName("org.sqlite.JDBC");
                        String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
                        String sql = "select id,name,description from category ";
                        Connection conn = DriverManager.getConnection(url);
                        Statement stat = conn.createStatement();
                        ResultSet rs = stat.executeQuery(sql);
                        while (rs.next()) {
                    %>
                    <dl>
                        <dt>
                            <a onclick="showBook(<%=rs.getString("id")%>)"><%=rs.getString("name")%></a>
                        </dt>
                    </dl>
                    <%
                        }
                    %>
                </div>
            </div>

            <div class="right-cont-wrap">
                <div class="right-cont" id="book">
                    <div class="sort clear">
                    </div>

                    <%

                        String sql0 = "select count(*) num from book where category_id =" + item;
                        Connection conn0 = DriverManager.getConnection(url);
                        Statement stat0 = conn0.createStatement();
                        ResultSet rs0 = stat0.executeQuery(sql0);
                    %>
                    <div class="prod-number">
                        <span><%=rs0.getString("num")%></span>
                    </div>

                    <div class="cont-list clear" id="list-cont">
                        <%
                            String sql2 = "select id,name,author,price,image,description,category_id from book where category_id = " + item +" limit ("+pages+"-1)*6,6";
                            Connection conn2 = DriverManager.getConnection(url);
                            Statement stat2 = conn2.createStatement();
                            ResultSet rs2 = stat2.executeQuery(sql2);
                            while (rs2.next()) {
                        %>
                        <div class="item">
                            <div class="img">
                                <a href="details.jsp?id=<%=rs2.getString("id")%>" title="点击查看详情">
                                    <div style="width: 280px; height: 220px; margin-top: 15px; text-align: center;">
                                        <img style="width: 200px; height: 200px;" src="images/bookStore/<%=rs2.getString("image")%>.png">
                                    </div>
                                </a>
                            </div>
                            <div class="text"  style="word-break: break-all;">
                                <p class="title"><%=rs2.getString("name")%></p>
                                <p class="descri">
                                    <%
                                        String descrip = "";
                                        if(rs2.getString("description").length()<46){
                                            descrip = rs2.getString("description");
                                        }
                                        else{
                                            descrip = rs2.getString("description").substring(0,43) + "......";
                                        }
                                    %>
                                    &nbsp;&nbsp;
                                    <%=descrip%>
                                </p>
                                <p class="price">
                                    <span class="pri">¥<%=rs2.getString("price")%></span>
                                    <span class="nub"><a href="add_car.jsp?name=<%=rs2.getString("name")%>">加入购物车</a></span>
                                </p>
                            </div>
                        </div>
                        <%
                            }
                            stat.close();
                            conn.close();
                            stat0.close();
                            conn0.close();
                            stat2.close();
                            conn2.close();
                        %>
                    </div>
                </div>
                <!-- 分页栏 -->
                <div align="center">
                    <a href="page2.jsp?page=-1" class="button">上一页</a>
                    <a href="page2.jsp?page=1" class="button">下一页</a>
                </div>
            </div>



        </div>
    </div>
</div>


<script type="text/javascript">
    var xmlHttp;
    function showBook(categoryID) {
        xmlHttp = GetXmlHttpObject();
        if (xmlHttp == null) {
            alert("Browser does not support HTTP Request");
            return
        }
        var url = "getBook.jsp";
        url = url + "?id=" + categoryID;
        url = url + "&sid=" + Math.random();
        xmlHttp.onreadystatechange = stateChanged;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }
    function stateChanged() {
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
            document.getElementById("book").innerHTML = xmlHttp.responseText
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
</body>
</html>
