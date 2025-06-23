package com.foodapp.servlet;

import com.foodapp.dao.OrderDAO;
import com.foodapp.model.User;
import com.foodapp.util.DBConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int foodId = Integer.parseInt(request.getParameter("foodId"));
        User user = (User) request.getSession().getAttribute("user");

        try {
            Connection conn = DBConnection.getConnection();
            OrderDAO dao = new OrderDAO(conn);

            boolean success = dao.placeOrder(user.getId(), foodId);

            if (success) {
                response.sendRedirect("myorders.jsp");
            } else {
                request.setAttribute("error", "Failed to place order.");
                request.getRequestDispatcher("menu.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        }
    }
}
