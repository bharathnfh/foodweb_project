package com.foodapp.servlet;

import com.foodapp.dao.UserDAO;
import com.foodapp.model.User;
import com.foodapp.util.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate passwords match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        try {
            // Establish DB connection
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                request.setAttribute("error", "Database connection failed.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            UserDAO dao = new UserDAO(conn);

            // Check if user already exists
            if (dao.isUserExists(email, phone)) {
                request.setAttribute("error", "User with this email or phone already exists.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Create user and register
            User user = new User(name, email, phone, password);
            boolean success = dao.registerUser(user);

            if (success) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace(); // Show in console
            request.setAttribute("error", "Something went wrong: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
