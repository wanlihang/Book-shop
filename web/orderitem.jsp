<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>产生订单</title>
</head>
<body>
<%
    String[] book_group = request.getParameterValues("book_group");
    String tmp = "";
    String endstr = "";
    int i;
    for (i = 0; i < book_group.length; i++) {
        //  out.println(book_group[i]);
        tmp += "'" + book_group[i] + "'";
        if (i < book_group.length - 1)
            tmp += ",";
        endstr += tmp;
    }
    double money = 0;
    i = 0;
    double[] price = new double[book_group.length + 1];
    int[] quantity = new int[book_group.length + 1];
    //price[0]=0.0; quantity[0]=0;
    Class.forName("org.sqlite.JDBC");
    String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
    String sql = "select price from orderitem where book_id in(" + endstr + ")";
    String sql2 = "select quantity from orderitem where book_id in(" + endstr + ")";


    Connection conn = DriverManager.getConnection(url);
    Connection conn2 = DriverManager.getConnection(url);
    Connection conn3 = DriverManager.getConnection(url);

    Statement stat = conn.createStatement();
    Statement stat2 = conn2.createStatement();

    ResultSet rs = stat.executeQuery(sql);
    while (rs.next()) {
        price[i++] = rs.getDouble("price");
    }
    stat.close();
    conn.close();
    rs = stat2.executeQuery(sql2);
    i = 0;
    while (rs.next()) {
        quantity[i++] = Integer.parseInt(rs.getString("quantity"));
    }
    stat2.close();
    conn2.close();
    for (i = 0; i < book_group.length; i++) {
        money += quantity[i] * price[i];
    }
    String sql3 = "insert into orders (ordertime,price,state,username) values(?,?,?,?)";
    PreparedStatement pstat = conn3.prepareStatement(sql3);
    long time = System.currentTimeMillis();
    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    pstat.setString(1, String.valueOf(sd.format(new Date(time))));
    pstat.setString(2, String.valueOf(money));
    pstat.setString(3, "0");
    pstat.setString(4, (String) session.getAttribute("username"));
    int rs3 = pstat.executeUpdate();
    if (rs3 > 0)
        out.println("<script>alert('订单提交成功，等待后台确定');</script>");
    //out.println("<script>alert('');</script>");
    pstat.close();
    conn3.close();
    response.setHeader("refresh", "0;/show_cars.jsp");
%>
</body>
</html>
