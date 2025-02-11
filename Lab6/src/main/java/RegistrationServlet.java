import model.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        String courseId = request.getParameter("courseId");

        try (Connection conn = DBConnection.getConnection()) {
            if (courseId != null) {
                // Add registration
                String insertSQL = "INSERT INTO Registrations (student_id, course_id) VALUES (?, ?)";
                try (PreparedStatement ps = conn.prepareStatement(insertSQL)) {
                    ps.setInt(1, Integer.parseInt(studentId));
                    ps.setInt(2, Integer.parseInt(courseId));
                    ps.executeUpdate();
                }
            }
            // Redirect to the Registration page with studentId
            response.sendRedirect("Registration.jsp?studentId=" + studentId);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
