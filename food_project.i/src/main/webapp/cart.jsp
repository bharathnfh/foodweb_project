<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.foodapp.dao.FoodDAO, com.foodapp.model.Food, com.foodapp.util.DBConnection, com.foodapp.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Integer> cart = (List<Integer>) session.getAttribute("cart");
    FoodDAO dao = new FoodDAO(DBConnection.getConnection());

    List<Food> cartItems = new ArrayList<>();
    double total = 0;

    if (cart != null) {
        for (int id : cart) {
            Food f = dao.getFoodById(id);
            if (f != null) {
                cartItems.add(f);
                total += f.getPrice();
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h3 class="mb-4">🛒 My Cart</h3>

    <% if (cartItems.isEmpty()) { %>
        <div class="alert alert-warning">Your cart is empty!</div>
    <% } else { %>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Food Item</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1;
                   for (Food f : cartItems) { %>
                    <tr>
                        <td><%= i++ %></td>
                        <td><%= f.getName() %></td>
                        <td>₹<%= f.getPrice() %></td>
                    </tr>
                <% } %>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="2">Total</th>
                    <th>₹<%= total %></th>
                </tr>
            </tfoot>
        </table>

        <form action="PlaceOrderServlet" method="post">
            <button type="submit" class="btn btn-success">Place Order</button>
        </form>
    <% } %>
</div>
</body>
</html>
