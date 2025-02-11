<%@page import="model.DBConnection"%>
<%@page import="model.Course"%>
<%@page import="model.Student"%>
<%@ page import="java.sql.*, java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    String studentId = request.getParameter("studentId");
    Student student = null;
    List<Course> registeredCourses = new ArrayList<>();

    try (Connection conn = DBConnection.getConnection()) {
        // Fetch student details
        String studentQuery = "SELECT * FROM Students WHERE student_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(studentQuery)) {
            ps.setInt(1, Integer.parseInt(studentId));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                student = new Student(rs.getInt("student_id"), rs.getString("student_name"));
            }
        }

        // Fetch registered courses
        String courseQuery = "SELECT c.course_id, c.course_name FROM Courses c " +
                             "JOIN Registrations r ON c.course_id = r.course_id WHERE r.student_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(courseQuery)) {
            ps.setInt(1, Integer.parseInt(studentId));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                registeredCourses.add(new Course(rs.getInt("course_id"), rs.getString("course_name")));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student's Details</title>
</head>
<body>
    <h1>Student's Details</h1>
    <p>Student ID: <%= student != null ? student.getStudentId() : "Not Found" %></p>
    <p>Student Name: <%= student != null ? student.getStudentName() : "Not Found" %></p>
    <h2>Select Course</h2>
    <form action="RegistrationServlet" method="post">
        Course: 
        <select name="courseId">
            <option value="1">OOP</option>
            <option value="2">WEB</option>
            <option value="3">DSA</option>
        </select>
        <input type="hidden" name="studentId" value="<%= studentId %>" />
        <input type="submit" value="Add" />
    </form>
    <h3>Registered Courses:</h3>
    <table>
        <tr>
            <th>Course ID</th>
            <th>Course Name</th>
            <th>Action</th>
        </tr>
        <%
            for (Course course : registeredCourses) {
        %>
        <tr>
            <td><%= course.getCourseId() %></td>
            <td><%= course.getCourseName() %></td>
            <td><a href="#">Remove</a></td>
        </tr>
        <%
            }
        %>
    </table>
    <a href="index.jsp">Back</a>
</body>
</html>
