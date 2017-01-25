/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
    
    public void upgradeUser(int userId) throws SQLException
    {
        String query="UPDATE users SET type=1 WHERE id=?";
        
        int affectedRows = 0;
        PreparedStatement ps = con.prepareStatement(query);
      
        ps.setInt(1,userId);
        affectedRows = ps.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Errore aggiornamento utente, no rows affected.");
        }
        
    }
    
}
