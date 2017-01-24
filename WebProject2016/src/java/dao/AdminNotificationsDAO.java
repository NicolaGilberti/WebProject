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
public class AdminNotificationsDAO {
    ManagerDB db;
    Connection con;
    
    public AdminNotificationsDAO(){
        db= new ManagerDB();
        con = db.getConnection();
    }
    
    /**
     * 
     * @return a bean that contains all notification of change owner, delete photos and then confirm replyes
     * @throws SQLException
     * @throws Throwable 
     */
    public NotificationBean getAllNotification() throws SQLException, Throwable{
        NotificationBean notification = new NotificationBean();
        //mi creo un array con le replies
        PreparedStatement replies = con.prepareStatement("SELECT t1.accepted AS accepted, t1.id AS idrep, t1.data_creation AS datarep,t2.data_creation AS revdata, t1.description AS repdes, t2.description AS rewdes, users.nickname AS customer,t4.nickname AS ristoratore FROM (replies AS t1 INNER JOIN reviews AS t2 ON (t1.id_review = t2.id)) INNER JOIN users ON (t2.id_creator = users.id) JOIN users AS t4 ON ( t1.id_owner = t4.id);");
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
                    notification.addReplies(t1);
                }
                
                    
                //the query for seletting all the change owner request
                PreparedStatement cown = con.prepareStatement("SELECT t1.accepted AS accepted,t2.id AS resid,t3.id AS usrid , t2.name AS resname,t3.name AS usrname,t3.surname,t3.nickname FROM (request_changes_owner AS t1 INNER JOIN restaurants AS t2 ON (t1.id_restaurant =t2.id)) INNER JOIN users AS t3 ON (t1.id_user = t3.id OR t2.id_owner = t3.id)");
                rs = cown.executeQuery();
                while(rs.next()){
                    ChangeOwnerNotificationBean t1 = new ChangeOwnerNotificationBean();
                    t1.setResid(rs.getInt("resid"));
                    t1.setNickname(rs.getString("nickname"));
                    t1.setSurname(rs.getString("surname"));
                    t1.setResname(rs.getString("resname"));
                    t1.setUsrid(rs.getInt("usrid"));
                    t1.setUsername(rs.getString("usrname"));
                    t1.setAccepted(rs.getBoolean("accepted"));
                    notification.addChowner(t1);
                }
                
                
                //the query to selecting all the delete photo request
                PreparedStatement dphoto = con.prepareStatement("SELECT t1.accepted AS accepted,t1.id_user AS usrid, t1.id_photo AS idphoto ,t2.name AS resname,t3.name AS photoname,t3.nickname FROM (request_delete_photos AS t1 INNER JOIN photos AS t2 ON (t1.id_photo = t2.id)) INNER JOIN users AS t3 ON (t1.id_user = t3.id);");
                rs = dphoto.executeQuery();

                while(rs.next()){
                    DeletePhotoNotificationBean t1 = new DeletePhotoNotificationBean();
                    t1.setIdphoto(rs.getInt("idphoto"));
                    t1.setNickname(rs.getString("nickname"));
                    t1.setPhotoname(rs.getString("photoname"));
                    t1.setResname(rs.getString("resname"));
                    t1.setUsrid(rs.getInt("usrid"));
                    t1.setAccepted(rs.getBoolean("accepted"));
                    notification.addDelPhotos(t1);
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
        return notification;
    }
    
    //finalize per chiudere la connessione quando ho finito con la ricerca all'interno del database
    @Override
    protected void finalize() throws Throwable  
{  
    try { con.close(); } 
    catch (SQLException e) { 
        e.printStackTrace();
    }
    super.finalize();  
}  
    
}
