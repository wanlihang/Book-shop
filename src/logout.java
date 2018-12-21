import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "logout")
public class logout extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        if (session.getAttribute("username") == null) {
            //out.println("");
            out.println("<script>alert('您还未登录！');</script>");
            response.setHeader("refresh", "0;/index.jsp");
        } else {
            session.removeAttribute("car");
            session.removeAttribute("username");
            session.removeAttribute("item");
            session.removeAttribute("pageNumber");
            session.removeAttribute("bookPage");
            out.println("<script>alert('注销成功，点击返回主页面');</script>");
            //out.println("");
            response.setHeader("refresh", "0;/index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
