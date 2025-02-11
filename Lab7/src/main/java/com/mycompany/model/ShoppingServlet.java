package com.mycompany.model;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ShoppingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        if ("ACCOUNT".equals(action)) {
            // Lấy thông tin tài khoản từ form
            AccountBean account = new AccountBean();
            account.setName(request.getParameter("name"));
            account.setVisaNumber(request.getParameter("visaNumber"));
            account.setAddress(request.getParameter("address"));

            // Lưu thông tin tài khoản vào session
            session.setAttribute("account", account);

            // Thực hiện chèn thông tin tài khoản vào DB (nếu cần)
            AccountBeanDB accountDB = new AccountBeanDB();
            accountDB.insertAccount(account);

            // Lấy danh sách sản phẩm từ DB
            ProductDB productDB = new ProductDB();
            List<Product> products = productDB.getAllProducts();

            // Đưa danh sách sản phẩm vào request và chuyển hướng đến products.jsp
            request.setAttribute("products", products);
            request.getRequestDispatcher("products.jsp").forward(request, response);

        } else if ("ADD".equals(action)) {
            int productID = Integer.parseInt(request.getParameter("productID"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // Lấy sản phẩm từ DB
            ProductDB productDB = new ProductDB();
            Product selectedProduct = productDB.getProductByID(productID);
            selectedProduct.setPrice(selectedProduct.getPrice() * quantity); // Tính giá theo số lượng

            // Lưu sản phẩm vào giỏ hàng
            cart.add(selectedProduct);
            session.setAttribute("cart", cart);

            // Lấy danh sách sản phẩm để hiển thị
            List<Product> products = productDB.getAllProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("products.jsp").forward(request, response);

        } else if ("DELETE".equals(action)) {
            int productID = Integer.parseInt(request.getParameter("productID"));
            cart.removeIf(product -> product.getProductID() == productID); // Xóa sản phẩm khỏi giỏ hàng
            session.setAttribute("cart", cart);

            // Lấy lại danh sách sản phẩm để hiển thị
            ProductDB productDB = new ProductDB();
            List<Product> products = productDB.getAllProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("products.jsp").forward(request, response);

        } else if ("CHECKOUT".equals(action)) {
            // Lưu giỏ hàng vào session và chuyển đến checkout.jsp
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        ProductDB productDB = new ProductDB();
        List<Product> products = productDB.getAllProducts(); // Lấy danh sách sản phẩm

        if ("SHOP_MORE".equals(action)) {
            // Hiển thị lại trang sản phẩm khi người dùng chọn Shop more
            request.setAttribute("products", products);
            request.getRequestDispatcher("products.jsp").forward(request, response);
        } else {
            // Hiển thị trang sản phẩm khi không có action
            request.setAttribute("products", products);
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
    }
}
