/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;
import java.util.List;

/**
 * Represent the Restaurants database table
 * @author RiccardoUni
 */
public class RestaurantBean implements java.io.Serializable {
    private int id;
    private String name;
    private String description;
    private String web_site_url;
    private int global_value;
    private int id_owner;
    private int id_creator;
    private int id_price_range;
    private Double latitude;
    private Double longitude;
    private String address;
    private int cap;
    private String city;
    private String country;
    private int id_country;
    private String telephone;
    private int score;
    private String imgPath;
    private double minPrice;
    private double maxPrice;
    private int numReviews;
    private int n_visits;
    private String e_mail;
    private List<CuisineBean> cuisineTypes = new ArrayList<>();
    
    public int getId_country() {
        return id_country;
    }

    public void setId_country(int id_country) {
        this.id_country = id_country;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public double getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(double minPrice) {
        this.minPrice = minPrice;
    }

    public double getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(double maxPrice) {
        this.maxPrice = maxPrice;
    }

    public int getNumReviews() {
        return numReviews;
    }

    public void setNumReviews(int numReviews) {
        this.numReviews = numReviews;
    }

    public int getN_visits() {
        return n_visits;
    }

    public void setN_visits(int n_visits) {
        this.n_visits = n_visits;
    }

    public List<CuisineBean> getCuisineTypes() {
        return cuisineTypes;
    }

    public void setCuisineTypes(List<CuisineBean> cuisineTypes) {
        this.cuisineTypes = cuisineTypes;
    }

    public String getE_mail() {
        return e_mail;
    }

    public void setE_mail(String e_mail) {
        this.e_mail = e_mail;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getTelephone() {
        return telephone;
    }

    public String getWeb_site_url() {
        return web_site_url;
    }

    public void setWeb_site_url(String web_site_url) {
        this.web_site_url = web_site_url;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
    private String mail;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getGlobal_value() {
        return global_value;
    }

    public void setGlobal_value(int global_value) {
        this.global_value = global_value;
    }

    public int getId_owner() {
        return id_owner;
    }

    public void setId_owner(int id_owner) {
        this.id_owner = id_owner;
    }

    public int getId_creator() {
        return id_creator;
    }

    public void setId_creator(int id_creator) {
        this.id_creator = id_creator;
    }

    public int getId_price_range() {
        return id_price_range;
    }

    public void setId_price_range(int id_price_range) {
        this.id_price_range = id_price_range;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCap() {
        return cap;
    }

    public void setCap(int cap) {
        this.cap = cap;
    } 
    
}
