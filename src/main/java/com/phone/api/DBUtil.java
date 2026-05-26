package com.phone.api;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/phone_shop",
                    "root",
                    "106803kim!"
            );

        } catch (Exception e) {

            e.printStackTrace();
            return null;
        }
    }
}