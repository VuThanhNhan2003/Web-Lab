<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Input Results</title>
</head>
<body>
    <h2>Input Results</h2>
    <%
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // Get value from text-box
        String name = request.getParameter("name_text_box");
        out.print("Hello " + name + "!<br>");

        // Get value from radio button
        String gender = request.getParameter("name_radio_button");
        out.print("The gender is: " + gender + "<br>");

        // Get value from check-box
        String[] courses = request.getParameterValues("name_check_box");
        if (courses != null) {
            out.print("The courses: <br>");
            for (String course : courses) {
                out.println(course + "<br>");
            }
        } else {
            out.println("<b>none</b>");
        }
    %>
    <br>
    <a href="homepage.jsp">Go Back</a>
</body>
</html>
