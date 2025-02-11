<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%
    // Step 2: Define the connection URL
    String connectionURL = "jdbc:mysql://localhost:3306/wadlab6?user=root&password=Hungnhan@0105"; 
    Connection connection = null; // Step 3
    Statement statement = null; // Step 4
    ResultSet rs = null;

    try {
        // Step 1: Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        
        // Step 3: Establish a connection
        connection = DriverManager.getConnection(connectionURL);
        
        // Step 4: Create a statement object
        statement = connection.createStatement();
        
        // Step 5: Execute a query
        rs = statement.executeQuery("SELECT * FROM course");
        
        // Step 6: Process the results
        while (rs.next()) {
            out.println("Course ID: " + rs.getString("CourseID") + "<br>");
            out.println("Course Name: " + rs.getString("CourseName") + "<br><br>");
        }
    } catch (Exception e) {
        out.println("<div style='color: red;'>An error occurred while processing your request. Please try again later.</div>");
        out.println("<div style='color: red;'>Error: " + e.getMessage() + "</div>");
    } finally {
        // Step 7: Close the connection and resources
        try {
            if (rs != null) rs.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
