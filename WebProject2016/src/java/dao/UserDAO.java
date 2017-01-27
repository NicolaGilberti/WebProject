/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.AlertBean;
import beans.CuisineBean;
import beans.RestaurantBean;
import beans.ReviewBean;
import beans.UserBean;
import database.ManagerDB;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import servlets.UserAccountPage;

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

    public void upgradeUser(int userId) throws SQLException {
        String query = "UPDATE users SET type=1 WHERE id=?";

        int affectedRows = 0;
        PreparedStatement ps = con.prepareStatement(query);

        ps.setInt(1, userId);
        affectedRows = ps.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Errore aggiornamento utente, no rows affected.");
        }

    }

    public boolean isValidmd5(String id, String md5) throws SQLException, NoSuchAlgorithmException {

        String query = "SELECT * FROM users WHERE id=?";

        PreparedStatement ps;
        ps = con.prepareStatement(query);
        ps.setInt(1, Integer.valueOf(id));

        String email = null;
        String name = null;
        String surname = null;
        String nickname = null;

        ResultSet results = ps.executeQuery();

        while (results.next()) {
            // Prendo i dati dalla query
            email = results.getString("email");
            name = results.getString("name");
            surname = results.getString("surname");
            nickname = results.getString("nickname");

        }

        //Inizio generazione MD5
        MessageDigest md = MessageDigest.getInstance("MD5");

        md.update(email.getBytes());
        md.update(nickname.getBytes());
        md.update(surname.getBytes());
        md.update(name.getBytes());
        //Se è già stato confermato reindirizziamo TODO

        byte[] digest = md.digest();
        StringBuffer sb = new StringBuffer();
        for (byte b : digest) {
            sb.append(String.format("%02x", b & 0xff));
        }

        //ritorno lo stringbuffer per l'analisi dei dati
        if (sb.toString().equals(md5)) {
            return true;
        }
        {
            return false;
        }

    }

    public ArrayList<RestaurantBean> getRestaurants(int userId) {
        ArrayList<RestaurantBean> rest = new ArrayList<RestaurantBean>();

        String restQuery = "SELECT r.id,r.name,r.description,r.address,r.city,r.global_value,"
                + "(SELECT p1.name FROM photos p1 WHERE p1.id_restaurant = r.id LIMIT 1) AS photo_name, "
                + "(SELECT COUNT(*) FROM reviews re WHERE re.id_restaurant = r.id) AS n_reviews, "
                + "c.name AS cuisine_name "
                + "FROM restaurants r JOIN photos p ON (r.id = p.id_restaurant) JOIN restaurants_cuisine rc ON (rc.id_restaurant = r.id) JOIN cuisine c ON (c.id = rc.id_cuisine) "
                + "WHERE id_owner=?";

        try {
            PreparedStatement ps = con.prepareStatement(restQuery);
            ps.setInt(1, userId);

            ResultSet results = ps.executeQuery();

            //Per tutti i risultati
            RestaurantBean risto = new RestaurantBean();
            ArrayList<CuisineBean> cList;
            while (results.next()) {

                if (results.isFirst() || results.getInt("id") != risto.getId()) {
                    CuisineBean c = new CuisineBean();
                    c.setName(results.getString("cuisine_name"));

                    risto = new RestaurantBean();
                    cList = new ArrayList<CuisineBean>();
                    cList.add(c);

                    risto.setId(results.getInt("id"));
                    risto.setName(results.getString("name"));
                    risto.setDescription(results.getString("description"));
                    risto.setAddress(results.getString("address"));
                    risto.setCity(results.getString("city"));
                    risto.setGlobal_value(results.getInt("global_value"));
                    risto.setImgPath(results.getString("photo_name"));
                    risto.setNumReviews(results.getInt("n_reviews"));
                    risto.setCuisineTypes(cList);
                    rest.add(risto);
                } else if (results.getInt("id") == risto.getId()) {
                    CuisineBean c = new CuisineBean();
                    c.setName(results.getString("cuisine_name"));
                    risto.getCuisineTypes().add(c);
                }
            }

            return rest;

        } catch (SQLException ex) {
            Logger.getLogger(UserAccountPage.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public ArrayList<ReviewBean> getReviews(int userId) {
        ArrayList<ReviewBean> rev = new ArrayList<ReviewBean>();

        String revQuery = "SELECT r.id AS id_review,"
                + "r.global_value AS global_value,"
                + "r.food AS food, r.service AS service,"
                + "r.value_for_money AS value_for_money,"
                + "r.atmosphere AS atmosphere,"
                + "r.name AS name_review,"
                + "r.description AS description,"
                + "r.data_creation AS data_creation,"
                + "r.id_restaurant AS id_restaurant,"
                + "r.id_photo AS id_photo,"
                + "rest.name AS name_restaurant,"
                + "rest.city AS city_restaurant "
                + "FROM reviews r JOIN restaurants rest ON (rest.id = id_restaurant) "
                + "WHERE r.id_creator=? "
                + "ORDER BY r.data_creation DESC "
                + "LIMIT 5";

        try {
            PreparedStatement ps = con.prepareStatement(revQuery);
            ps.setInt(1, userId);

            ResultSet results = ps.executeQuery();

            //Per tutti i risultati
            while (results.next()) {
                ReviewBean r = new ReviewBean();
                r.setAtmosphere(results.getInt("atmosphere"));
                r.setData_creation(results.getString("data_creation"));
                r.setDescription(results.getString("description"));
                r.setFood(results.getInt("food"));
                r.setGlobal_value(results.getInt("global_value"));
                r.setId(results.getInt("id_review"));
                //r.setId_creator(results.getInt("id_creator"));
                //r.setId_photo(results.getInt("id_photo"));
                int id_photo = results.getInt("id_photo");
                if (id_photo != 0) {
                    String photoName_query = "SELECT name FROM photos WHERE id=" + id_photo;

                    ps = con.prepareStatement(photoName_query);
                    ResultSet res1 = ps.executeQuery();

                    if (res1.next()) {
                        r.setPhoto_name(res1.getString("name"));
                    }
                } else {
                    r.setPhoto_name("no");
                }
                r.setId_restaurant(results.getInt("id_restaurant"));
                r.setName(results.getString("name_review"));
                r.setService(results.getInt("service"));
                r.setValue_for_money(results.getInt("value_for_money"));
                r.setRestaurant_name(results.getString("name_restaurant"));
                r.setRestaurant_city(results.getString("city_restaurant"));
                rev.add(r);
            }

            return rev;
        } catch (SQLException ex) {
            Logger.getLogger(UserAccountPage.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public AlertBean changePassword(int userId, String oldPwd, String newPwd, String newPwd2) {

        AlertBean alert = new AlertBean();

        String oldpwd_query = "SELECT password FROM users WHERE id=?";

        try {

            PreparedStatement ps = con.prepareStatement(oldpwd_query);
            ps.setInt(1, userId);

            ResultSet results = ps.executeQuery();

            if (results.next()) {

                String old_db_pwd = results.getString("password");
                String oldpwd = org.apache.commons.codec.digest.DigestUtils.sha256Hex(oldPwd);
                String newpwd = org.apache.commons.codec.digest.DigestUtils.sha256Hex(newPwd);
                String newpwd2 = org.apache.commons.codec.digest.DigestUtils.sha256Hex(newPwd2);

                if (old_db_pwd.equals(oldpwd)) {
                    if (newpwd.equals(newpwd2)) {
                        String newpwd_query = "UPDATE users SET password=? WHERE id=?";

                        ps = con.prepareStatement(newpwd_query);
                        ps.setString(1, newpwd);
                        ps.setInt(2, userId);

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

    public int changePassword(int id,String pass) throws SQLException
    {
         String query = "UPDATE users SET password=? WHERE id=?";
          // la inserisco all'interno del database
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, pass);
            ps.setInt(2, Integer.valueOf(id));
            return ps.executeUpdate();
    }
    
    
    public AlertBean changeNickname(UserBean user, String newNick, String password) {

        String pwd = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);

        AlertBean alert = new AlertBean();

        try {
            String pwdQuery = "SELECT password FROM users WHERE id=?";

            PreparedStatement ps = con.prepareStatement(pwdQuery);
            ps.setInt(1, user.getId());

            ResultSet results = ps.executeQuery();

            if (results.next()) {

                String db_pwd = results.getString("password");

                if (pwd.equals(db_pwd)) {

                    String nick_query = "UPDATE users SET nickname=? WHERE id=?";

                    ps = con.prepareStatement(nick_query);
                    ps.setString(1, newNick);
                    ps.setInt(2, user.getId());

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
