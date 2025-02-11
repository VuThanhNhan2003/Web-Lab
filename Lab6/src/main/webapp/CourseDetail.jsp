<%@page import="model.DBConnection"%>
<%@ page import="java.sql.*, model.Course" %>
<%
    String courseId = request.getParameter("courseId");
    Course course = null;

    try (Connection conn = DBConnection.getConnection()) {
        String query = "SELECT * FROM Courses WHERE course_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, Integer.parseInt(courseId));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                course = new Course(rs.getInt("course_id"), rs.getString("course_name"));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Course's Details</title>
</head>
<body>
    <h1>Course's Details</h1>
    <p>Course ID: <%= course != null ? course.getCourseId() : "Not Found" %></p>
    <p>Course Name: <%= course != null ? course.getCourseName() : "Not Found" %></p>
    <h2>Student List:</h2>
    <table>
        <tr>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Action</th>
        </tr>
        <%
            // Fetch registered students for this course
            String query = "SELECT s.student_id, s.student_name FROM Students s " +
                           "JOIN Registrations r ON s.student_id = r.student_id " +
                           "WHERE r.course_id = ?";
            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setInt(1, Integer.parseInt(courseId));
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("student_id") %></td>
            <td><%= rs.getString("student_name") %></td>
            <td><a href="#">Remove</a></td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </table>
    <a href="CourseManager.jsp">Back</a>
</body>
</html>
t