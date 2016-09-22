/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

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
    private int id;
    private String score;

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
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

    public String getScore() {
        return score;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public void setScore(String score) {
        this.score = score;
    }
    
    
    
}
