/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.ReviewBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import org.postgresql.util.PSQLException;

/**
 *
 * @author Marco
 */
public class InsertReplyDAO {
    ManagerDB db;
    Connection con;
    
    public InsertReplyDAO(){
        db= new ManagerDB();
        con = db.getConnection();
    }

    
    public boolean insertReply(ReviewBean rev, String description) throws SQLException, Throwable{
        PreparedStatement replies = null;
        System.out.println("Inserimento reply per:"+rev);
        try{
            replies = con.prepareStatement("INSERT INTO replies(description,data_creation,id_review,id_owner) VALUES (?,now(),?,?);");
            replies.setString(1,description);
            replies.setInt(2,rev.getId());
            replies.setInt(3,rev.getId_creator());
            boolean value = replies.execute();
            this.finalize();
            con.close(); 
            System.out.println("Risultato insert"+value);
            return value;
        }finally{
            replies.close();
        }
    }
    
    public void UpdateReply(int id) throws SQLException, Throwable{
        PreparedStatement replies = null;
        try{
            replies = con.prepareStatement("UPDATE reviews SET view=true WHERE id=?");
            replies.setInt(1,id);
            replies.executeUpdate();
            this.finalize();
            con.close(); 
        }finally{
            replies.close();
        }
    }
    
    public int InsertPhotoReport(int id,int id_photo) throws SQLException, Throwable{
        PreparedStatement replies = null;
        int value;
        try{
            replies = con.prepareStatement("INSERT INTO request_delete_photos(id_user,id_photo) VALUES (?,?)");
            replies.setInt(1,id);
            replies.setInt(2,id_photo);
            value = replies.executeUpdate();
            this.finalize();
            con.close(); 
        }catch( PSQLException e){
            return 0;
        }finally{
            replies.close();
        }
        return value;
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
