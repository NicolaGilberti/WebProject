/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import beans.RestaurantSearch;
import beans.Review;
import beans.User;
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
@WebServlet(name = "UserRestaurants", urlPatterns = {"/UserRestaurants"})
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
        User user = (User) session.getAttribute("user");
        int id = user.getId();

        List<RestaurantSearch> restaurantsList = new ArrayList<RestaurantSearch>();
        List<Review> reviewsList = new ArrayList<Review>();
        //Instauriamo connessione
        ManagerDB manager = new ManagerDB();
        Connection connection = manager.getConnection();
        String sql_rest = "SELECT id,name,description,address,city FROM restaurants WHERE id_owner=" + id;
        String sql_comm = "SELECT r.id,r.global_value,r.food,r.service,r.value_for_money,r.atmosphere,r.name,r.description,r.data_creation,"
                + "r.id_restaurant,r.id_creator,r.id_photo,rest.name,"
                + "rest.city FROM reviews r JOIN restaurants rest WHERE id_creator=" + id;

        try {
            PreparedStatement ps = connection.prepareStatement(sql_rest);
            ResultSet results = ps.executeQuery();

            //Per tutti i risultati
            while (results.next()) {

                RestaurantSearch risto = new RestaurantSearch();
                risto.setId(results.getInt("id"));
                risto.setName(results.getString("name"));
                risto.setDescription(results.getString("description"));
                risto.setAddress(results.getString("address"));
                risto.setCity(results.getString("city"));
                restaurantsList.add(risto);
            }
            ps = null;
            results = null;

            ps = connection.prepareStatement(sql_comm);
            results = ps.executeQuery();

            //Per tutti i risultati
            while (results.next()) {
                Review r = new Review();
                r.setAtmosphere(results.getInt("r.atmosphere"));
                r.setDataCreation(results.getString("r.data_creation"));
                r.setDescription(results.getString("r.description"));
                r.setFood(results.getInt("r.food"));
                r.setGlobalValue(results.getInt("r.global_value"));
                r.setId(results.getInt("r.id"));
                //r.setId_creator(results.getInt("id_creator"));
                r.setId_photo(results.getInt("r.id_photo"));
                r.setId_restaurant(results.getInt("r.id_restaurant"));
                r.setName(results.getString("r.name"));
                r.setService(results.getInt("r.service"));
                r.setValueForMoney(results.getInt("r.value_for_money"));
                r.setRestaurantName(results.getString("rest.name"));
                r.setRestaurantCity(results.getString("rest.city"));
                reviewsList.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SearchRestaurantAutocomplete.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("restaurants", restaurantsList); // Will be available as ${restaurants} in JSP
        request.setAttribute("reviews", reviewsList); // Will be available as ${reviews} in JSP
        request.getRequestDispatcher("currentUser.jsp").forward(request, response);

    }

}
