import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = "/index.jsp";  // Đường dẫn đến trang index.jsp

        // Lấy action từ request
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // action mặc định là "join"
        }

        // Xử lý các action khác nhau
        if (action.equals("join")) {
            url = "/index.jsp";  // Trở về trang join
        } else if (action.equals("add")) {
            // Lấy các tham số từ request
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");

            // Lưu thông tin người dùng vào đối tượng User
            User user = new User(firstName, lastName, email);
            UserDB.insert(user);

            // Đặt đối tượng User vào request và chuyển tới trang thanks.jsp
            request.setAttribute("user", user);
            url = "/thanks.jsp";
        }

        // Chuyển hướng yêu cầu tới URL tương ứng
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
