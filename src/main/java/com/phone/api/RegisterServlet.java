package com.phone.api;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String id =
                request.getParameter("id");

        String password =
                request.getParameter("password");

        if(id == null || password == null
                || id.trim().isEmpty()
                || password.trim().isEmpty()){

            response.getWriter()
                    .write("fail");

            return;
        }

        try {

            Connection conn =
                    DBUtil.getConnection();

            PreparedStatement check =
                    conn.prepareStatement(
                            "SELECT * FROM users WHERE id=?"
                    );

            check.setString(1, id);

            ResultSet rs =
                    check.executeQuery();

            if(rs.next()){

                response.getWriter()
                        .write("fail");

                conn.close();

                return;
            }

            PreparedStatement ps =
                    conn.prepareStatement(
                            "INSERT INTO users(id, username, password) VALUES (?, ?, ?)"
                    );

            ps.setString(1, id);

            ps.setString(2, id);

            ps.setString(3, password);

            ps.executeUpdate();

            response.getWriter()
                    .write("success");

            conn.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter()
                    .write("fail");
        }
    }
}