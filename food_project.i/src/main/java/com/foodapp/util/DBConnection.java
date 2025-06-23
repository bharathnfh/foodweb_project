package com.foodapp.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection conn;

    public static Connection getConnection() {
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/food_project",
                    "root",
                    "Bharath@123"
                );
            }
        } catch (Exception e) {
            System.out.println("DB Connection failed:");
            e.printStackTrace();
            conn = null;  // explicitly null if failed
        }
        return conn;
    }

}
