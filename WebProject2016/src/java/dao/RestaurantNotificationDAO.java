/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import beans.ChangeOwnerNotificationBean;
import beans.DeletePhotoNotificationBean;
import beans.NotificationRepliesBean;
import beans.RestaurantNotificationBean;
import beans.ReviewBean;

/**
 *
 * @author Marco
 */
public class RestaurantNotificationDAO {
    ManagerDB db;
    Connection con;
    
    public RestaurantNotificationDAO(){
        db= new ManagerDB();
        con = db.getConnection();
    }
  
    public RestaurantNotificationBean getAllNotification(int userid) throws SQLException, Throwable{
        RestaurantNotificationBean restaurant_notification = new RestaurantNotificationBean();
        //notification reviews
        PreparedStatement replies = con.prepareStatement("SELECT rev.id AS idreview, rev.global_value,rev.food,rev.service,rev.value_for_money,rev.atmosphere,rev.name AS revname,rev.description,res.name AS res_name,res.city, usr.id AS userid,rev.id_photo,rev.view,rev.data_creation AS dcreation,res.id AS resid, usr.nickname FROM (reviews AS rev INNER JOIN restaurants AS res ON (rev.id_restaurant = res.id)) INNER JOIN users AS usr ON rev.id_creator = usr.id WHERE res.id_owner = ?");
        replies.setInt(1, userid);
        ResultSet rs = replies.executeQuery();
        try{
            try{ 
                    while(rs.next()){
                        ReviewBean t1 = new ReviewBean();
                        System.out.println("asdsad"+rs.getInt("idreview")+"sdadasd \n \n \n");
                        t1.setId(rs.getInt("idreview"));
                        t1.setGlobal_value(rs.getInt("global_value"));
                        t1.setFood(rs.getInt("food"));
                        t1.setService(rs.getInt("service"));
                        t1.setValue_for_money(rs.getInt("value_for_money"));
                        t1.setAtmosphere(rs.getInt("atmosphere"));
                        t1.setName(rs.getString("revname"));
                        t1.setDescription(rs.getString("description"));
                        t1.setRestaurant_name(rs.getString("res_name"));
                        t1.setRestaurant_city(rs.getString("city"));
                        t1.setData_creation(rs.getString("dcreation"));
                        t1.setDescription(rs.getString("description"));
                        t1.setId_restaurant(rs.getInt("resid"));
                        int id_photo = rs.getInt("id_photo");
                        if (id_photo != 0) {
                            String photoName_query = "SELECT name FROM photos WHERE id=" + id_photo;
                            replies = con.prepareStatement(photoName_query);
                            ResultSet res1 = replies.executeQuery();
                            if (res1.next()) {
                                t1.setPhoto_name(res1.getString("name"));
                            }
                        } else {
                            System.out.println("photo id"+id_photo);
                            t1.setPhoto_name("no");
                        }
                        t1.setView(rs.getBoolean("view"));
                        t1.setNickname(rs.getString("nickname"));
                        System.out.println("GET REKT"+t1+"\n \n \n \n");
                        restaurant_notification.addReviewBean(t1);
                    }
             }finally{
                rs.close();
            }
        }finally{
            replies.close();
        }
        //connection closing
        this.finalize();
        con.close();
        return restaurant_notification;
    }
    
    //finalize per chiudere la connessione quando ho finito con la ricerca all'interno del database
    @Override
    protected void finalize() throws Throwable  {  
        try { con.close(); } 
        catch (SQLException e) { 
            e.printStackTrace();
        }
        super.finalize();  
    }  
    
}
