import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/GetInfor")
public class GetInfor extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form trong request
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String major = request.getParameter("major");
        String interest = request.getParameter("interest");

        // Thiết lập các thuộc tính (attributes) để chuyển tới trang result.jsp
        request.setAttribute("id", id);
        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("gender", gender);
        request.setAttribute("major", major);
        request.setAttribute("interest", interest);

        // Chuyển tiếp request và response tới trang result.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
        dispatcher.forward(request, response);
    }
}
