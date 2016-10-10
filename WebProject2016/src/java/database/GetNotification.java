/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import beans.NotificationBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.ChangeOwnerNotification;
import utils.DeletePhotoNotification;
import utils.NotificationReplies;

/**
 *
 * @author Marco
 */
public class GetNotification {
    ManagerDB db;
    Connection con;
    
    public GetNotification(){
        db= new ManagerDB();
        con = db.getConnection();
    }
    
    public NotificationBean getAllNotification() throws SQLException{
        NotificationBean notification = new NotificationBean();
        //mi creo un array con le replies
        //mi serve commento user 
        PreparedStatement replies = con.prepareStatement("SELECT t1.id AS idrep, t1.data_creation AS datarep,t2.data_creation AS revdata, t1.description AS repdes, t2.description AS rewdes, users.nickname AS customer,t4.nickname AS ristoratore,users.id FROM (replies AS t1 INNER JOIN reviews AS t2 ON (t1.id_review = t2.id)) INNER JOIN users ON (t2.id_creator = users.id) JOIN users AS t4 ON ( t1.id_owner = t4.id) WHERE t1.id_validator IS NULL");
        ResultSet rs = replies.executeQuery();
        while(rs.next()){
            NotificationReplies t1 = new NotificationReplies();
            t1.setIdrep(rs.getInt("id"));
            t1.setCustomer(rs.getString("customer"));
            t1.setDatarep(rs.getDate("datarep"));
            t1.setDatarew(rs.getDate("rew"));
            t1.setReplydescription(rs.getString("repdes"));
            t1.setReviewdescription("rewdes");
            t1.setRistoratore("ristoratore");
            notification.addReplies(t1);
        }
        
        PreparedStatement cown = con.prepareStatement("SELECT t2.id AS resid,t3.id AS usrid , t2.name AS resname,t3.name AS usrname,t3.surname,t3.nickname FROM (request_changes_owner AS t1 INNER JOIN restaurants AS t2 ON (t1.id_restaurant =t2.id)) INNER JOIN users AS t3 ON (t1.id_user = t3.id OR t2.id_owner = t3.id) WHERE t1.accepted IS NULL;");
        rs = cown.executeQuery();
        while(rs.next()){
            ChangeOwnerNotification t1 = new ChangeOwnerNotification();
            t1.setResid(rs.getInt("resid"));
            t1.setNickname(rs.getString("nickname"));
            t1.setSurname(rs.getString("surname"));
            t1.setResname(rs.getString("resname"));
            t1.setUsrid(rs.getInt("usrid"));
            t1.setUsername(rs.getString("usrname"));
            notification.addChowner(t1);
        }
        
        PreparedStatement dphoto = con.prepareStatement("SELECT t1.id_user AS usrid, t1.id_photo AS idphoto ,t2.name AS resname,t3.name AS photoname,t3.nickname FROM (request_delete_photos AS t1 INNER JOIN photos AS t2 ON (t1.id_photo = t2.id)) INNER JOIN users AS t3 ON (t1.id_user = t3.id) WHERE t1.accepted IS NULL;");
        rs = dphoto.executeQuery();
        
        while(rs.next()){
            DeletePhotoNotification t1 = new DeletePhotoNotification();
            t1.setIdphoto(rs.getInt("idphoto"));
            t1.setNickname(rs.getString("nickname"));
            t1.setPhotoname(rs.getString("photoname"));
            t1.setResname(rs.getString("resname"));
            t1.setUsrid(rs.getInt("usrid"));
            notification.addDelPhotos(t1);
        }
        

        return notification;
    }
    
}
