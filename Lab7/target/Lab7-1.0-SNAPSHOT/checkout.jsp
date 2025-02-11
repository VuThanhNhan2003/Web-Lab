<%@page import="com.mycompany.model.Product"%>
<%@page import="java.util.List"%>
<%@ page import="com.mycompany.model.AccountBean" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    
    <!-- Thêm link CDN c?a Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
    <h1 class="text-center">Checkout</h1>

    <%
        // L?y thông tin tài kho?n t? session
        AccountBean account = (AccountBean) session.getAttribute("account");
        if (account != null) {
    %>
    <h2>Your Account Information:</h2>
    <div class="card mb-4">
        <div class="card-body">
            <p><strong>Name:</strong> <%= account.getName()%></p>
            <p><strong>Visa Card Number:</strong> <%= account.getVisaNumber()%></p>
            <p><strong>Address:</strong> <%= account.getAddress()%></p>
        </div>
    </div>
    <%
        } else {
    %>
    <div class="alert alert-warning" role="alert">
        No account information available.
    </div>
    <%
        }
    %>

    <h2>Your Selected Products:</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Manufacturer</th>
                <th>Country</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Product> cart = (List<Product>) session.getAttribute("cart");
                double total = 0;
                if (cart != null && !cart.isEmpty()) {
                    for (Product product : cart) {
                        total += product.getPrice();
            %>
            <tr>
                <td><%= product.getName()%></td>
                <td><%= product.getManufacturer()%></td>
                <td><%= product.getCountry()%></td>
                <td>$<%= product.getPrice()%></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4" class="text-center">Your cart is empty.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <h3>Total Price: $<%= total%></h3>

    <div class="d-flex justify-content-between">
        <form action="ShoppingServlet" method="get">
            <button type="submit" name="action" value="SHOP_MORE" class="btn btn-primary">Shop some more</button>
        </form>

        <form action="account.jsp" method="get">
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>
    </div>
</div>

<!-- Thêm link CDN c?a JavaScript Bootstrap 5 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
