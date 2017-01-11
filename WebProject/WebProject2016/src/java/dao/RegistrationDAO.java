/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author David
 */
public class RegistrationDAO {

    final String regquery = "INSERT INTO users(name,surname,nickname,email,password,type) VALUES (?,?,?,?,?,-1)";
    ManagerDB db = new ManagerDB();
    Connection con = db.getConnection();

    public RegistrationDAO() {

    }

    public int setRegistrationParameters(String name, String surname, String nickname, String email, String password) throws SQLException {

        int affectedRows = 0;
        int userID = 0;
        
            PreparedStatement ps = con.prepareStatement(regquery, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, name);
            ps.setString(2, surname);
            ps.setString(3, nickname);
            ps.setString(4, email);
            ps.setString(5, password);

            affectedRows = ps.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Errore creazione utente, no rows affected.");
            }
            //Andiamo a prendere l'id del nuovo utente
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    userID = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Errore creazione utente, no ID obtained.");
                }
            }
            return userID;
        }
    
}
