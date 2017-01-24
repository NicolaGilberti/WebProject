/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import beans.NotificationBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import beans.ChangeOwnerNotificationBean;
import beans.DeletePhotoNotificationBean;
import beans.NotificationRepliesBean;

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
  
    public NotificationBean getAllNotification(int userid) throws SQLException, Throwable{
        NotificationBean restaurant_notification = new NotificationBean();
        //notification reviews
        PreparedStatement replies = con.prepareStatement("SELECT rev.id,rev.global_value,rev.food,rev.service,rev.value_for_money,rev.atmosphere,rev.name,rev.description,rev.data_creation,rev.id_restaurant,rev.id_creator,rev.id_photo,rev.view FROM restaurants AS res INNER JOIN reviews AS rev ON(res.id = rev.id_restaurant) WHERE view = false AND res.id_owner = ?;");
        ResultSet rs = replies.executeQuery();
        try{
            try{    
                while(rs.next()){
                    NotificationRepliesBean t1 = new NotificationRepliesBean();
                    t1.setIdrep(rs.getInt("idrep"));
                    t1.setCustomer(rs.getString("customer"));
                    t1.setDatarep(rs.getDate("datarep"));
                    t1.setDatarew(rs.getDate("revdata"));
                    t1.setReplydescription(rs.getString("repdes"));
                    t1.setReviewdescription(rs.getString("rewdes"));
                    t1.setRistoratore(rs.getString("ristoratore"));
                    t1.setAccepted(rs.getBoolean("accepted"));
                    restaurant_notification.addReplies(t1);
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
