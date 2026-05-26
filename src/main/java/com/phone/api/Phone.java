package com.phone.api;

public class Phone {

    private int phoneId;

    private String brand;

    private String name;

    private String chip;

    private int antutu;

    private int score3d;

    private String price;

    private String image;

    public Phone(int phoneId,
                 String brand,
                 String name,
                 String chip,
                 int antutu,
                 int score3d) {

        this.phoneId = phoneId;

        this.brand = brand;

        this.name = name;

        this.chip = chip;

        this.antutu = antutu;

        this.score3d = score3d;
    }

    public int getPhoneId() {
        return phoneId;
    }

    public String getBrand() {
        return brand;
    }

    public String getName() {
        return name;
    }

    public String getChip() {
        return chip;
    }

    public int getAntutu() {
        return antutu;
    }

    public int getScore3d() {
        return score3d;
    }

    public String getPrice() {
        return price;
    }

    public String getImage() {
        return image;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setImage(String image) {
        this.image = image;
    }
}