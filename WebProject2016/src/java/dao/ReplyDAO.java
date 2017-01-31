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
 *
 * @author RiccardoUni
 */
public class ReplyDAO {
    private ManagerDB db = null;
    private Connection con = null;

    public ReplyDAO() {
        db = new ManagerDB();
        con = db.getConnection();
    }
    
    public ReplyBean getReplyFromIdReview(int idReview) throws SQLException {
        ReplyBean result = new ReplyBean();
        
        String query = "SELECT * FROM replies WHERE accepted='true' AND id_review = ?";
         PreparedStatement ps = con.prepareStatement(query);
         ps.setInt(1, idReview);
         ResultSet rs = ps.executeQuery();
         
         if (rs.next()) {
             result.setId(rs.getInt("id"));
             result.setDesc(rs.getString("description"));
             result.setData_creation(rs.getTimestamp("data_creation"));
             result.setId_review(rs.getInt("id_review"));
             result.setId_owner(rs.getInt("id_owner"));
             result.setData_validation(rs.getTimestamp("data_validation"));
             result.setId_validator(rs.getInt("id_validator"));
             result.setAccepted(rs.getBoolean("accepted"));
             
         }
         
         rs.close();
         ps.close();
         
         return result;
    }
}
