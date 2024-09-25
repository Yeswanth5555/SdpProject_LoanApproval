package com.uniquedeveloper.registration;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ProfileUpdateServlet")
public class ProfileUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get session
        HttpSession session = request.getSession();

        // Check if user is logged in
        if (session.getAttribute("name") == null) {
            response.sendRedirect("login.jsp");
            return; // Stop further processing
        }

        // Get the updated profile details from the request
        String updatedName = request.getParameter("name");
        String updatedEmail = request.getParameter("email");
        String updatedContactNumber = request.getParameter("contact");

        // Get user ID from the session (assuming it's stored in session)
        int userId = (Integer) session.getAttribute("userId"); // Assuming userId is stored in session

        // Database connection variables
        String jdbcURL = "jdbc:mysql://localhost:3306/your_database"; // Update with your database URL
        String dbUser = "your_username"; // Update with your database username
        String dbPassword = "your_password"; // Update with your database password

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // SQL query to update user details
            String sql = "UPDATE user SET uname = ?, uemail = ?, umobile = ? WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, updatedName);
            preparedStatement.setString(2, updatedEmail);
            preparedStatement.setString(3, updatedContactNumber);
            preparedStatement.setInt(4, userId); // Set user ID

            // Execute the update
            int rowsUpdated = preparedStatement.executeUpdate();
            if (rowsUpdated > 0) {
                // Update session attributes if needed
                session.setAttribute("name", updatedName);
                session.setAttribute("email", updatedEmail);
                session.setAttribute("contact", updatedContactNumber);
                
                // Redirect to the profile page with success message
                response.sendRedirect("profile.jsp?updateSuccess=true");
            } else {
                // Handle case where no rows were updated (user not found)
                response.sendRedirect("profile.jsp?updateSuccess=false");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log error
            response.sendRedirect("profile.jsp?updateSuccess=false");
        } finally {
            // Clean up resources
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
