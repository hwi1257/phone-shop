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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String id =
                request.getParameter("id");

        String password =
                request.getParameter("password");

        try {

            Connection conn =
                    DBUtil.getConnection();

            PreparedStatement ps =
                    conn.prepareStatement(
                            "SELECT * FROM users WHERE id=? AND password=?"
                    );

            ps.setString(1, id);
            ps.setString(2, password);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                request.getSession()
                        .setAttribute("loginId", id);

                response.getWriter()
                        .write("success");

            } else {

                response.getWriter()
                        .write("fail");
            }

            conn.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter()
                    .write("fail");
        }
    }
}