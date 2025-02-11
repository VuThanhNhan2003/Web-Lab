<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Course Registration Demo</title>
</head>
<body>
    <h1>Course Registration Demo</h1>
    <form action="Registration.jsp" method="post">
        Student ID: <input type="text" name="studentId" required />
        <input type="submit" value="Submit" />
    </form>
    <h2>Manager</h2>
    <a href="StudentManager.jsp">Students Manager</a>
    <a href="CourseManager.jsp">Course Manager</a>
</body>
</html>
