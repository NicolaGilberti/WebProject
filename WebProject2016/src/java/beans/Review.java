/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author nicol
 */
public class Review implements java.io.Serializable{
    private int id;
    private int global_value;
    private int food;
    private int service;
    private int value_for_money;
    private int atmosphere;
    private String name;
    private String description;
    private String data_creation;
    private int id_restaurant;
    private String restaurant_name;
    private String restaurant_city;
    private int id_creator;
    private int id_photo;

    public String getRestaurantCity() {
        return restaurant_city;
    }

    public void setRestaurantCity(String restaurantCity) {
        this.restaurant_city = restaurantCity;
    }
    
    public void setRestaurantName(String restaurantName) {
        this.restaurant_name = restaurantName;
    }
    
    public String getRestaurantName() {
        return this.restaurant_name;
    }

    public int getId() {
        return id;
    }

    public int getGlobalValue() {
        return global_value;
    }

    public int getFood() {
        return food;
    }

    public int getService() {
        return service;
    }

    public int getValueForMoney() {
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

    public String getDataCreation() {
        return data_creation;
    }

    public int getId_restaurant() {
        return id_restaurant;
    }

    public int getId_creator() {
        return id_creator;
    }

    public int getId_photo() {
        return id_photo;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setGlobalValue(int globalValue) {
        this.global_value = globalValue;
    }

    public void setFood(int food) {
        this.food = food;
    }

    public void setService(int service) {
        this.service = service;
    }

    public void setValueForMoney(int valueForMoney) {
        this.value_for_money = valueForMoney;
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

    public void setDataCreation(String dataCreation) {
        this.data_creation = dataCreation;
    }

    public void setId_restaurant(int id_restaurant) {
        this.id_restaurant = id_restaurant;
    }

    public void setId_creator(int id_creator) {
        this.id_creator = id_creator;
    }

    public void setId_photo(int id_photo) {
        this.id_photo = id_photo;
    }
}
