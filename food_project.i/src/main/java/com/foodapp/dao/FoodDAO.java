package com.foodapp.dao;

import com.foodapp.model.Food;
import java.sql.*;
import java.util.*;

public class FoodDAO {
    private Connection conn;

    public FoodDAO(Connection conn) {
        this.conn = conn;
    }

    public List<Food> getFoodByCategory(String category) throws SQLException {
        List<Food> list = new ArrayList<>();
        String sql = "SELECT * FROM food_items WHERE category = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, category);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Food food = new Food();
            food.setId(rs.getInt("id"));
            food.setName(rs.getString("name"));
            food.setPrice(rs.getDouble("price"));
            food.setImage(rs.getString("image"));
            food.setCategory(rs.getString("category"));
            list.add(food);
        }

        return list;
    }public Food getFoodById(int id) throws SQLException {
        String sql = "SELECT * FROM food_items WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Food food = new Food();
            food.setId(rs.getInt("id"));
            food.setName(rs.getString("name"));
            food.setPrice(rs.getDouble("price"));
            food.setImage(rs.getString("image"));
            food.setCategory(rs.getString("category"));
            return food;
        }
        return null;
    }

}
