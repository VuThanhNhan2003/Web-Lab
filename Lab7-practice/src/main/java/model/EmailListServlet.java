package model;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class EmailListServlet extends HttpServlet {
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");


        String url = "/index.jsp";  // Đường dẫn đến trang mặc định

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
        } else if (action.equals("show")) {
            // Lấy danh sách người dùng từ cơ sở dữ liệu
            List<User> users = UserDB.getAll();
            request.setAttribute("users", users);   // Đặt danh sách vào request
            url = "/user-list.jsp";  // Chuyển tới trang user-list.jsp
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
