package com.phone.api;

public class Phone {

    private String title;
    private String price;
    private String image;

    public Phone(String title,
                 String price,
                 String image) {

        this.title = title;
        this.price = price;
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public String getPrice() {
        return price;
    }

    public String getImage() {
        return image;
    }
}