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
 * Classe che mi serve per gestire l'inserzione di una reply da parte di un ristoratore 
 * e la possibilità di inserire una richiesta di cancellazione di una foto.
 * @author Marco
 */
public class InsertReplyDAO {
    ManagerDB db;
    Connection con;
    
    public InsertReplyDAO(){
        db= new ManagerDB();
        con = db.getConnection();
    }

    /**
     * Metodo che utilizzo per inserire una reply nella tabella delle reply. 
     * Prende in input un review bean e una stringa descrizione, e li aggiugne al 
     * database
     * @param rev ReviewBean
     * @param description una stringa di descrizione
     * @return value int, valore dell'insert
     * @throws SQLException
     * @throws Throwable 
     */
    public int insertReply(ReviewBean rev, String description) throws SQLException, Throwable{
        PreparedStatement replies = null;
        System.out.println("Inserimento reply per:"+rev);
        try{
            //inserisco la reply nella tabella
            replies = con.prepareStatement("INSERT INTO replies(description,data_creation,id_review,id_owner) VALUES (?,now(),?,?);");
            replies.setString(1,description);
            replies.setInt(2,rev.getId());
            replies.setInt(3,rev.getId_creator());
            int value = replies.executeUpdate();
            this.finalize();
            con.close(); 
            System.out.println("Risultato insert"+value);
            return value;
        }finally{
            replies.close();
            con.close();
        }
    }
    /**
     * Metodo che mi serve per segnare una notifica del ristoratore come vista
     * quando ci clicca sopra.
     * @param id int, id della review
     * @throws SQLException
     * @throws Throwable 
     */
    public void UpdateReply(int id) throws SQLException, Throwable{
        PreparedStatement replies = null;
        try{
            //faccio l'update della notifica vista
            replies = con.prepareStatement("UPDATE reviews SET view=true WHERE id=?");
            replies.setInt(1,id);
            replies.executeUpdate();
            this.finalize();
            con.close(); 
        }finally{
            replies.close();
            con.close();
        }
    }
    /**
     * Metodo per l'inserzione di una richiesta di delete photo.
     * Questo metodo serve per inserire la richiesta nel database
     * @param id int id dell'user che ha fatto la recensione
     * @param id_photo int id dell photo
     * @return
     * @throws SQLException
     * @throws Throwable 
     */
    public int InsertPhotoReport(int id,int id_photo) throws SQLException, Throwable{
        PreparedStatement replies = null;
        int value;
        try{
            //aggiungo la richiesta alla tabella
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
            con.close();
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
