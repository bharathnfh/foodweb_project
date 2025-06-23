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
    <title>User Dashboard</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }

        .sidebar {
            background-color: #fff;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            padding: 20px;
            width: 220px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            overflow-y: auto;
        }

        .dashboard-content {
            padding: 30px;
            margin-left: 220px;
        }

        .sidebar .nav-link {
            color: #333;
            font-weight: 500;
            margin-bottom: 15px;
        }

        .sidebar .nav-link.active {
            background-color: #ffc107;
            color: #000;
            border-radius: 8px;
        }

        .card-food img {
            height: 240px;
            width: 100%;
            object-fit: cover;
            border-top-left-radius: 0.5rem;
            border-top-right-radius: 0.5rem;
        }

        .category-btns a {
            min-width: 120px;
        }

        .border-4 {
            border-width: 4px !important;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4 class="mb-2">GoMeal</h4>
    <p class="text-muted small mb-4">👤 <%= user.getName() %></p>
    <a href="profile.jsp" class="nav-link"><i class="bi bi-person"></i> Profile</a>
    <a href="Dashboard.jsp" class="nav-link active"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="menu.jsp" class="nav-link"><i class="bi bi-basket"></i> Food Order</a>
    <a href="myorders.jsp" class="nav-link"><i class="bi bi-card-list"></i> Order History</a>
    <a href="LogoutServlet" class="nav-link text-danger"><i class="bi bi-box-arrow-right"></i> Logout</a>
</div>

<!-- Main Content -->
<div class="dashboard-content">

    

    <!-- Welcome Section -->
    <div class="p-3 border-start border-4 border-primary mb-3 bg-white rounded shadow-sm">
        <h3 class="m-0">Welcome to your dashboard</h3>
    </div>
    <!-- Search Bar just below welcome -->
<div class="d-flex justify-content-end mb-4">
    <form class="d-flex" action="search.jsp" method="get" style="max-width: 320px;">
        <input class="form-control me-2" type="search" name="query" placeholder="Search dishes..." aria-label="Search">
        <button class="btn btn-outline-primary" type="submit">
            <i class="bi bi-search"></i>
        </button>
    </form>
</div>
    

    <!-- Categories Section -->
    <div class="p-3 border-start border-4 border-success bg-white mb-4 rounded shadow-sm">
        <h5 class="mb-3">Categories</h5>
        <div class="d-flex gap-3 flex-wrap category-btns">
            <a href="menu.jsp?category=veg" class="btn btn-outline-success">
                <i class="bi bi-leaf"></i> Veg
            </a>
            <a href="menu.jsp?category=nonveg" class="btn btn-outline-danger">
                <i class="bi bi-egg-fried"></i> Non-Veg
            </a>
            <a href="menu.jsp?category=drink" class="btn btn-outline-warning">
                <i class="bi bi-cup-straw"></i> Soft Drinks
            </a>
        </div>
    </div>

    <!-- Popular Dishes Section -->
    <div class="p-3 border-start border-4 border-warning bg-white mb-4 rounded shadow-sm">
        <h5 class="mb-4">Popular Dishes</h5>

        <div class="row">
            <!-- Burger -->
            <div class="col-md-4">
                <div class="card card-food mb-4">
                    <img src="https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_960_720.jpg" class="card-img-top" alt="Burger">
                    <div class="card-body">
                        <h6 class="card-title">Burger</h6>
                        <p class="card-text">₹149</p>
                        <a href="#" class="btn btn-sm btn-primary">Order Now</a>
                    </div>
                </div>
            </div>

            <!-- Cheese Pizza -->
            <div class="col-md-4">
                <div class="card card-food mb-4">
                    <img src="https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg" class="card-img-top" alt="Cheese Pizza">
                    <div class="card-body">
                        <h6 class="card-title">Cheese Pizza</h6>
                        <p class="card-text">₹199</p>
                        <a href="#" class="btn btn-sm btn-primary">Order Now</a>
                    </div>
                </div>
            </div>

            <!-- Spicy Noodles -->
            <div class="col-md-4">
                <div class="card card-food mb-4">
                    <img src="https://cdn.pixabay.com/photo/2017/05/07/08/56/noodles-2290879_960_720.jpg" class="card-img-top" alt="Spicy Noodles">
                    <div class="card-body">
                        <h6 class="card-title">Spicy Noodles</h6>
                        <p class="card-text">₹129</p>
                        <a href="#" class="btn btn-sm btn-primary">Order Now</a>
                    </div>
                </div>
            </div>

            <!-- Masala Dosa -->
            <div class="col-md-4">
                <div class="card card-food mb-4">
                    <img src="https://cdn.pixabay.com/photo/2021/06/15/04/47/masala-dosa-6337201_960_720.jpg" class="card-img-top" alt="Masala Dosa">
                    <div class="card-body">
                        <h6 class="card-title">Masala Dosa</h6>
                        <p class="card-text">₹99</p>
                        <a href="#" class="btn btn-sm btn-primary">Order Now</a>
                    </div>
                </div>
            </div>

            <!-- Idli Sambar -->
            <div class="col-md-4">
                <div class="card card-food mb-4">
                    <img src="https://cdn.pixabay.com/photo/2021/09/05/09/21/idli-6599387_960_720.jpg" class="card-img-top" alt="Idli Sambar">
                    <div class="card-body">
                        <h6 class="card-title">Idli Sambar</h6>
                        <p class="card-text">₹79</p>
                        <a href="#" class="btn btn-sm btn-primary">Order Now</a>
                    </div>
                </div>
            </div>

            <!-- Medu Vada -->
            <div class="col-md-4">
                <div class="card card-food mb-4">
                    <img src="https://cdn.pixabay.com/photo/2022/04/17/15/12/medu-vada-7136787_960_720.jpg" class="card-img-top" alt="Medu Vada">
                    <div class="card-body">
                        <h6 class="card-title">Medu Vada</h6>
                        <p class="card-text">₹89</p>
                        <a href="#" class="btn btn-sm btn-primary">Order Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
