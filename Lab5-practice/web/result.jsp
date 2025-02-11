<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Personal Information Result</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <style>


            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
                color: #333;
            }

        </style>
    </head>

    <body>
        <div class="container">
            <h1>Submitted Personal Information</h1>
            <table>
                <tr>
                    <th>ID</th>
                    <td><%= request.getAttribute("id")%></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><%= request.getAttribute("name")%></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= request.getAttribute("email")%></td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td><%= request.getAttribute("gender")%></td>
                </tr>
                <tr>
                    <th>Major</th>
                    <td><%= request.getAttribute("major")%></td>
                </tr>
                <tr>
                    <th>Interesting Field</th>
                    <td><%= request.getAttribute("interest")%></td>
                </tr>
            </table>
        </div>
    </body>

</html>
