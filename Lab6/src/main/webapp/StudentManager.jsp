<%@page import="model.Student"%>
<%@ page import="java.util.List" %>
<%
    List<Student> students = (List<Student>) request.getAttribute("students");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
</head>
<body>
    <h1>Student List</h1>
    <table>
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Action</th>
        </tr>
        <%
            if (students != null) {
                for (Student student : students) {
        %>
        <tr>
            <td><%= student.getStudentId() %></td>
            <td><%= student.getStudentName() %></td>
            <td><a href="#">Edit</a> | <a href="#">Delete</a></td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <a href="index.jsp">Back</a>
</body>
</html>
