package com.foodapp.servlet;

import com.foodapp.dao.UserDAO;
import com.foodapp.model.User;
import com.foodapp.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String identifier = request.getParameter("identifier"); // email or phone
        String password = request.getParameter("password");

        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                request.setAttribute("error", "Database connection failed.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            UserDAO dao = new UserDAO(conn);
            User user = dao.loginUser(identifier, password);

            if (user != null) {
                // Login successful
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("Dashboard.jsp");

            } else {
                // Login failed
                request.setAttribute("error", "Invalid email/phone or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
