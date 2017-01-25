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
public class ApplyConfirmRepliesDAO {
    ManagerDB db;
    Connection con;
    
    public ApplyConfirmRepliesDAO(){
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
    
    public int confirmReplies(int id) throws SQLException, Throwable{
        PreparedStatement replies = null;
        try{
            replies = con.prepareStatement("UPDATE replies SET accepted = true WHERE id =? ");
            replies.setInt(1,id);
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
    
     public int deleteReplies(int id) throws SQLException, Throwable{
        PreparedStatement replies = null;
        try{
            replies = con.prepareStatement("DELETE FROM replies WHERE id = ?");
            replies.setInt(1,id);
            int value = replies.executeUpdate();
            this.finalize();
            con.close();
            return value;
        }finally{
            replies.close();
        }
    }
    
    public void discardReplies() throws SQLException, Throwable{
        
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

