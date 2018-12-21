<%--
  Created by IntelliJ IDEA.
  User: zhaoyang
  Date: 2018/11/5
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/index.css">
    <title>获取书籍</title>
</head>
<body>
    <div class="sort clear">
    </div>
    <%
        String categoryID = request.getParameter("id");
        session.setAttribute("item", categoryID);            //将书的类别放到 item 中
        session.setAttribute("bookPage", "1");           //书籍页码重置为1，当类别切换时
        session.removeAttribute("pageNumber");              //书籍总数重置为1，当类别切换时
        String pages = (String)session.getAttribute("bookPage") ;

        Class.forName("org.sqlite.JDBC");
        String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
        String sql0 = "select count(*) num from book where category_id =" + categoryID ;
        Connection conn0 = DriverManager.getConnection(url);
        Statement stat0 = conn0.createStatement();
        ResultSet rs0 = stat0.executeQuery(sql0);
    %>
    <div class="prod-number">
        <span><%=rs0.getString("num")%></span>
    </div>

    <div class="cont-list clear" id="list-cont">
        <%
            String sql2 = "select id,name,author,price,image,description,category_id from book where category_id = " + categoryID +" limit ("+pages+"-1)*6,6";                      //分页，一页6本书

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
            <div class="text" style="word-break: break-all;">
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
            stat0.close();
            conn0.close();
            stat2.close();
            conn2.close();
        %>
    </div>

</body>
</html>
