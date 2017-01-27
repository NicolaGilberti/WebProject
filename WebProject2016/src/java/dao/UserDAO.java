/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.ManagerDB;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Mirko
 */
public class UserDAO {

    private ManagerDB db = null;
    private Connection con = null;

    public UserDAO() {
        db = new ManagerDB();
        con = db.getConnection();
    }

    public void upgradeUser(int userId) throws SQLException {
        String query = "UPDATE users SET type=1 WHERE id=?";

        int affectedRows = 0;
        PreparedStatement ps = con.prepareStatement(query);

        ps.setInt(1, userId);
        affectedRows = ps.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Errore aggiornamento utente, no rows affected.");
        }

    }

    public StringBuffer changePassword(String id,String md5) throws SQLException, NoSuchAlgorithmException {
        
        String query = "SELECT * FROM users WHERE id=?";

        PreparedStatement ps;
        ps = con.prepareStatement(query);
        ps.setInt(1, Integer.valueOf(id));

        String email = null;
        String name = null;
        String surname = null;
        String nickname = null;

        ResultSet results = ps.executeQuery();

        while (results.next()) {
            // Prendo i dati dalla query
            email = results.getString("email");
            name = results.getString("name");
            surname = results.getString("surname");
            nickname = results.getString("nickname");

        }
        //JOptionPane.showMessageDialog(null, id + email + name + surname + nickname);

        //Inizio generazione MD5
        MessageDigest md = MessageDigest.getInstance("MD5");

        md.update(email.getBytes());
        md.update(nickname.getBytes());
        md.update(surname.getBytes());
        md.update(name.getBytes());
        //Se è già stato confermato reindirizziamo TODO

        byte[] digest = md.digest();
        StringBuffer sb = new StringBuffer();
        for (byte b : digest) {
            sb.append(String.format("%02x", b & 0xff));
        }
        
        //ritorno lo stringbuffer per l'analisi dei dati
        return sb;
    }

}
