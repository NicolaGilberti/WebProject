/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.UserBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author David
 */
public class LoginDAO {

    private final String email;
    private final String password;
    ManagerDB db = new ManagerDB();
    Connection con = db.getConnection();
    final String query = "SELECT * FROM users WHERE email = ? AND password = ?";

    /**
     *
     * @param email
     * @param password
     */
    public LoginDAO(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public UserBean authenticate() throws SQLException {

        PreparedStatement stm = con.prepareStatement(query);

        try {
            stm.setString(1, email);
            stm.setString(2, password);

            ResultSet rs = stm.executeQuery();

            try {
                if (rs.next()) {
                    UserBean user = new UserBean();
                    user.setEmail(rs.getString("email"));
                    user.setName(rs.getString("name"));
                    user.setSurname(rs.getString("surname"));
                    user.setNickname(rs.getString("nickname"));
                    user.setId(rs.getInt("id"));
                    //   user.setLast_log("last_log");
                    user.setType(Integer.valueOf(rs.getString("type")));
                    return user;
                } else {
                    return null;
                }
            } finally {
                // ricordarsi SEMPRE di chiudere i ResultSet in un blocco finally 
                rs.close();
            }
        } finally { // ricordarsi SEMPRE di chiudere i PreparedStatement in un blocco finally 
            stm.close();
        }

    }
}
