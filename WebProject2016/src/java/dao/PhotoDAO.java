/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.PhotoBean;
import beans.StateBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mirko
 */
public class PhotoDAO {

    private ManagerDB db = null;
    private Connection con = null;

    public PhotoDAO() {
        db = new ManagerDB();
        con = db.getConnection();
    }

    public void addPhoto(PhotoBean foto) throws SQLException {

        int affectedRows = 0;
        //Creiamo la query da eseguire. Un insert per ogni tipologia di cucina.
        String query = "INSERT INTO photos(name,description,id_restaurant,id_user,data_creation) VALUES (?,?,?,?,?);";

        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, foto.getName());
        ps.setString(2, foto.getDescription());
        ps.setInt(3, foto.getId_restaurant());
        ps.setInt(4, foto.getId_user());
        ps.setTimestamp(5, foto.getDate());
        affectedRows = ps.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Errore inserimento foto, no rows affected.");
        }
    }
}
