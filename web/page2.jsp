<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: zhaoyang
  Date: 2018/12/11
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书的分页</title>
</head>
<body>
<%
    String item = (String)session.getAttribute("item");    //书籍类别号
    String thisPage = (String)session.getAttribute("bookPage"); //书籍当前页码号
    String pageNumber = new String();                          //该类别书籍数量
    String addPage = request.getParameter("page");                //判断加还是减页

    if (session.getAttribute("pageNumber") == null) {
        Class.forName("org.sqlite.JDBC");
        String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
        Connection conn = DriverManager.getConnection(url);
        String sql = "select count(*) from book where category_id =" + item;//该类别的书籍总数量
        Statement stat = conn.createStatement();
        ResultSet rs = stat.executeQuery(sql);
        while (rs.next()) {
            pageNumber = rs.getString("count(*)");        //获取该类书籍的总本数
            session.setAttribute("pageNumber", pageNumber);          //将本类别的数据放入session
        }
    }
    else {
        pageNumber = (String)session.getAttribute("pageNumber");
    }
    if(addPage.equals("-1")){
         if(thisPage.equals("1")) {
             response.sendRedirect("index.jsp");                      //第一页时，不在向前翻页
         }
          else {
             String pages = String.valueOf(Integer.parseInt(thisPage) + Integer.parseInt(addPage));
             session.setAttribute("bookPage", pages);
             response.sendRedirect("index.jsp");
         }

    }
    else{

      if ( Integer.parseInt(thisPage) ==( (Integer.parseInt( pageNumber ) -1 ) / 6 +1 ) ){
            response.sendRedirect("index.jsp");                              //最后一页时，不在翻页
      }
      else {
           String pages = String.valueOf(Integer.parseInt(thisPage) + Integer.parseInt(addPage));
           session.setAttribute("bookPage", pages);
           response.sendRedirect("index.jsp");
       }
    }


%>
</body>
</html>
