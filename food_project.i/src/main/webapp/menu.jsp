<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.foodapp.dao.FoodDAO, com.foodapp.model.Food, com.foodapp.util.DBConnection, com.foodapp.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String category = request.getParameter("category");
    if (category == null) category = "veg";

    FoodDAO dao = new FoodDAO(DBConnection.getConnection());
    List<Food> foodList = dao.getFoodByCategory(category);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Food Menu</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .food-img {
            height: 220px;
            object-fit: cover;
        }
        .category-btns {
            margin-bottom: 30px;
        }
        .card-title {
            font-weight: bold;
        }
        .card {
            min-height: 420px;
        }
    </style>
</head>
<body>

<div class="container mt-4">
    <h3 class="mb-3">Select Category</h3>
    <div class="d-flex gap-3 flex-wrap category-btns">
        <a href="menu.jsp?category=veg" class="btn btn-outline-success">🥦 Veg</a>
        <a href="menu.jsp?category=nonveg" class="btn btn-outline-danger">🍗 Non-Veg</a>
        <a href="menu.jsp?category=drink" class="btn btn-outline-warning">🥤 Soft Drinks</a>
    </div>

    <div class="row">
        <% if (foodList != null && !foodList.isEmpty()) {
            for (Food f : foodList) { %>
                <div class="col-md-4 mb-4">
                    <div class="card shadow-sm">
                        <img src="images/<%= f.getImage() %>" class="card-img-top food-img" alt="<%= f.getName() %>">
                        <div class="card-body">
                            <h5 class="card-title"><%= f.getName() %></h5>
                            <p class="card-text text-success fw-bold">₹<%= f.getPrice() %></p>

                            <form action="AddToCartServlet" method="post">
                                <input type="hidden" name="foodId" value="<%= f.getId() %>">
                                <input type="hidden" name="category" value="<%= category %>">
                                <button type="submit" class="btn btn-success btn-sm w-100">Add to Cart</button>
                            </form>
                        </div>
                    </div>
                </div>
        <%   }
           } else { %>
            <div class="col-12 text-center">
                <div class="alert alert-warning">No items available in this category.</div>
            </div>
        <% } %>
    </div>
</div>

</body>
</html>
