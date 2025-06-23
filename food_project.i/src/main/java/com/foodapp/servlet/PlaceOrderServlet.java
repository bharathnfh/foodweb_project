package com.foodapp.servlet;

import com.foodapp.dao.OrderDAO;
import com.foodapp.model.User;
import com.foodapp.util.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<Integer> cart = (List<Integer>) session.getAttribute("cart");

        if (user == null || cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        try {
            Connection conn = DBConnection.getConnection();
            OrderDAO dao = new OrderDAO(conn);

            for (int foodId : cart) {
                dao.placeOrder(user.getId(), foodId);
            }

            session.removeAttribute("cart");
            response.sendRedirect("myorders.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cart.jsp");
        }
    }
}
