<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>加入购物车</title>
</head>
<body>

    <%
        if (session.getAttribute("username") == null) {//若未登录就拒绝访问
            // out.println("您未登录，请先登录！");
            out.println("<script>alert('您还未登录！');</script>");
            //response.sendRedirect("index.jsp");
            response.setHeader("refresh", "0;/index.jsp");
        } else {
            String name = request.getParameter("name");
            out.println(name);
            out.println(name);
            out.println(name);
            String username = (String) session.getAttribute("username");
            String id = null, newSql = null, price = null;
            int num = 0;
            Class.forName("org.sqlite.JDBC");//连接数据库
            String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
            Connection conn = DriverManager.getConnection(url);
            Statement stat = conn.createStatement();
            String sql1 = "select id,price from book where name='" + name + "'";//查询book表
            ResultSet rs = stat.executeQuery(sql1);
            while (rs.next()) {
                id = rs.getString("id");
                price = rs.getString("price");
            }
            String sql2 = "select count(*) from orderitem where book_id='" + id +
                    "' and username='" + username + "'";//查询orderitem表
            ResultSet t = stat.executeQuery(sql2);
            while (t.next()) {
                num = t.getInt("count(*)");
            }
            if (num == 0) {//若无记录则插入
                newSql = "insert into orderitem(quantity,price,username,book_id) values(?,?,?,?)";
                PreparedStatement sta = conn.prepareStatement(newSql);//插入到购物车
                sta.setString(1, "1");
                sta.setString(2, price);
                sta.setString(3, username);
                sta.setString(4, id);
                int i = sta.executeUpdate();
                out.println("成功添加" + i + "行");
                sta.close();
            } else {//若有记录则将quantity加一
                newSql = "update orderitem set quantity=quantity+1 where book_id='" + id +
                        "' and username='" + username + "'";
                int i = stat.executeUpdate(newSql);

            }
            stat.close();
            conn.close();
            out.println("<script>alert('购物车添加成功！');</script>");
            //  response.setContentType("text/html;charset=utf-8");
            response.setHeader("refresh", "0;/index.jsp");
       }
    %>
</body>
</html>