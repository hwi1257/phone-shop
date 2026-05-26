package com.phone.api;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;

import java.io.InputStreamReader;

import java.net.HttpURLConnection;
import java.net.URL;

import java.net.URLEncoder;

@WebServlet("/price")
public class PriceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String clientId =
                "1a8RKT_6BspX6M5jrXEQ";

        String clientSecret =
                "H7Hy06fzOU";

        String query =
                request.getParameter("query");

        String text =
                URLEncoder.encode(
                        query,
                        "UTF-8"
                );

        String apiURL =
                "https://openapi.naver.com/v1/search/shop.json?query="
                        + text;

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

        } else {

            br = new BufferedReader(
                    new InputStreamReader(
                            con.getErrorStream()
                    )
            );
        }

        String inputLine;

        StringBuilder result =
                new StringBuilder();

        while((inputLine = br.readLine()) != null){

            result.append(inputLine);
        }

        br.close();

        response.setContentType(
                "application/json;charset=UTF-8"
        );

        response.getWriter()
                .write(
                        result.toString()
                );
    }
}