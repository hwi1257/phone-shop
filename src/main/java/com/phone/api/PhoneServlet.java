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

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/phones")
public class PhoneServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String clientId =
                "1a8RKT_6BspX6M5jrXEQ";

        String clientSecret =
                "H7Hy06fzOU";

        List<Phone> phoneList =
                new ArrayList<>();

        try {

            Connection conn =
                    DBUtil.getConnection();

            PreparedStatement ps =
                    conn.prepareStatement(
                            "SELECT * FROM phones"
                    );

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()) {

                int phoneId =
                        rs.getInt("phone_id");

                String brand =
                        rs.getString("brand");

                String name =
                        rs.getString("name");

                String chip =
                        rs.getString("chip");

                int antutu =
                        rs.getInt("antutu");

                int score3d =
                        rs.getInt("score3d");

                String query =
                        URLEncoder.encode(
                                name + " 자급제",
                                "UTF-8"
                        );

                String apiURL =
                        "https://openapi.naver.com/v1/search/shop.json?query="
                                + query;

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

                if(con.getResponseCode() == 200) {

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

                while((inputLine = br.readLine()) != null) {

                    result.append(inputLine);
                }

                br.close();

                JSONObject json =
                        new JSONObject(
                                result.toString()
                        );

                JSONArray items =
                        json.getJSONArray("items");

                String image = "";

                String price = "";

                if(items.length() > 0) {

                    JSONObject firstItem =
                            items.getJSONObject(0);

                    image =
                            firstItem.getString("image");

                    price =
                            firstItem.getString("lprice");
                }

                Phone phone =
                        new Phone(
                                phoneId,
                                brand,
                                name,
                                chip,
                                antutu,
                                score3d
                        );

                phone.setPrice(price);

                phone.setImage(image);

                phoneList.add(phone);
            }

            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        request.setAttribute(
                "phones",
                phoneList
        );

        request.getRequestDispatcher("/index.jsp")
                .forward(request, response);
    }
}