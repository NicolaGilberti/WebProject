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
 * Questo dao mi permette di raccogliere tutte le notifiche che devono essere mostrate agli amministratori che si loggano.
 * Il metodo getAllNotification è l'unico metodo presente, ritorna un Notification bean riempito con le notifiche presenti nel database
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
     * getAllNotification: metodo per accedere a tutte le notifiche dell'admin.
     * @return NotificationBean: ritorna un bean con all'interno tutte le notifiche che devono essere mostrate all'admin
     * @throws SQLException
     * @throws Throwable 
     */
    public NotificationBean getAllNotification() throws SQLException, Throwable{
        NotificationBean notification = new NotificationBean();
        //creo un preparedstatement e un rs per l'eseuzione della query e per recuperare il risultato della tabella
        PreparedStatement replies = con.prepareStatement("SELECT t1.accepted AS accepted, t1.id AS idrep, t1.data_creation AS datarep,t2.data_creation AS revdata, t1.description AS repdes, t2.description AS rewdes, users.nickname AS customer,t4.nickname AS ristoratore FROM (replies AS t1 INNER JOIN reviews AS t2 ON (t1.id_review = t2.id)) INNER JOIN users ON (t2.id_creator = users.id) JOIN users AS t4 ON ( t1.id_owner = t4.id) ORDER BY t1.data_creation DESC;");
        ResultSet rs = replies.executeQuery();
        try{
            try{    
                while(rs.next()){
                    //recupero le notifiche delle reply
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
                
                    
                //recupero le notifiche del ChangeOwner
                PreparedStatement cown = con.prepareStatement("SELECT t1.accepted AS accepted,t2.id AS resid,t3.id AS usrid , t2.name AS resname,t3.name AS usrname,t3.surname,t3.nickname, t4.nickname AS owner FROM ((request_changes_owner AS t1 INNER JOIN restaurants AS t2 ON (t1.id_restaurant =t2.id)) INNER JOIN users AS t3 ON (t1.id_user = t3.id)) INNER JOIN users AS t4 ON (t2.id_owner = t4.id);");
                rs = cown.executeQuery();
                while(rs.next()){
                    ChangeOwnerNotificationBean t1 = new ChangeOwnerNotificationBean();
                    t1.setResid(rs.getInt("resid"));
                    t1.setNickname(rs.getString("nickname"));
                    t1.setSurname(rs.getString("surname"));
                    t1.setResname(rs.getString("resname"));
                    t1.setUsrid(rs.getInt("usrid"));
                    t1.setUsername(rs.getString("usrname"));
                    t1.setResnickname(rs.getString("owner"));
                    t1.setAccepted(rs.getBoolean("accepted"));
                    notification.addChowner(t1);
                }
                
                
                //recupero le notifiche delle ricchieste di cancellazione delle foto
                PreparedStatement dphoto = con.prepareStatement("SELECT t1.accepted AS accepted,t1.id_user AS usrid, t1.id_photo AS idphoto ,t2.name AS photoname,t4.name AS resname,t3.nickname AS ristoratore,t5.nickname AS fotografo FROM (((request_delete_photos AS t1 INNER JOIN photos AS t2 ON (t1.id_photo = t2.id)) INNER JOIN users AS t3 ON (t1.id_user = t3.id)) INNER JOIN restaurants AS t4 ON(t2.id_restaurant = t4.id)) INNER JOIN users AS t5 ON (t2.id_user = t5.id );");
                rs = dphoto.executeQuery();

                while(rs.next()){
                    DeletePhotoNotificationBean t1 = new DeletePhotoNotificationBean();
                    t1.setIdphoto(rs.getInt("idphoto"));
                    t1.setNickname(rs.getString("ristoratore"));
                    t1.setPhotoname(rs.getString("photoname"));
                    t1.setResname(rs.getString("resname"));
                    t1.setUsrid(rs.getInt("usrid"));
                    t1.setAccepted(rs.getBoolean("accepted"));
                    t1.setPhname(rs.getString("fotografo"));
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
