package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDB {

    // Database connection parameters
    private static final String URL = "jdbc:mysql://localhost:3306/lab7";  // Change to your database URL
    private static final String USER = "root";  // Change to your database username
    private static final String PASSWORD = "Hungnhan@0105";  // Change to your database password

    // Method to insert a user into the database
    public static void insert(User user) {
        String sql = "INSERT INTO users (firstname, lastname, email) VALUES (?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setString(1, user.getFirstName());
            statement.setString(2, user.getLastName());
            statement.setString(3, user.getEmail());

            statement.executeUpdate();  // Execute the insert query
        } catch (SQLException e) {
            e.printStackTrace();  // Log the error for debugging
        }
    }

    // Method to get all users from the database
    public static List<User> getAll() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                String firstName = resultSet.getString("firstname");
                String lastName = resultSet.getString("lastname");
                String email = resultSet.getString("email");
                
                User user = new User(firstName, lastName, email);
                users.add(user);  // Add user to the list
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log the error for debugging
        }

        return users;
    }
}
