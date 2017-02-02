/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.PhotoBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * This class is used to manage the Photo database table and the tables connected to it.
 * @author Mirko, RiccardoUni
 */
public class PhotoDAO {

    private ManagerDB db = null;
    private Connection con = null;

    /**
     * connect the DB
     */
    public PhotoDAO() {
        db = new ManagerDB();
        con = db.getConnection();
    }
/**
 * 
 * @param foto
 * @return the id of the new photo if it has been added or 0 otherwise
 * @throws SQLException 
 */
    public int addPhoto(PhotoBean foto) throws SQLException {

        int affectedRows = 0;
        int result = 0;
        //Creiamo la query da eseguire. Un insert per ogni tipologia di cucina.
        String query = "INSERT INTO photos(name,description,id_restaurant,id_user,data_creation) VALUES (?,?,?,?,?);";

        PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, foto.getName());
        ps.setString(2, foto.getDescription());
        ps.setInt(3, foto.getId_restaurant());
        ps.setInt(4, foto.getId_user());
        ps.setTimestamp(5, foto.getDate());

        affectedRows = ps.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Errore inserimento foto, no rows affected.");
        }
        try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                result = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Errore creazione foto, no ID obtained.");
            }
        }
        return result;
    }
/**
 * 
 * @param id_photo
 * @return A string containing the name of the photo requested
 * @throws SQLException 
 */
    public String getName(int id_photo) throws SQLException {
        String query = "SELECT name FROM photos WHERE id = ? AND visible = true";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, id_photo);
        ResultSet rs = ps.executeQuery();
        String result = "";
        if (rs.next()) {
            result = rs.getString(1);
        }
        rs.close();
        ps.close();
        return result;

    }
}
