package com.phone.api;

import org.json.JSONArray;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class NaverShoppingServlet {

    public static void main(String[] args) {

        try {

            String clientId = "1a8RKT_6BspX6M5jrXEQ";
            String clientSecret = "H7Hy06fzOU";

            String query =
                    URLEncoder.encode("갤럭시 S26 울트라", "UTF-8");

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
            StringBuilder response = new StringBuilder();

            while ((inputLine = br.readLine()) != null) {

                response.append(inputLine);
            }

            br.close();

            JSONObject json = new JSONObject(response.toString());

            JSONArray items = json.getJSONArray("items");

            JSONObject firstItem = items.getJSONObject(0);

            String title = firstItem.getString("title");
            String price = firstItem.getString("lprice");

            System.out.println("상품명: " + title);
            System.out.println("최저가: " + price + "원");

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}