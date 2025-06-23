package com.foodapp.dao;

import com.foodapp.model.Food;
import com.foodapp.model.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private Connection conn;

    public OrderDAO(Connection conn) {
        this.conn = conn;
    }

    // Method to place an order (single food item)
    public boolean placeOrder(int userId, int foodId) throws SQLException {
        String sql = "INSERT INTO orders (user_id, food_id, order_time) VALUES (?, ?, NOW())";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userId);
        ps.setInt(2, foodId);
        return ps.executeUpdate() > 0;
    }

    // Method to fetch order history for a user
    public List<Order> getOrdersByUserId(int userId) throws SQLException {
        List<Order> orderList = new ArrayList<>();

        String sql = "SELECT o.id AS order_id, f.id AS food_id, f.name, f.price, f.image, o.order_time " +
                     "FROM orders o " +
                     "JOIN food_items f ON o.food_id = f.id " +
                     "WHERE o.user_id = ? " +
                     "ORDER BY o.order_time DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Food food = new Food();
            food.setId(rs.getInt("food_id"));
            food.setName(rs.getString("name"));
            food.setPrice(rs.getDouble("price"));
            food.setImage(rs.getString("image"));

            Order order = new Order();
            order.setOrderId(rs.getInt("order_id"));
            order.setFood(food);
            order.setOrderTime(rs.getTimestamp("order_time"));

            orderList.add(order);
        }

        return orderList;
    }
}
