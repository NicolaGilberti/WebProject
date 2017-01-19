/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.AlertBean;
import beans.UserBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author nicol
 */
public class ChangeUserPwdDAO {
    
    private UserBean user;

    public UserBean getUser() {
        return user;
    }

    public void setUser(UserBean user) {
        this.user = user;
    }
    
    public ChangeUserPwdDAO(UserBean user) {
        this.user = user;
    }

    public AlertBean changePassword(String oldPwd, String newPwd, String newPwd2) {

        AlertBean alert = new AlertBean();

        ManagerDB manager = new ManagerDB();
        Connection connection = manager.getConnection();
        String oldpwd_query = "SELECT password FROM users WHERE id=" + this.user.getId();

        try {

            PreparedStatement ps = connection.prepareStatement(oldpwd_query);
            ResultSet results = ps.executeQuery();

            if (results.next()) {

                String old_db_pwd = results.getString("password");
                String oldpwd = org.apache.commons.codec.digest.DigestUtils.sha256Hex(oldPwd);
                String newpwd = org.apache.commons.codec.digest.DigestUtils.sha256Hex(newPwd);
                String newpwd2 = org.apache.commons.codec.digest.DigestUtils.sha256Hex(newPwd2);

                if (old_db_pwd.equals(oldpwd)) {
                    if (newpwd.equals(newpwd2)) {
                        String newpwd_query = "UPDATE users SET password='" + newpwd + "' WHERE id=" + this.user.getId();

                        ps = connection.prepareStatement(newpwd_query);
                        ps.executeUpdate();

                        alert.setType(0);
                        alert.setTitle("");
                        alert.setDescription("La modifica della password è avvenuta con successo.");
                    } else {
                        alert.setType(1);
                        alert.setTitle("Errore!");
                        alert.setDescription("Nuova password non valida. Riprovare");
                    }
                } else {
                    alert.setType(1);
                    alert.setTitle("Errore!");
                    alert.setDescription("Vecchia password non valida. Riprovare");
                }

            } else {
                alert.setType(1);
                alert.setTitle("Errore!");
                alert.setDescription("Utente non riconosciuto dal sistema.");
            }
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            /* request.setAttribute("oldpwd", ex.toString());
            dispatcher.forward(request, response);*/
        }
        
        return alert;
    }

}
