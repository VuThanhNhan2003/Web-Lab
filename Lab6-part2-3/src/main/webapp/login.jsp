<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="model.User"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login Form</title>
    </head>
    <body>
        <h2>Login Form</h2>
        <form method="post" action="login.jsp">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password"
                   required><br><br>
            <input type="submit" name="Login" value="Login">
        </form>
        <%
            if (request.getParameter("Login") != null) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                Class.forName("com.mysql.cj.jdbc.Driver");
                String connectionURL = "jdbc:mysql://localhost:3306/wadlab6?user=root&password=Hungnhan@0105";
                Connection con = null;
                con = DriverManager.getConnection(connectionURL);
                PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE username=? AND password=?");
        ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    out.print("Connect success!");
                    String name = rs.getString("username");
                    String pass = rs.getString("password");
                    User u = new User(name, pass);
                    request.setAttribute("user", u);
                    RequestDispatcher dispatcher
                            = request.getRequestDispatcher("homepage.jsp");
                    dispatcher.forward(request, response);
                } else {
                    // Invalid credentials, show error message
                    out.print("Invalid username or password.");
                }
            }
        %>
    </body>
</html>