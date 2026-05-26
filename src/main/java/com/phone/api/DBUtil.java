package com.phone.api;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

    public static Connection getConnection() {

        try {

            Class.forName(
                    "com.mysql.cj.jdbc.Driver"
            );

            String host =
                    System.getenv(
                            "MYSQLHOST"
                    );

            String port =
                    System.getenv(
                            "MYSQLPORT"
                    );

            String database =
                    System.getenv(
                            "MYSQLDATABASE"
                    );

            String user =
                    System.getenv(
                            "MYSQLUSER"
                    );

            String password =
                    System.getenv(
                            "MYSQLPASSWORD"
                    );

            String url =
                    "jdbc:mysql://"
                            + host
                            + ":"
                            + port
                            + "/"
                            + database
                            + "?serverTimezone=Asia/Seoul";

            return DriverManager.getConnection(
                    url,
                    user,
                    password
            );

        } catch (Exception e) {

            e.printStackTrace();

            return null;
        }
    }
}