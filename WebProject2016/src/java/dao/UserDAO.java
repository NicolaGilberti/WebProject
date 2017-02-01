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
import java.sql.Statement;
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
    
    public UserBean authenticate(String email, String password) throws SQLException {
        String query = "SELECT * FROM users WHERE email = ? AND password = ? AND type <> -1";
        //Eseguo la query di verifica dei parametri
        PreparedStatement stm = con.prepareStatement(query);

        try {
            stm.setString(1, email);
            stm.setString(2, password);

            ResultSet rs = stm.executeQuery();

            try {
                if (rs.next()) {
                    UserBean user = new UserBean();
                    // vado a creare un nuovo UserBean con i dati ottenuti
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
        } finally { 
                // ricordarsi SEMPRE di chiudere i PreparedStatement in un blocco finally 
            stm.close();
        }

    }

    public int upgradeUser(int userId) throws SQLException {
        // Preparo la query
        String upgradequery = "UPDATE users SET type=1 WHERE id=?";
        int affectedRows = 0;
        PreparedStatement ps = con.prepareStatement(upgradequery);
        // Imposto il tipo da 0 a 1 
        ps.setInt(1, userId);
        affectedRows = ps.executeUpdate();
        
        return affectedRows;
    }

    public int updateUserType(String id) throws SQLException {
        // Preparo la query
        String updateuserquery = "UPDATE users SET type=0 WHERE id=?";
        PreparedStatement ps = con.prepareStatement(updateuserquery);
        //imposto la type da -1 a 0
        ps.setInt(1, Integer.valueOf(id));
        int affectedRows = ps.executeUpdate();
        return affectedRows;
    }
    
    public int setRegistrationParameters(String name, String surname, String nickname, String email, String password) throws SQLException {
        String regquery = "INSERT INTO users(name,surname,nickname,email,password,type) VALUES (?,?,?,?,?,-1)";
        int affectedRows = 0;
        int userID = 0;

        // Inserisco i dati nel database utilizzando la variabile regquery, definita sopra
        PreparedStatement ps = con.prepareStatement(regquery, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, name);
        ps.setString(2, surname);
        ps.setString(3, nickname);
        ps.setString(4, email);
        ps.setString(5, password);

        //eseguo l'update
        affectedRows = ps.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Errore creazione utente, no rows affected.");
        }
        //Andiamo a prendere l'id del nuovo utente
        try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                userID = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Errore creazione utente, no ID obtained.");
            }
        }
        return userID;
    }

    public ResultSet searchUserToRegisterByID(String id) throws SQLException {

        String searchbyidquery = "SELECT * FROM users WHERE id=?";
        //Preparazione query
        PreparedStatement ps = con.prepareStatement(searchbyidquery);
        ps.setInt(1, Integer.valueOf(id));
        ResultSet results = ps.executeQuery();

        return results;
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
    
    /**
     * Restituisce una lista che contiene i ristoranti appartenenti all'utente
     * con id = userId
     * @param userId
     * @return ArrayList rest
     */
    public ArrayList<RestaurantBean> getRestaurants(int userId) {
        ArrayList<RestaurantBean> rest = new ArrayList<RestaurantBean>();

        String restQuery = "SELECT r.id,r.name,r.description,r.address,r.city,r.global_value,"
                + "(SELECT p1.name FROM photos p1 WHERE p1.id_restaurant = r.id LIMIT 1) AS photo_name, "
                + "(SELECT COUNT(*) FROM reviews re WHERE re.id_restaurant = r.id) AS n_reviews "
                + "FROM restaurants r "
                + "WHERE r.id_owner=?";

        try {
            PreparedStatement ps = con.prepareStatement(restQuery);
            ps.setInt(1, userId);

            ResultSet results = ps.executeQuery();

            //Per tutti i risultati
            RestaurantBean risto = new RestaurantBean();
            ArrayList<CuisineBean> cList;
            while (results.next()) {

                    risto = new RestaurantBean();
                    // Imposto tutte le caratteristiche del ristorante
                    risto.setId(results.getInt("id"));
                    risto.setName(results.getString("name"));
                    risto.setDescription(results.getString("description"));
                    risto.setAddress(results.getString("address"));
                    risto.setCity(results.getString("city"));
                    risto.setGlobal_value(results.getInt("global_value"));
                    risto.setImgPath(results.getString("photo_name"));
                    risto.setNumReviews(results.getInt("n_reviews"));
                    
                    RestaurantDAO rDAO = new RestaurantDAO();
                    cList = rDAO.getCuisines(risto.getId());
                    rDAO.closeConnection();
                    
                    risto.setCuisineTypes(cList);
                    rest.add(risto);
            }

            return rest;

        } catch (SQLException ex) {
            Logger.getLogger(UserAccountPage.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    /**
     * Procedura che trova le ultime 5 (al massimo) recensioni rilasciate
     * dall'utente con id = userId
     * @param userId
     * @return ArrayList rev
     */
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
                ReviewBean review = new ReviewBean();
                
                // imposto tutte le caratteristiche delle review
                review.setAtmosphere(results.getInt("atmosphere"));
                review.setData_creation(results.getTimestamp("data_creation"));
                review.setDescription(results.getString("description"));
                review.setFood(results.getInt("food"));
                review.setGlobal_value(results.getInt("global_value"));
                review.setId(results.getInt("id_review"));
                //r.setId_creator(results.getInt("id_creator"));
                //r.setId_photo(results.getInt("id_photo"));
                int id_photo = results.getInt("id_photo");
                
                // Inizio il controllo per la foto. Se esiste la foto...
                if (id_photo != 0) {
                    
                    // ...vado  a prenderne il nome
                    String photoName_query = "SELECT name FROM photos WHERE id=" + id_photo;
                    ps = con.prepareStatement(photoName_query);
                    ResultSet res1 = ps.executeQuery();

                    if (res1.next()) {
                        review.setPhoto_name(res1.getString("name"));
                    }
                } else {
                    // ...altrimenti se non c'è imposto il campo a "no"
                    review.setPhoto_name("no");
                }
                review.setId_restaurant(results.getInt("id_restaurant"));
                review.setName(results.getString("name_review"));
                review.setService(results.getInt("service"));
                review.setValue_for_money(results.getInt("value_for_money"));
                review.setRestaurant_name(results.getString("name_restaurant"));
                review.setRestaurant_city(results.getString("city_restaurant"));
                rev.add(review);
            }

            return rev;
        } catch (SQLException ex) {
            Logger.getLogger(UserAccountPage.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    /**
     * Procedura per la modifica della password. 
     * Controlla la validita della vechcia password (oldPwd), poi verifica che
     * newPwd e newPwd2 siano uguali e successivamente inserisce newPwd nel
     * database utilizzando sha256.
     * @param userId
     * @param oldPwd
     * @param newPwd
     * @param newPwd2
     * @return AlertBean alert
     */
    public AlertBean changePassword(int userId, String oldPwd, String newPwd, String newPwd2) {

        AlertBean alert = new AlertBean();

        String oldpwd_query = "SELECT password FROM users WHERE id=?";

        try {

            PreparedStatement ps = con.prepareStatement(oldpwd_query);
            ps.setInt(1, userId);

            ResultSet results = ps.executeQuery();

            if (results.next()) {
                
                // Prendo dal database la vecchia password e codifico secondo SHA256 tutti i parametri come la vecchia pwd, la nuova e la conferma della nuova
                String old_db_pwd = results.getString("password");
                String oldpwd = org.apache.commons.codec.digest.DigestUtils.sha256Hex(oldPwd);
                String newpwd = org.apache.commons.codec.digest.DigestUtils.sha256Hex(newPwd);
                String newpwd2 = org.apache.commons.codec.digest.DigestUtils.sha256Hex(newPwd2);

                // Se quella nel database è uguale a quella scritta dall'utente
                if (old_db_pwd.equals(oldpwd)) {
                    // E quella nuova è uguale alla conferma della nuova
                    if (newpwd.equals(newpwd2)) {
                        
                        // Allora eseguo l'aggiornamento
                        String newpwd_query = "UPDATE users SET password=? WHERE id=?";
                        ps = con.prepareStatement(newpwd_query);
                        ps.setString(1, newpwd);
                        ps.setInt(2, userId);
                        ps.executeUpdate();
                        
                        // comunico
                        alert.setType(0);
                        alert.setTitle("");
                        alert.setDescription("La modifica della password è avvenuta con successo.");
                    } else {
                        
                        // comunico
                        alert.setType(1);
                        alert.setTitle("Errore!");
                        alert.setDescription("Nuova password non valida. Riprovare");
                    }
                } else {
                    
                    // comunico
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
        }

        return alert;
    }

    public int changePassword(int id, String pass) throws SQLException {
        // Preparo la query
        String changepasswordquery = "UPDATE users SET password=? WHERE id=?";
        // la inserisco all'interno del database
        PreparedStatement ps = con.prepareStatement(changepasswordquery);
        
        ps.setString(1, pass);
        ps.setInt(2, id);
        int affected=ps.executeUpdate();
        ps.close();
        return affected;
    }

    /**
     * Procedura per la modifica del nickname.
     * Controlla la validita della password utente, successivamente aggiorna il
     * nickname con quello fornito in input. Viene passato anche lo UserBean
     * per poter aggiornare il nickname della variabile "user" in sessione.
     * @param user
     * @param newNick
     * @param password
     * @return 
     */
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
                
                // Prendo la password dal database e se è uguale a quella inserita
                if (pwd.equals(db_pwd)) {
                    
                    // Setto il nuovo nickname
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

    public String getName(int id)
    {
        try {
            // Preparo la query
            String query = "SELECT name from users WHERE id=?";
            String name="";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet res=ps.executeQuery();
            while(res.next())
            {
                 name=res.getString(1);
            }
            res.close();
            ps.close();
            return name;
        
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return "";
        }
        
    }
    
}
