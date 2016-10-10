/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 *
 * @author MirkoPortatile
 */
public class RestaurantSearch implements java.io.Serializable {
    // Properties.

    private String name;
    private String description;
    private String address;
    private String city;
    private double minPrice;
    private double maxPrice;
    private int numReviews;
    private int id;
    private int score;
    private String imgPath;
 private List<Cuisine> cuisineTypes=new ArrayList<>();

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
   
    public int getNumReviews() {
        return numReviews;
    }

    public void setNumReviews(int numReviews) {
        this.numReviews = numReviews;
    }

    public List<Cuisine> getCuisineTypes() {
        return cuisineTypes;
    }

    public void setCuisineTypes(List<Cuisine> cuisineTypes) {
        this.cuisineTypes = cuisineTypes;
        
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

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getCity() {
        return city;
    }

    public int getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getScore() {
        return score;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setScore(int score) {
        this.score = score;
    }

}







