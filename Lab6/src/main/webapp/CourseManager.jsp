<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*, java.util.List" %>
<%@ page import="model.Course" %>
<%@ page import="model.DBConnection" %>
<%
    List<Course> courses = new ArrayList<>();
    try (Connection conn = DBConnection.getConnection()) {
        String query = "SELECT * FROM Courses";
        try (PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                courses.add(new Course(rs.getInt("course_id"), rs.getString("course_name")));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Course List</title>
</head>
<body>
    <h1>Course List</h1>
    <table>
        <tr>
            <th>Course ID</th>
            <th>Name</th>
            <th>Action</th>
        </tr>
        <%
            for (Course course : courses) {
        %>
        <tr>
            <td><%= course.getCourseId() %></td>
            <td><%= course.getCourseName() %></td>
            <td><a href="#">Edit</a> | <a href="#">Delete</a></td>
        </tr>
        <%
            }
        %>
    </table>
    <a href="index.jsp">Back</a>
</body>
</html>
