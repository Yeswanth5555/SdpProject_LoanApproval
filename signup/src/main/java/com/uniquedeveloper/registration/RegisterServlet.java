package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.uniquedeveloper.util.EmailUtil; // Import your EmailUtil class

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/loan?serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "12345";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("name");
        String uemail = request.getParameter("email");
        String upwd = request.getParameter("pass");
        String umobile = request.getParameter("contact");

        RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");

        // Server-side validation for contact number (must be exactly 10 digits)
        if (!umobile.matches("\\d{10}")) {
            request.setAttribute("status", "Contact number must be exactly 10 digits.");
            dispatcher.forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

                // Check if email already exists
                String checkEmailQuery = "SELECT COUNT(*) FROM user WHERE uemail = ?";
                try (PreparedStatement checkEmailStmt = con.prepareStatement(checkEmailQuery)) {
                    checkEmailStmt.setString(1, uemail);
                    try (ResultSet rs = checkEmailStmt.executeQuery()) {
                        if (rs.next() && rs.getInt(1) > 0) {
                            // Email already exists
                            request.setAttribute("status", "Email already registered. Please use a different email.");
                            dispatcher.forward(request, response);
                            return;
                        }
                    }
                }

                // Insert new user if email is not already used
                String insertQuery = "INSERT INTO user (uname, uemail, upwd, umobile) VALUES (?, ?, ?, ?)";
                try (PreparedStatement insertStmt = con.prepareStatement(insertQuery)) {
                    insertStmt.setString(1, uname);
                    insertStmt.setString(2, uemail);
                    insertStmt.setString(3, upwd); // Store password in plain text
                    insertStmt.setString(4, umobile);

                    int rowCount = insertStmt.executeUpdate();
                    if (rowCount > 0) {
                        // Capture current date and time
                        LocalDateTime registrationDateTime = LocalDateTime.now();
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                        String formattedDateTime = registrationDateTime.format(formatter);

                        // Prepare the email body with user details (excluding password)
                        String emailBody = "Dear " + uname + ",\n\n"
                                + "Your registration was successful! Below are your details:\n"
                                + "Name: " + uname + "\n"
                                + "Email: " + uemail + "\n"
                                + "Contact Number: " + umobile + "\n"
                                + "Registration Date and Time: " + formattedDateTime + "\n\n"
                                + "Now you can apply for a loan hassle-free on our website: [Insert Website Link Here]\n\n"
                                + "Thank you for registering with us!";

                        // Send the email
                        EmailUtil.sendEmail(uemail, "Registration Successful", emailBody);
                        
                        request.setAttribute("status", "Registration successful!");
                    } else {
                        request.setAttribute("status", "Registration failed, please try again.");
                    }

                    dispatcher.forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log detailed error information
            request.setAttribute("status", "SQL error: " + e.getMessage());
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace(); // Log detailed error information
            request.setAttribute("status", "Driver error: " + e.getMessage());
            dispatcher.forward(request, response);
        }
    }
}
