package com.foodapp.dao;

import com.foodapp.model.User;
import java.sql.*;

public class UserDAO {
    private Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean registerUser(User user) throws SQLException {
        String sql = "INSERT INTO users (name, email, phone, password) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user.getName());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getPhone());
        ps.setString(4, user.getPassword());
        return ps.executeUpdate() > 0;
    }

    public User loginUser(String identifier, String password) throws SQLException {
        String sql = "SELECT * FROM users WHERE (email = ? OR phone = ?) AND password = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, identifier);
        ps.setString(2, identifier);
        ps.setString(3, password);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPhone(rs.getString("phone"));
            return user;
        }
        return null;
    }
    public boolean isUserExists(String email, String phone) throws SQLException {
        String sql = "SELECT id FROM users WHERE email = ? OR phone = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, phone);
        ResultSet rs = ps.executeQuery();
        return rs.next();  // true if record found
    }

}