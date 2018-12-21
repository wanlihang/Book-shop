
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "login_check")
public class login_check extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String une = request.getParameter("username");
        String pwd = request.getParameter("password");

        try {
            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
            String sql = "SELECT id,username ,password from user";
            Connection conn = DriverManager.getConnection(url);
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            boolean stau_login = false;
            while (rs.next()) {
                if (une.equals(rs.getString("username")) == true && pwd.equals(rs.getString("password")) == true) {
                    HttpSession session = request.getSession();
                    //ArrayList car = new ArrayList();
                    session.setAttribute("username", une);
                    //session.setAttribute("car", car);
                    stau_login = true;

                    out.println(" <script> alert('登录成功，点击返回主界面');</script>");
                    response.setHeader("refresh", "0;/index.jsp");
                    break;
                }
            }
            stat.close();
            conn.close();
            //登陆失败，返回登陆页面
            if (stau_login == false) {
                out.println(" <script> alert('登录失败，可能用户名或密码错误，点击返回主界面');</script>");
                response.setHeader("refresh", "0;/login.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
