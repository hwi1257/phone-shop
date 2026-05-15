package com.phone.api;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/price")
public class PriceServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, java.io.IOException {

        String query =
                request.getParameter("query");

        String clientId =
                "1a8RKT_6BspX6M5jrXEQ";

        String clientSecret =
                "H7Hy06fzOU";

        String text =
                URLEncoder.encode(
                        query,
                        "UTF-8"
                );

        String apiURL =
                "https://openapi.naver.com/v1/search/shop.json?query="
                        + text
                        + "&display=1&sort=sim";

        URL url =
                new URL(apiURL);

        HttpURLConnection con =
                (HttpURLConnection)
                        url.openConnection();

        con.setRequestMethod("GET");

        con.setRequestProperty(
                "X-Naver-Client-Id",
                clientId
        );

        con.setRequestProperty(
                "X-Naver-Client-Secret",
                clientSecret
        );

        BufferedReader br;

        if(con.getResponseCode() == 200){

            br = new BufferedReader(
                    new InputStreamReader(
                            con.getInputStream()
                    )
            );

        }else{

            br = new BufferedReader(
                    new InputStreamReader(
                            con.getErrorStream()
                    )
            );
        }

        String inputLine;

        StringBuilder res =
                new StringBuilder();

        while((inputLine = br.readLine()) != null){

            res.append(inputLine);
        }

        br.close();

        response.setContentType(
                "application/json;charset=UTF-8"
        );

        response.getWriter().write(
                res.toString()
        );
    }
}