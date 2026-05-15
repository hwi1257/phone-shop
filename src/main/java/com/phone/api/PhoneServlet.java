package com.phone.api;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@WebServlet("/phones")
public class PhoneServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String clientId = "1a8RKT_6BspX6M5jrXEQ";
        String clientSecret = "H7Hy06fzOU";

        // 비교할 핸드폰 리스트
        String[] models = {
                "갤럭시 S26 자급제",
                "갤럭시 S26+ 자급제",
                "갤럭시 S26 울트라 자급제",
                "아이폰 17 자급제",
                "아이폰 17 프로 자급제"
        };

        List<Phone> phoneList =
                new ArrayList<>();

        for (String model : models) {

            String query =
                    URLEncoder.encode(model, "UTF-8");

            String apiURL =
                    "https://openapi.naver.com/v1/search/shop.json?query="
                            + query;

            URL url = new URL(apiURL);

            HttpURLConnection con =
                    (HttpURLConnection) url.openConnection();

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

            if (con.getResponseCode() == 200) {

                br = new BufferedReader(
                        new InputStreamReader(con.getInputStream())
                );

            } else {

                br = new BufferedReader(
                        new InputStreamReader(con.getErrorStream())
                );
            }

            String inputLine;
            StringBuilder result =
                    new StringBuilder();

            while ((inputLine = br.readLine()) != null) {

                result.append(inputLine);
            }

            br.close();

            JSONObject json =
                    new JSONObject(result.toString());

            JSONArray items =
                    json.getJSONArray("items");

            if (items.length() > 0) {

                JSONObject firstItem =
                        items.getJSONObject(0);

                String title =
                        model;

                String price =
                        firstItem.getString("lprice");

                String image =
                        firstItem.getString("image");

                Phone phone =
                        new Phone(title, price, image);

                phoneList.add(phone);
            }
        }

        request.setAttribute("phones", phoneList);

        request.getRequestDispatcher("/index.jsp")
                .forward(request, response);
    }
}