<%@page import="com.mycompany.model.Product"%>
<%@page import="java.util.List"%>
<%@ page import="com.mycompany.model.AccountBean" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container mt-5">
        <h1>Select Products</h1>
        
        <% 
            AccountBean account = (AccountBean) session.getAttribute("account");
            if (account != null) {
        %>
            <h2>Hi <%= account.getName() %>!</h2>
            <p>Please select our product and its quantity</p>
        <% 
            } else {
        %>
            <h2>Welcome, Guest!</h2>
        <% 
            }
        %>

        <form action="ShoppingServlet" method="post" class="mb-4">
            <div class="mb-3">
                <label for="productID" class="form-label">Choose Product</label>
                <select name="productID" id="productID" class="form-select">
                    <% 
                        List<Product> products = (List<Product>) request.getAttribute("products");
                        if (products != null) {
                            for (Product product : products) {
                    %>
                    <option value="<%= product.getProductID() %>">
                        <%= product.getName() %> | <%= product.getManufacturer() %> | <%= product.getCountry() %> | $<%= product.getPrice() %>
                    </option>
                    <% 
                            }
                        } 
                    %>
                </select>
            </div>
            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity:</label>
                <input type="number" name="quantity" id="quantity" min="1" class="form-control" />
            </div>
            <button type="submit" name="action" value="ADD" class="btn btn-primary">Add to Cart</button>
        </form>

        <h2>Shopping Cart</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Manufacturer</th>
                    <th>Country</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Product> cart = (List<Product>) session.getAttribute("cart");
                    if (cart != null && !cart.isEmpty()) {
                        for (Product product : cart) {
                %>
                <tr>
                    <td><%= product.getName() %></td>
                    <td><%= product.getManufacturer() %></td>
                    <td><%= product.getCountry() %></td>
                    <td>1</td>
                    <td>$<%= product.getPrice() %></td>
                    <td>
                        <form action="ShoppingServlet" method="post" class="d-inline">
                            <input type="hidden" name="productID" value="<%= product.getProductID() %>">
                            <button type="submit" name="action" value="DELETE" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6">Your cart is empty.</td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>

        <form action="checkout.jsp" method="get" class="d-inline">
            <button type="submit" class="btn btn-success">Checkout</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
