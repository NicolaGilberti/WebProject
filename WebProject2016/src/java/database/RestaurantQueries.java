package database;

import beans.Cuisine;
import beans.Restaurant;
import beans.Review;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author RiccardoUni
 */
public class RestaurantQueries {

    private ManagerDB db = null;
    private Connection con = null;

    public RestaurantQueries() {
        db = new ManagerDB();
        con = db.getConnection();
    }

    public Restaurant searchRestaurant(int id) throws SQLException {
        Restaurant restaurant = new Restaurant();
        PreparedStatement st = con.prepareStatement("SELECT * FROM restaurants WHERE ? = restaurants.id");
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        while(rs.next()) {
            restaurant.setId(rs.getInt("id"));
            restaurant.setAddress(rs.getString("address"));
            restaurant.setName(rs.getString("name"));
            restaurant.setDescription(rs.getString("description"));
            restaurant.setWeb_site_url(rs.getString("web_site_url"));
            restaurant.setId_owner(rs.getInt("id_owner"));
            restaurant.setId_creator(rs.getInt("id_creator"));
            restaurant.setId_price_range(rs.getInt("id_price_range"));
            restaurant.setLatitude(rs.getDouble("latitude"));
            restaurant.setLongitude(rs.getDouble("longitude"));
            restaurant.setGlobal_value(rs.getInt("global_value"));
        }
        return restaurant;

    }
    
    public void closeConnection() throws SQLException {
        con.close();
    }
    
    public ArrayList<String> getPhotos(int id_restaurant) throws SQLException {
        PreparedStatement pd = con.prepareStatement(
                "SELECT name FROM photos WHERE id_restaurant = ?;");
        pd.setInt(1, id_restaurant);
        ResultSet rs = pd.executeQuery();
        ArrayList<String> pn = new ArrayList<String>();
        while (rs.next()) {
                pn.add("img/restImgs/" + rs.getString(1));
        }
        return pn;
    } 
    
    public ArrayList<Integer> getPriceRange(int id_price_range) throws SQLException {
        ArrayList<Integer> tmp = new ArrayList<Integer>();
        PreparedStatement pd = con.prepareStatement(
                "SELECT min_value,max_value FROM price_range WHERE id = ?;");
        pd.setInt(1, id_price_range);
        ResultSet rs = pd.executeQuery();
        while (rs.next()) {
            tmp.add(rs.getInt(1));
            tmp.add(rs.getInt(2));
        }
        
        return tmp;        
    }

    public ArrayList<Cuisine> getCuisines(int id) throws SQLException {
        ArrayList<Cuisine> tmp = new ArrayList<Cuisine>();
        PreparedStatement pd = con.prepareStatement(
                "SELECT cuisine.id,cuisine.name FROM cuisine "
                        + "JOIN restaurants_cuisine ON cuisine.id = "
                        + "restaurants_cuisine.id_cuisine AND id_restaurant = ?;");
        pd.setInt(1, id);
        ResultSet rs = pd.executeQuery();
        while (rs.next()) {
            Cuisine c = new Cuisine();
            c.setId(rs.getInt(1));
            c.setName(rs.getString(2));
            tmp.add(c);
        }
        return tmp;
    }

    public ArrayList<Review> getReviews(int id) throws SQLException {
        ArrayList<Review> tmp = new ArrayList<Review>();
        PreparedStatement pd = con.prepareStatement(
                "SELECT * FROM reviews WHERE id_restaurant = ?;");
        pd.setInt(1, id);
        ResultSet rs = pd.executeQuery();
        
        while (rs.next()) {
            Review r = new Review();
            r.setId(rs.getInt("id"));
            r.setId_creator(rs.getInt("id_creator"));
            r.setId_restaurant(rs.getInt("id_restaurant"));
            r.setData_creation(rs.getTimestamp("data_creation").toString().substring(0, 10));
            r.setDescription(rs.getString("description"));
            
            tmp.add(r);
        }
        return tmp;
    }
    
    public String getUserName(int userId) throws SQLException {
        PreparedStatement pd = con.prepareStatement(
                "SELECT name FROM users WHERE id = ?;");
        pd.setInt(1, userId);
        ResultSet rs = pd.executeQuery();
        rs.next();
        return rs.getString("name");
    }
}
