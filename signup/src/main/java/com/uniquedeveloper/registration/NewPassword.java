package com.uniquedeveloper.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;

        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
            Connection con = null;
            PreparedStatement pst = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false", "root", "12345");

                // Hash the new password (use a suitable hashing method)
                String hashedPassword = hashPassword(newPassword);

                pst = con.prepareStatement("UPDATE user SET upwd = ? WHERE uemail = ?");
                pst.setString(1, hashedPassword);
                pst.setString(2, (String) session.getAttribute("email"));

                int rowCount = pst.executeUpdate();
                request.setAttribute("status", rowCount > 0 ? "resetSuccess" : "resetFailed");
                dispatcher = request.getRequestDispatcher("login.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("status", "resetError");
                dispatcher = request.getRequestDispatcher("login.jsp");
            } finally {
                // Close resources
                if (pst != null) try { pst.close(); } catch (Exception e) {}
                if (con != null) try { con.close(); } catch (Exception e) {}
            }
        } else {
            request.setAttribute("status", "passwordMismatch");
            dispatcher = request.getRequestDispatcher("resetPassword.jsp");
        }

        dispatcher.forward(request, response);
    }

    private String hashPassword(String password) {
        // Use a secure hashing algorithm like BCrypt
        // For demonstration, we return the plain password
        return password; // Replace with actual hashing implementation
    }
}
