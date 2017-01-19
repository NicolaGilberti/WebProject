/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.RestaurantBean;
import dao.RestaurantDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mirko
 */
//Servlet il cui scopo è quello di ottenere i dati dal database utilizzati nella index.jsp. 
//In questo caso, ottiene dal Dao i ristoranti più richiesti. 
public class PrepareHome extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAO dao = new RestaurantDAO();
        //Otteniamo i ristoranti più popolari
        try {
            List<RestaurantBean> restaurantsList = dao.getRestaurantsbyPopularity();
              Logger.getLogger(PrepareHome.class.getName()).log(Level.INFO, "Passati di qui: "+restaurantsList.size());
            response.setContentType("text/html");
            request.setAttribute("PopularRestaurants", restaurantsList);
            request.getRequestDispatcher("/index.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(PrepareHome.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
