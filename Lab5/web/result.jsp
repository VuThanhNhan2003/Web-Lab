<%@ page import="java.util.Arrays" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Registration Result</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="styles.css"> 
</head>

<body>
    <div class="container">
        <h1>Registration Result</h1>
        <div>
            <p><strong>Full Name:</strong> ${registerForm.fullName}</p>
            <p><strong>ID:</strong> ${registerForm.id}</p>
            <p><strong>Email:</strong> ${registerForm.email}</p>
            <p><strong>Gender:</strong> ${registerForm.gender}</p>
            <p><strong>Field of Study:</strong> ${registerForm.field}</p>
            <p><strong>List of Subjects:</strong> ${Arrays.toString(registerForm.subjects)}</p>
            <p><strong>Comments:</strong> ${registerForm.comments}</p>
        </div>
    </div>
</body>

</html>
