/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.RestaurantBean;
import beans.ReviewBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;

/**
 * This class is used to manage the Reviews database table.
 *
 * @author RiccardoUni
 */
public class ReviewDAO {

    private ManagerDB db = null;
    private Connection con = null;

    /**
     * connect the DB
     */
    public ReviewDAO() {
        db = new ManagerDB();
        con = db.getConnection();
    }

    /**
     * 
     * add the review passed into the database
     * @param revBean the review to add
     * @return the id of the new review or 0 if the review has not been added
     * @throws SQLException 
     */
    public int insertReview(ReviewBean revBean) throws SQLException {

        int affectedRows;
        int result = 0;
        PreparedStatement ps = con.prepareStatement("INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, revBean.getGlobal_value());
        ps.setInt(2, revBean.getFood());
        ps.setInt(3, revBean.getService());
        ps.setInt(4, revBean.getValue_for_money());
        ps.setInt(5, revBean.getAtmosphere());
        ps.setString(6, revBean.getName());
        ps.setString(7, revBean.getDescription());
        ps.setTimestamp(8, revBean.getData_creation());
        ps.setInt(9, revBean.getId_restaurant());
        ps.setInt(10, revBean.getId_creator());

        affectedRows = ps.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Errore inserimento recensione, no rows affected.");
        }
        try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                result = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Errore creazione recensione, no ID obtained.");
            }
        }
        return result;
    }

    /**
     * add the photoID to reviewID
     * @param reviewID the id of the review
     * @param photoID the id og the photo
     * @throws SQLException 
     */
    public void addPhoto(int reviewID, int photoID) throws SQLException {

        PreparedStatement ps = con.prepareStatement("UPDATE reviews SET id_photo = ? WHERE id = ?");
        ps.setInt(1, photoID);
        ps.setInt(2, reviewID);

        int affectedRows = ps.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Errore inserimento foto, no rows affected.");
        }

        ps.close();

    }
    
    /**
     * insert a like or dislike of a review into the database
     * @param revId the id of the review
     * @param value 1 if is a "like", 0 if is a "dislike"
     * @param userId the id of the user
     * @throws SQLException 
     */
    public void addLikeOrDislike(int revId, int value, int userId) throws SQLException {

        PreparedStatement ps = con.prepareStatement("INSERT INTO user_review_likes VALUES(?,?,?,?)");
        ps.setInt(1, userId);
        ps.setInt(2, revId);
        ps.setInt(3, value);

        Calendar calendar = Calendar.getInstance();
        ps.setTimestamp(4, new java.sql.Timestamp(calendar.getTime().getTime()));

        int affectedRows = ps.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Errore inserimento review, no rows affected.");
        }
        ps.close();
    }
}
