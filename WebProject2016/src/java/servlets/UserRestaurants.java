/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.CuisineBean;
import beans.RestaurantSearchBean;
import beans.ReviewBean;
import beans.UserBean;
import database.ManagerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MirkoPortatile
 */

public class UserRestaurants extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserBean user = (UserBean) session.getAttribute("user");
        int id = user.getId();

        List<RestaurantSearchBean> restaurantsList = new ArrayList<RestaurantSearchBean>();
        List<ReviewBean> reviewsList = new ArrayList<ReviewBean>();
        //Instauriamo connessione
        ManagerDB manager = new ManagerDB();
        Connection connection = manager.getConnection();
        String sql_rest = "SELECT r.id,r.name,r.description,r.address,r.city,r.global_value,"
                + "(SELECT p1.name FROM photos p1 WHERE p1.id_restaurant = r.id LIMIT 1) AS photo_name, "
                + "(SELECT COUNT(*) FROM reviews re WHERE re.id_restaurant = r.id) AS n_reviews, "
                + "c.name AS cuisine_name "
                + "FROM restaurants r JOIN photos p ON (r.id = p.id_restaurant) JOIN restaurants_cuisine rc ON (rc.id_restaurant = r.id) JOIN cuisine c ON (c.id = rc.id_cuisine) "
                + "WHERE id_owner=" + id;
        String sql_comm = "SELECT r.id AS id_review,"
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
                + "WHERE r.id_creator=" + id;

        try {
            PreparedStatement ps = connection.prepareStatement(sql_rest);
            ResultSet results = ps.executeQuery();

            //Per tutti i risultati
            RestaurantSearchBean risto = new RestaurantSearchBean();
            ArrayList<CuisineBean> cList;
            while (results.next()) {

                if (results.isFirst() || results.getInt("id") != risto.getId()) {
                    CuisineBean c = new CuisineBean();
                    c.setName(results.getString("cuisine_name"));
                    
                    risto = new RestaurantSearchBean();
                    cList = new ArrayList<CuisineBean>();
                    cList.add(c);
                    
                    risto.setId(results.getInt("id"));
                    risto.setName(results.getString("name"));
                    risto.setDescription(results.getString("description"));
                    risto.setAddress(results.getString("address"));
                    risto.setCity(results.getString("city"));
                    risto.setGlobalValue(results.getInt("global_value"));
                    risto.setImgPath(results.getString("photo_name"));
                    risto.setNumReviews(results.getInt("n_reviews"));
                    risto.setCuisineTypes(cList);
                    restaurantsList.add(risto);
                } else if (results.getInt("id") == risto.getId()) {
                    CuisineBean c = new CuisineBean();
                    c.setName(results.getString("cuisine_name"));
                    risto.getCuisineTypes().add(c);
                }
            }
            ps = null;
            results = null;

            ps = connection.prepareStatement(sql_comm);
            results = ps.executeQuery();

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

                    ps = connection.prepareStatement(photoName_query);
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
                reviewsList.add(r);
            }

            request.setAttribute("restaurants", restaurantsList); // Will be available as ${restaurants} in JSP
            request.setAttribute("reviews", reviewsList); // Will be available as ${reviews} in JSP
            //request.setAttribute("sql", id);
            request.getRequestDispatcher("currentUser.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(UserRestaurants.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
