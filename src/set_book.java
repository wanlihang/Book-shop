import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "set_book")
public class set_book extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String category_id = request.getParameter("category_id");
        String bookname = request.getParameter("bookname");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        String image = request.getParameter("image");
        String description = request.getParameter("description");

        try {
            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:D:/javaweb/bookstore.db";
            String sql = "Insert into book(name,author,price,image,description,category_id) values (?,?,?,?,?,?)";
            Connection conn = DriverManager.getConnection(url);
            PreparedStatement stat = conn.prepareStatement(sql);
            stat.setString(1, bookname);
            stat.setString(2, author);
            stat.setString(3, price);
            stat.setString(4, image);
            stat.setString(5, description);
            stat.setString(6, category_id);
            //  stat.setBinaryStream(3,fis,l2);
            int rs1 = stat.executeUpdate();

            if (rs1 > 0)
                //out.println("成功添加"+rs1+"行<br>两秒后自动跳转到登录界面");
                out.println(" <script> alert('成功!');</script>");
            stat.close();
            conn.close();
            response.setHeader("refresh", "0;/setBook.jsp");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (
                SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
