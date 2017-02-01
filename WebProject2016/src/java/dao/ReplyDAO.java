/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.ReplyBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *This class is used to manage the Reply database table and the tables connected to it.
 * @author RiccardoUni
 */
public class ReplyDAO {

    private ManagerDB db = null;
    private Connection con = null;

    /**
     * connect the DB
     */
    public ReplyDAO() {
        db = new ManagerDB();
        con = db.getConnection();
    }
/**
 * 
 * @param idReview
 * @return the Reply (REplyBean) of the review
 * @throws SQLException 
 */
    public ReplyBean getReplyFromIdReview(int idReview) throws SQLException {
        ReplyBean result = null;

        String query = "SELECT * FROM replies WHERE accepted='true' AND id_review = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, idReview);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            result = new ReplyBean();
            result.setId(rs.getInt("id"));
            result.setDesc(rs.getString("description"));
            result.setData_creation(rs.getTimestamp("data_creation"));
            result.setId_review(rs.getInt("id_review"));
            result.setId_owner(rs.getInt("id_owner"));
            result.setData_validation(rs.getTimestamp("date_validation"));
            result.setId_validator(rs.getInt("id_validator"));
            result.setAccepted(rs.getBoolean("accepted"));

        }

        rs.close();
        ps.close();

        return result;
    }
}
