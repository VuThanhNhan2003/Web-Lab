<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You for Joining</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Thanks for Joining Our Email List</h1>

        <p class="mt-4">Here is the information that you entered:</p>

        <div class="mb-3">
            <strong>Email:</strong>
            <span>${user.email}</span>
        </div>
        <div class="mb-3">
            <strong>First Name:</strong>
            <span>${user.firstName}</span>
        </div>
        <div class="mb-3">
            <strong>Last Name:</strong>
            <span>${user.lastName}</span>
        </div>

        <p class="mt-4">To enter another email address, click on the Return button shown below.</p>

        <form action="" method="get">
            <input type="hidden" name="action" value="join">
            <button type="submit" class="btn btn-primary">Return</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
