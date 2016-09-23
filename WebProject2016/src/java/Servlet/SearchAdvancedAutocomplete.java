/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import com.google.gson.Gson;
import com.sun.xml.internal.ws.util.StringUtils;
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
import utils.AutoCompleteData;

/**
 *
 * @author MirkoPortatile
 */
@WebServlet(name = "SearchAdvancedAutocomplete", urlPatterns = {"/SearchAdvancedAutocomplete"})
public class SearchAdvancedAutocomplete extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String city = request.getParameter("city");
        String country = request.getParameter("country");
        String cuisine = request.getParameter("cuisine");
        
          List<String> valori = new ArrayList<String>();

        //Instauriamo connessione
        ManagerDB manager = new ManagerDB();
        Connection connection = manager.getConnection();
        
        String sql="";
        if(city != null)
        {
            sql="SELECT DISTINCT city as a from restaurants WHERE LOWER(city) like '%"+city.toLowerCase()+"%'";
        }
        else if(country != null)
        {
            sql="SELECT DISTINCT country as a from restaurants WHERE LOWER(country) like '%"+country.toLowerCase()+"%'";
        }
        else if(cuisine!=null)
        {
            sql="SELECT DISTINCT name as a from cuisine WHERE LOWER(name) like '%"+cuisine.toLowerCase()+"%'";
        }
          try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet results = ps.executeQuery();

            //Per tutti i risultati
            while (results.next()) {
                //Prendiamo una citta
                String temp = StringUtils.capitalize(results.getString("a"));
                    valori.add(temp);
              
            }
        } catch (SQLException ex) {
            Logger.getLogger(SearchRestaurantAutocomplete.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Map real data into JSON
        response.setContentType("application/json");

        final List<AutoCompleteData> result = new ArrayList<AutoCompleteData>();
        for (final String s : valori) {
            result.add(new AutoCompleteData(s, s));
        }
        response.getWriter().write(new Gson().toJson(result));
        
    }

    

}
