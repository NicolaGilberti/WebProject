/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.ChangeOwnerNotificationBean;
import beans.DeletePhotoNotificationBean;
import beans.NotificationBean;
import beans.NotificationRepliesBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Marco
 */
public class ApplyAdminNotificationDAO {
    ManagerDB db;
    Connection con;
    
    public ApplyAdminNotificationDAO(){
        db= new ManagerDB();
        con = db.getConnection();
    }
    /**
     * 
     * @param id
     * @return this function return the numbers of the replies updated. i'm going to update 1 row at time so if the reply is updated
     * the function return 1
     * @throws SQLException
     * @throws Throwable 
     */
    
    public int confirmReplies(int id, int adminid) throws SQLException, Throwable{
        PreparedStatement replies = null;
        try{
            replies = con.prepareStatement("UPDATE replies SET accepted = true, date_validation = now(),id_validator=? WHERE id =? ");
            replies.setInt(1,adminid);
            replies.setInt(2,id);
            int value = replies.executeUpdate();
            this.finalize();
            con.close(); 
            return value;
        }finally{
            replies.close();
        }
    }
    
    /**
     * 
     * @param id
     * @return this function return the numbers of the replies deleted. i'm going to delete 1 row at time so if the reply is deleted 
     * the function return 1
     * @throws SQLException
     * @throws Throwable 
     */
    
     public int deleteReplies(int id,int adminid) throws SQLException, Throwable{
        PreparedStatement replies = null;
        try{
            replies = con.prepareStatement("UPDATE replies SET accepted = false, date_validation = now(),id_validator=? WHERE id =? ");
            replies.setInt(1,adminid);
            replies.setInt(2,id);
            int value = replies.executeUpdate();
            this.finalize();
            con.close();
            return value;
        }finally{
            replies.close();
        }
    }
    
    public int acceptPhotoRequest(int id) throws SQLException, Throwable{
        PreparedStatement replies = null;
        int value;
        try{
            replies = con.prepareStatement("UPDATE request_delete_photos SET accepted = true WHERE id_photo =? ");
            replies.setInt(1, id);
            value = replies.executeUpdate();
            replies = con.prepareStatement("UPDATE photos SET visible = true WHERE id =? ");
            replies.setInt(1, id);
            value = replies.executeUpdate();
            this.finalize();
            con.close();
            return value;
        }finally{
            replies.close();
        }
    }
    
    
    public int discardPhotoRequest(int id) throws SQLException, Throwable{
        PreparedStatement replies = null;
        int value;
        try{
            replies = con.prepareStatement("UPDATE request_delete_photos SET accepted = false WHERE id_photo =? ");
            replies.setInt(1, id);
            value = replies.executeUpdate();
            replies = con.prepareStatement("UPDATE photos SET visible = false WHERE id =? ");
            replies.setInt(1, id);
            value = replies.executeUpdate();
            this.finalize();
            con.close();
            return value;
        }finally{
            replies.close();
        }
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

