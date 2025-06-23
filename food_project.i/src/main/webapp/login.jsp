<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-card {
            max-width: 400px;
            margin: auto;
            margin-top: 80px;
            padding: 30px;
            border-radius: 15px;
            background: white;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

    <div class="login-card">
        <h3 class="text-center mb-4">Login to Your Account</h3>

        <% String error = (String) request.getAttribute("error");
           if (error != null) { %>
           <div class="alert alert-danger text-center"><%= error %></div>
        <% } %>

        <form action="LoginServlet" method="post">
            <div class="mb-3">
                <label for="identifier" class="form-label">Email or Phone</label>
                <input type="text" name="identifier" class="form-control" required placeholder="Enter email or phone">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required placeholder="Enter password">
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </form>

        <div class="text-center mt-3">
            <small>Don't have an account? <a href="register.jsp">Register here</a></small>
        </div>
    </div>

    <!-- Optional Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
