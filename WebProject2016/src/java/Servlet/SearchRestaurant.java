/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import beans.RestaurantSearch;
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

/**
 *
 * @author MirkoPortatile
 */
@WebServlet(name = "SearchRestaurant", urlPatterns = {"/SearchRestaurant"})
public class SearchRestaurant extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String valoreInserito = request.getParameter("searchinput");
       valoreInserito=valoreInserito.replaceAll("'","''");
       
       String[] valoriInseriti= valoreInserito.split("\\s+");
       
        List<RestaurantSearch> restaurantsList=new ArrayList<RestaurantSearch>();
        //Instauriamo connessione
        ManagerDB manager = new ManagerDB();
        Connection connection = manager.getConnection();
        
       String sql = "select id,name,description,address,city " +
"from (select id,name,description,address,city,(name ||' , '|| address ||' , '||city) as t" +
" from restaurants) as a " +
"where t @@ '";
         for(int i=0;i<valoriInseriti.length;i++)
        {
            sql+=valoriInseriti[i];
            sql+=" && ";
        }
        sql+="'";
        
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
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

        } catch (SQLException ex) {
            Logger.getLogger(SearchRestaurantAutocomplete.class.getName()).log(Level.SEVERE, null, ex);
        }
       
            request.setAttribute("restaurants", restaurantsList); // Will be available as ${restaurants} in JSP
            request.getRequestDispatcher("results.jsp").forward(request, response);
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */

}
