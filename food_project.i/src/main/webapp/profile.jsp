<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.foodapp.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .profile-container {
            max-width: 600px;
            margin: 60px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h3 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="profile-container">
        <h3>User Profile</h3>
        <form action="UpdateProfileServlet" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= user.getName() %>" required>
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">Phone Number</label>
                <input type="text" class="form-control" id="phone" name="phone" value="<%= user.getPhone() %>" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" readonly>
            </div>

            <div class="mb-3">
                <label for="address" class="form-label">Delivery Address</label>
                <textarea class="form-control" id="address" name="address" rows="3" required><%= user.getAddress() %></textarea>
            </div>

            <div class="mb-3">
                <label for="location" class="form-label">Location</label>
                <input type="text" class="form-control" id="location" name="location" value="<%= user.getLocation() %>" required>
            </div>

            <button type="submit" class="btn btn-primary">Update Profile</button>
        </form>
    </div>
</div>

</body>
</html>
