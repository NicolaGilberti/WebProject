/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.CuisineBean;
import beans.RestaurantBean;
import beans.ReviewBean;
import beans.UserBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import servlets.UserRestaurants;

/**
 *
 * @author nicol
 */
public class UserPageDAO {

    private UserBean user;

    public UserBean getUser() {
        return user;
    }

    public void setUser(UserBean user) {
        this.user = user;
    }

    public UserPageDAO(UserBean user) {
        this.user = user;
    }

    public ArrayList<RestaurantBean> getRestaurants() {
        ArrayList<RestaurantBean> rest = new ArrayList<RestaurantBean>();

        //Instauriamo connessione
        ManagerDB manager = new ManagerDB();
        Connection connection = manager.getConnection();

        String restQuery = "SELECT r.id,r.name,r.description,r.address,r.city,r.global_value,"
                + "(SELECT p1.name FROM photos p1 WHERE p1.id_restaurant = r.id LIMIT 1) AS photo_name, "
                + "(SELECT COUNT(*) FROM reviews re WHERE re.id_restaurant = r.id) AS n_reviews, "
                + "c.name AS cuisine_name "
                + "FROM restaurants r JOIN photos p ON (r.id = p.id_restaurant) JOIN restaurants_cuisine rc ON (rc.id_restaurant = r.id) JOIN cuisine c ON (c.id = rc.id_cuisine) "
                + "WHERE id_owner=" + this.user.getId();

        try {
            PreparedStatement ps = connection.prepareStatement(restQuery);
            ResultSet results = ps.executeQuery();

            //Per tutti i risultati
            RestaurantBean risto = new RestaurantBean();
            ArrayList<CuisineBean> cList;
            while (results.next()) {

                if (results.isFirst() || results.getInt("id") != risto.getId()) {
                    CuisineBean c = new CuisineBean();
                    c.setName(results.getString("cuisine_name"));

                    risto = new RestaurantBean();
                    cList = new ArrayList<CuisineBean>();
                    cList.add(c);

                    risto.setId(results.getInt("id"));
                    risto.setName(results.getString("name"));
                    risto.setDescription(results.getString("description"));
                    risto.setAddress(results.getString("address"));
                    risto.setCity(results.getString("city"));
                    risto.setGlobal_value(results.getInt("global_value"));
                    risto.setImgPath(results.getString("photo_name"));
                    risto.setNumReviews(results.getInt("n_reviews"));
                    risto.setCuisineTypes(cList);
                    rest.add(risto);
                } else if (results.getInt("id") == risto.getId()) {
                    CuisineBean c = new CuisineBean();
                    c.setName(results.getString("cuisine_name"));
                    risto.getCuisineTypes().add(c);
                }
            }

            return rest;

        } catch (SQLException ex) {
            Logger.getLogger(UserRestaurants.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
    public ArrayList<ReviewBean> getReviews() {
        ArrayList<ReviewBean> rev = new ArrayList<ReviewBean>();
        
        //Instauriamo connessione
        ManagerDB manager = new ManagerDB();
        Connection connection = manager.getConnection();
        
        String revQuery = "SELECT r.id AS id_review,"
                + "r.global_value AS global_value,"
                + "r.food AS food, r.service AS service,"
                + "r.value_for_money AS value_for_money,"
                + "r.atmosphere AS atmosphere,"
                + "r.name AS name_review,"
                + "r.description AS description,"
                + "r.data_creation AS data_creation,"
                + "r.id_restaurant AS id_restaurant,"
                + "r.id_photo AS id_photo,"
                + "rest.name AS name_restaurant,"
                + "rest.city AS city_restaurant "
                + "FROM reviews r JOIN restaurants rest ON (rest.id = id_restaurant) "
                + "WHERE r.id_creator=" + this.user.getId();
        
        try {
            PreparedStatement ps = connection.prepareStatement(revQuery);
            ResultSet results = ps.executeQuery();
            
            //Per tutti i risultati
            while (results.next()) {
                ReviewBean r = new ReviewBean();
                r.setAtmosphere(results.getInt("atmosphere"));
                r.setData_creation(results.getString("data_creation"));
                r.setDescription(results.getString("description"));
                r.setFood(results.getInt("food"));
                r.setGlobal_value(results.getInt("global_value"));
                r.setId(results.getInt("id_review"));
                //r.setId_creator(results.getInt("id_creator"));
                //r.setId_photo(results.getInt("id_photo"));
                int id_photo = results.getInt("id_photo");
                if (id_photo != 0) {
                    String photoName_query = "SELECT name FROM photos WHERE id=" + id_photo;

                    ps = connection.prepareStatement(photoName_query);
                    ResultSet res1 = ps.executeQuery();

                    if (res1.next()) {
                        r.setPhoto_name(res1.getString("name"));
                    }
                } else {
                    r.setPhoto_name("no");
                }
                r.setId_restaurant(results.getInt("id_restaurant"));
                r.setName(results.getString("name_review"));
                r.setService(results.getInt("service"));
                r.setValue_for_money(results.getInt("value_for_money"));
                r.setRestaurant_name(results.getString("name_restaurant"));
                r.setRestaurant_city(results.getString("city_restaurant"));
                rev.add(r);
            }
            
            return rev;
        } catch (SQLException ex) {
            Logger.getLogger(UserRestaurants.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
}
