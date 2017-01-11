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
import javax.servlet.RequestDispatcher;

/**
 *
 * @author nicol
 */
public class ChangeUserNickDAO {

    private UserBean user;

    public UserBean getUser() {
        return user;
    }

    public void setUser(UserBean user) {
        this.user = user;
    }

    public ChangeUserNickDAO(UserBean user) {
        this.user = user;
    }

    public AlertBean changeNickname(String newNick, String password) {
        ManagerDB manager = new ManagerDB();
        Connection connection = manager.getConnection();

        String pwd = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);

        AlertBean alert = new AlertBean();

        try {
            String pwdQuery = "SELECT password FROM users WHERE id=" + this.user.getId();
            PreparedStatement ps = connection.prepareStatement(pwdQuery);
            ResultSet results = ps.executeQuery();

            if (results.next()) {

                String db_pwd = results.getString("password");

                if (pwd.equals(db_pwd)) {

                    String nick_query = "UPDATE users SET nickname='" + newNick + "' WHERE id=" + this.user.getId();

                    ps = connection.prepareStatement(nick_query);
                    ps.executeUpdate();

                    user.setNickname(newNick);

                    alert.setType(0);
                    alert.setTitle("Nickname modificato con successo in ");
                    alert.setDescription(newNick);
                } else {

                    alert.setType(1);
                    alert.setTitle("Errore!");
                    alert.setDescription("Password non valida. Riprovare");
                }
            } else {

                alert.setType(1);
                alert.setTitle("Errore!");
                alert.setDescription("Si è verificato un errore nel sistema. Riprovare più tardi");
            }
        } catch (Exception ex) {
            System.out.println("changeUserPwd " + ex.toString());
        }
        
        return alert;
    }

}
