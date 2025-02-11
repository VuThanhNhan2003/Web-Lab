<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page session="true"%>
<%
    // Hit counter logic
    Integer hitCount = (Integer) session.getAttribute("hitCount");
    if (hitCount == null) {
        hitCount = 0;
    }
    hitCount++;
    session.setAttribute("hitCount", hitCount);
    
    // Fetch user info if available
    User user = (User) request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
</head>
<body>
    <h1>Welcome to the Homepage!</h1>
    
    <% if (user != null) { %>
        <div>User Name: <%= user.getUsername() %></div>
        <div>Password: <%= user.getPassword() %></div>
    <% } else { %>
        <div>No user record found.</div>
    <% } %>
    
    <div>Number of visits: <%= hitCount %></div>
    <a href="logout.jsp">Logout</a>
    
    <h2>Input Form</h2>
    <form method="post" action="processInput.jsp">
        <label for="name_text_box">Name:</label>
        <input type="text" id="name_text_box" name="name_text_box" required><br><br>
        
        <label>Gender:</label>
        <input type="radio" name="name_radio_button" value="Male"> Male
        <input type="radio" name="name_radio_button" value="Female"> Female<br><br>
        
        <label>Courses:</label><br>
        <input type="checkbox" name="name_check_box" value="Course 1"> Course 1<br>
        <input type="checkbox" name="name_check_box" value="Course 2"> Course 2<br>
        <input type="checkbox" name="name_check_box" value="Course 3"> Course 3<br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
