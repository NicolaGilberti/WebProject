/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;

/**
 *
 * @author nicol
 */
public class ReviewBean implements java.io.Serializable {

    private int id;
    private int global_value;
    private int food;
    private int service;
    private int value_for_money;
    private int atmosphere;
    private String name;
    private String description;
    private String restaurant_name;
    private String restaurant_city;
    private int id_creator;
    private int id_photo;
    private String photo_name;
    private boolean view;
    private String data_creation;

    public int getId_photo() {
        return id_photo;
    }

    public void setId_photo(int id_photo) {
        this.id_photo = id_photo;
    }
    private int id_restaurant;
    private String nickname;
    
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    
    public void setView(boolean view) {
        this.view = view;
    }

    public String getNickname() {
        return nickname;
    }


    public boolean isView() {
        return view;
    }

    public String getPhoto_name() {
        return photo_name;
    }

    public void setPhoto_name(String photo_name) {
        if (photo_name.equals("no")) {
            this.photo_name = "";
        } else {
            this.photo_name = "img\\reviewsImgs\\" + photo_name;
        }
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setGlobal_value(int global_value) {
        this.global_value = global_value;
    }

    public void setFood(int food) {
        this.food = food;
    }

    public void setService(int service) {
        this.service = service;
    }

    public void setValue_for_money(int value_for_money) {
        this.value_for_money = value_for_money;
    }

    public void setAtmosphere(int atmosphere) {
        this.atmosphere = atmosphere;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setData_creation(String data_creation) {
        this.data_creation = data_creation;
    }

    public void setId_restaurant(int id_restaurant) {
        this.id_restaurant = id_restaurant;
    }

    public void setRestaurant_name(String restaurant_name) {
        this.restaurant_name = restaurant_name;
    }

    public void setRestaurant_city(String restaurant_city) {
        this.restaurant_city = restaurant_city;
    }

    public void setId_creator(int id_creator) {
        this.id_creator = id_creator;
    }

    public int getId() {
        return id;
    }

    public int getGlobal_value() {
        return global_value;
    }

    public int getFood() {
        return food;
    }

    public int getService() {
        return service;
    }

    public int getValue_for_money() {
        return value_for_money;
    }

    public int getAtmosphere() {
        return atmosphere;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getData_creation() {
        return data_creation;
    }

    public int getId_restaurant() {
        return id_restaurant;
    }

    public String getRestaurant_name() {
        return restaurant_name;
    }

    public String getRestaurant_city() {
        return restaurant_city;
    }

    public int getId_creator() {
        return id_creator;
    }

    @Override
    public String toString(){
    return " "+this.id+" "+this.data_creation+" "+this.description+" "+this.name+" "+this.nickname+"  photoname"+this.photo_name+" "+this.restaurant_city+" "+restaurant_name+" "+atmosphere+" "+food+" "+global_value+" "+id_creator+" "+id_restaurant+" "+this.service+" "+this.value_for_money+" "+this.view;
    
    }

}
