package com.phone.api;

import java.io.IOException;

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

        String savedPassword =
                UserStore.users.get(id);

        if(savedPassword != null
                &&
                savedPassword.equals(password)) {

            request.getSession()
                    .setAttribute("loginId", id);

            response.getWriter()
                    .write("success");

        } else {

            response.getWriter()
                    .write("fail");
        }
    }
}