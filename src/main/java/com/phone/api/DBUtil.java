package com.phone.api;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DBUtil {

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String database = System.getenv("MYSQLDATABASE");
            String user = System.getenv("MYSQLUSER");
            String password = System.getenv("MYSQLPASSWORD");

            String url =
                    "jdbc:mysql://"
                            + host
                            + ":"
                            + port
                            + "/"
                            + database
                            + "?serverTimezone=Asia/Seoul";

            Connection conn =
                    DriverManager.getConnection(
                            url,
                            user,
                            password
                    );

            Statement st =
                    conn.createStatement();

            st.executeUpdate(
                    "CREATE TABLE IF NOT EXISTS users (" +
                            "id VARCHAR(50) PRIMARY KEY," +
                            "username VARCHAR(50)," +
                            "password VARCHAR(100))"
            );

            return conn;

        } catch (Exception e) {

            e.printStackTrace();

            return null;
        }
    }
}