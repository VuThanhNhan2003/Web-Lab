package com.mycompany.model;

import java.sql.*;

public class AccountBeanDB {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ShoppingApp?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "Hungnhan@0105";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("MySQL JDBC Driver không được tìm thấy.", e);
        }
    }

    public boolean insertAccount(AccountBean account) {
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASSWORD)) {
            String sql = "INSERT INTO Customer (name, visaNumber, address) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, account.getName());
            stmt.setString(2, account.getVisaNumber());
            stmt.setString(3, account.getAddress());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
