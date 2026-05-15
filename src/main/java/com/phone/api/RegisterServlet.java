package com.phone.api;

import java.io.IOException;

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

        if(UserStore.users.containsKey(id)){

            response.getWriter()
                    .write("fail");

            return;
        }

        UserStore.users.put(id, password);

        response.getWriter()
                .write("success");
    }
}