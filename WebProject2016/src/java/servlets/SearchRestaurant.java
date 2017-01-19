/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.CuisineBean;
import beans.RestaurantSearchBean;
import com.google.gson.Gson;
import comparators.CuisineAlphabeticalComparator;
import comparators.RestaurantSearchNameComparator;
import comparators.RestaurantSearchValueComparator;
import dao.RestaurantDAO;
import database.ManagerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MirkoPortatile
 */
public class SearchRestaurant extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAO dao = new RestaurantDAO();
        List<RestaurantSearchBean> restaurantsList = new ArrayList<RestaurantSearchBean>();

        //Se e' stata fatta la ricerca normale
        if (request.getParameter("searchinput") != "") {
            try {
                restaurantsList = dao.getRestaurantsbySearch(request.getParameter("searchinput"));
            } catch (SQLException ex) {
                Logger.getLogger(SearchRestaurant.class.getName()).log(Level.SEVERE, null, ex);
            }
        } //Altrimenti se e' stata fatta la ricerca gps
        else if (request.getParameter("lat") != "" && request.getParameter("long") != "") {
            try {
                restaurantsList = dao.getRestaurantsbyLocation(Float.valueOf(request.getParameter("lat")), Float.valueOf(request.getParameter("long")));
            } catch (SQLException ex) {
                Logger.getLogger(SearchRestaurant.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            throw new ServletException("Nessun parametro per la ricerca");
        }

        response.setContentType("application/json");
        response.getWriter().write(new Gson().toJson(restaurantsList));
    }

}
