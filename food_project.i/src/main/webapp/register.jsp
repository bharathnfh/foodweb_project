<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
        }
        .register-card {
            max-width: 500px;
            margin: auto;
            margin-top: 60px;
            padding: 30px;
            border-radius: 15px;
            background: white;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="register-card">
        <h3 class="text-center mb-4">Create Account</h3>

        <% String error = (String) request.getAttribute("error");
           if (error != null) { %>
           <div class="alert alert-danger text-center"><%= error %></div>
        <% } %>

        <form action="RegisterServlet" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" id="name" name="name" class="form-control" required />
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" name="email" class="form-control" required />
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" id="phone" name="phone" class="form-control" required />
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-control" required />
            </div>

            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required />
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>
        </form>

        <div class="text-center mt-3">
            <small>Already have an account? <a href="login.jsp">Login</a></small>
        </div>
    </div>

    <!-- Optional Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
