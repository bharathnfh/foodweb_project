package com.foodapp.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.*;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int foodId = Integer.parseInt(request.getParameter("foodId"));
        String category = request.getParameter("category");
        HttpSession session = request.getSession();

        List<Integer> cart = (List<Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        if (!cart.contains(foodId)) {
            cart.add(foodId);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("menu.jsp?category=" + category);
    }
}
