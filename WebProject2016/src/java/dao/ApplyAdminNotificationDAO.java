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
 * Classe DAO che mi permette di applicare tutte le modifiche a tutti i tipi di notidiche 
 * che riguardano l'amministratore
 * @author Marco
 */
public class ApplyAdminNotificationDAO {

    ManagerDB db;
    Connection con;

    public ApplyAdminNotificationDAO() {
        db = new ManagerDB();
        con = db.getConnection();
    }

    /**
     * ConfirmReplies: metodo che permette di accettare le reply di un ristoratore, e qundi far si che poi vengano pubblicate sul sito
     * @param id id della reply
     * @param adminid id dell'amministratore
     * @return int 1 se la modifica è andata a buon fine, 0 se la modifica non è stata apportata.
     * @throws SQLException
     * @throws Throwable
     */

    public int confirmReplies(int id, int adminid) throws SQLException, Throwable {
        PreparedStatement replies = null;
        try {
            //rendo visibile la reply
            replies = con.prepareStatement("UPDATE replies SET accepted = true, date_validation = now(),id_validator=? WHERE id =? ");
            replies.setInt(1, adminid);
            replies.setInt(2, id);
            int value = replies.executeUpdate();
            this.finalize();
            con.close();
            /*
             Uso questo tipo di return perchè: siccome andrò a modificare solouna riga,e per come è definito il return value di update, ritorna 1 se
             la riga è stata modificata o 0 se la riga non è stata modificata
            */
            return value;
        } finally {
            replies.close();
        }
    }

    /**
     *
     * @param id id della reply da cancellare
     * @param adminid id dell'admin che l'accetta
     * @return int Ritorna il numero di reply aggiornate a false e quindi che non devono essere mostrate al pubblico, che al massimo può essere 1. Quindi 
     * ritornerà 1 quando aggiornata e 0 qunado non è stato possibile aggiornarla
     * @throws SQLException
     * @throws Throwable
     */
    public int deleteReplies(int id, int adminid) throws SQLException, Throwable {
        PreparedStatement replies = null;
        try {
            //rendo non visibile una reply
            replies = con.prepareStatement("UPDATE replies SET accepted = false, date_validation = now(),id_validator=? WHERE id =? ");
            replies.setInt(1, adminid);
            replies.setInt(2, id);
            int value = replies.executeUpdate();
            this.finalize();
            con.close();
            return value;
        } finally {
            replies.close();
        }
    }
    /**
     * Questo metodo mi permette di aggiornare la richiesta della foto e aggiornare il valore a true e quindi 
     * la foto potrà essere pubblicata
     * @param id int id della photo request
     * @return int numero di righe aggiornate nel database
     * @throws SQLException
     * @throws Throwable 
     */
    public int acceptPhotoRequest(int id) throws SQLException, Throwable {
        PreparedStatement replies = null;
        int value;
        try {
            //aggiorno la tabella delle notifiche
            replies = con.prepareStatement("UPDATE request_delete_photos SET accepted = true WHERE id_photo =? ");
            replies.setInt(1, id);
            value = replies.executeUpdate();
            //rendo visibile la foto
            replies = con.prepareStatement("UPDATE photos SET visible = true WHERE id =? ");
            replies.setInt(1, id);
            value = replies.executeUpdate();
            this.finalize();
            con.close();
            return value;
        } finally {
            replies.close();
        }
    }
    /**
     * Questo metodo mi permette di aggiornare la richiesta della foto e aggiornare il valore a false e quindi 
     * la foto non potrà essere pubblicata
     * @param id int id della photo request delete
     * @return int che è il numero di righe aggiornate nel database (che potranno essere 1 o 0)
     * @throws SQLException
     * @throws Throwable 
     */
    public int discardPhotoRequest(int id) throws SQLException, Throwable {
        PreparedStatement replies = null;
        int value;
        try {
            //aggiorno la tabella delle notifiche delle foto
            replies = con.prepareStatement("UPDATE request_delete_photos SET accepted = false WHERE id_photo =? ");
            replies.setInt(1, id);
            value = replies.executeUpdate();
            //rendo non visibile la foto
            replies = con.prepareStatement("UPDATE photos SET visible = false WHERE id =? ");
            replies.setInt(1, id);
            value = replies.executeUpdate();
            this.finalize();
            con.close();
            return value;
        } finally {
            replies.close();
        }
    }

    /**
     * Metodo che premette di aggiornare il proprietario di un ristorante e quindi di conseuenza
     * anche il tipo di user.
     * @param idu int id dell'user
     * @param idr int id del ristorante
     * @return int che è il numero di righe aggiornate nel database (che potranno essere 1 o 0)
     * @throws SQLException
     * @throws Throwable 
     */
    public int acceptChangeOwnerRequest(int idu,int idr) throws SQLException, Throwable {
        PreparedStatement replies = null;
        int value;
        try {
            //aggiorno la tabella delle notifiche
            replies = con.prepareStatement("UPDATE request_changes_owner SET accepted = true WHERE id_user = ? AND id_restaurant = ?  ");
            replies.setInt(1, idu);
            replies.setInt(2, idr);
            value = replies.executeUpdate();
            //aggiorno il tipo di utente
            replies = con.prepareStatement("UPDATE users SET type = 1  WHERE id = ? ");
            replies.setInt(1, idu);
            value = replies.executeUpdate();
            //aggiorno il propietario del ristorante
            replies = con.prepareStatement("UPDATE restaurants SET id_owner = ?  WHERE id = ? ");
            replies.setInt(1, idu);
            replies.setInt(2, idr);
            value = replies.executeUpdate();
            this.finalize();
            con.close();
            return value;
        } finally {
            replies.close();
        }
    }
    /**
     * Con questo metodo annullo una richiesta di cambiamento di propietario
     * @param idu int id dell'utente
     * @param idr int id del ristorante
     * @return un int che è il numero di righe aggiornate all'interno del database
     * @throws SQLException
     * @throws Throwable 
     */
    public int discardChangeOwnerRequest(int idu,int idr) throws SQLException, Throwable {
        PreparedStatement replies = null;
        int value;
        try {
            //aggiorno la tabella delle notifiche del change owner
            replies = con.prepareStatement("UPDATE request_changes_owner SET accepted = false WHERE id_user = ? AND id_restaurant = ?  ");
            replies.setInt(1, idu);
            replies.setInt(2, idr);
            value = replies.executeUpdate();
            this.finalize();
            con.close();
            return value;
        } finally {
            replies.close();
        }
    }

    /**
     * Metodo che utilizzo per essere sicuro che le connessioni al database vengano chiuse e non rimangano pendenti
     * @throws Throwable 
     */
    @Override
    protected void finalize() throws Throwable {
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        super.finalize();
    }

}
