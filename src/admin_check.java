import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "admin_check")
public class admin_check extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String une = request.getParameter("username");
        String pwd = request.getParameter("password");
        if (une.equals("我是管理员") && pwd.equals("aaa886")) {
            out.println(" <script> alert('管理员登录成功，点击返进入后台');</script>");
            HttpSession session = request.getSession();
            session.setAttribute("username","我是管理员");
            response.setHeader("refresh", "0;/adminPage.jsp");
        } else {
            out.println(" <script> alert('登录失败');</script>");
            response.setHeader("refresh", "0;/login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
