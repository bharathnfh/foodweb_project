package com.foodapp.servlet;

import com.foodapp.model.User;
import com.foodapp.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String location = request.getParameter("location");

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE users SET name=?, phone=?, address=?, location=? WHERE email=?");

            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setString(4, location);
            ps.setString(5, user.getEmail());

            int i = ps.executeUpdate();
            if (i > 0) {
                // update session user object
                user.setName(name);
                user.setPhone(phone);
                user.setAddress(address);
                user.setLocation(location);
                session.setAttribute("user", user);
                response.sendRedirect("profile.jsp");
            } else {
                response.getWriter().println("Failed to update.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
