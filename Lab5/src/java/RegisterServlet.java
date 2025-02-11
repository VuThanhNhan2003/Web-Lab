import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String fullName = request.getParameter("fullName");
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String field = request.getParameter("field");
        String[] subjects = request.getParameterValues("subject");
        String comments = request.getParameter("comments");

        RegisterForm registerForm = new RegisterForm();
        registerForm.setFullName(fullName);
        registerForm.setId(id);
        registerForm.setEmail(email);
        registerForm.setGender(gender);
        registerForm.setField(field);
        registerForm.setSubjects(subjects);
        registerForm.setComments(comments);

        request.setAttribute("registerForm", registerForm);
        RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
        dispatcher.forward(request, response);
    }
}
