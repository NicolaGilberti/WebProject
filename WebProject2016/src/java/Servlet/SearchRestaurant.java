/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import beans.Cuisine;
import beans.RestaurantSearch;
import com.google.gson.Gson;
import comparators.CuisineAlphabeticalComparator;
import comparators.RestaurantSearchNameComparator;
import comparators.RestaurantSearchValueComparator;
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
@WebServlet(name = "SearchRestaurant", urlPatterns = {"/SearchRestaurant"})
public class SearchRestaurant extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String searchinput=request.getParameter("searchinput");
        
        String sql = "";
        //Instauriamo connessione
        ManagerDB manager = new ManagerDB();
        Connection connection = manager.getConnection();
        List<RestaurantSearch> restaurantsList = new ArrayList<RestaurantSearch>();

        //Se e' stata fatta la ricerca normale generiamo la query giusta
        if (request.getParameter("searchinput") != "") {
            String valoreInserito = request.getParameter("searchinput");
            valoreInserito = valoreInserito.replaceAll("'", "''");
            String[] valoriInseriti = valoreInserito.split("\\s+");
            sql = "select id,name,description,address,city,global_value,min_value,max_value "
                    + "from (select restaurants.id,name,description,address,city,global_value,min_value,max_value,(name ||' , '|| address ||' , '||city) as t"
                    + " from restaurants join price_range on restaurants.id_price_range=price_range.id) as a "
                    + "where t @@ '";
            for (int i = 0; i < valoriInseriti.length; i++) {
                sql += valoriInseriti[i];
                sql += " && ";
            }
            sql += "'";
        } //Altrimenti e' stata fatta la ricerca avanzata
        else if (request.getParameter("lat") != "") {
            String lat = request.getParameter("lat");
            String longi = request.getParameter("long");
            sql = "select restaurants.id,name,description,address,city,global_value,min_value,max_value from restaurants join price_range on restaurants.id_price_range=price_range.id WHERE abs(latitude-" + lat
                    + ")<0.25 AND abs(longitude-" + longi + ") <0.25";

        } else {
            String city = request.getParameter("city");
            String country = request.getParameter("country");
            String cuisine = request.getParameter("cuisine");

            if (!"".equals(city)) {
                if (!"".equals(sql)) {
                    sql += " INTERSECT ";
                }
                sql += "SELECT restaurants.id,name,description,address,city,global_value,min_value,max_value FROM restaurants join price_range on restaurants.id_price_range=price_range.id WHERE LOWER(city)='" + city.toLowerCase() + "'";
            }
            if (!"".equals(country)) {
                if (!"".equals(sql)) {
                    sql += " INTERSECT ";
                }
                sql += "SELECT restaurants.id,name,description,address,city,global_value,min_value,max_value from restaurants join price_range on restaurants.id_price_range=price_range.id WHERE country=(select id from states where LOWER(name) ='" + country.toLowerCase() + "')";
            }
            if (!"".equals(cuisine)) {
                if (!"".equals(sql)) {
                    sql += " INTERSECT ";
                }
                sql += "SELECT restaurants.id,name,description,address,city,global_value,min_value,max_value from restaurants join price_range on restaurants.id_price_range=price_range.id join restaurants_cuisine on restaurants.id=restaurants_cuisine.id_restaurant join (select id as a from cuisine where LOWER(name)='" + cuisine.toLowerCase() + "') as t on t.a=restaurants_cuisine.id_cuisine";
            }
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet results = ps.executeQuery();

            //Per tutti i risultati
            while (results.next()) {

                RestaurantSearch risto = new RestaurantSearch();
                risto.setId(results.getInt("id"));
                risto.setName(results.getString("name"));
                // risto.setDescription(results.getString("description"));
                risto.setAddress(results.getString("address"));
                risto.setCity(results.getString("city"));
                risto.setScore(results.getInt("global_value"));
                risto.setMinPrice(results.getDouble("min_value"));
                risto.setMaxPrice(results.getDouble("max_value"));
                restaurantsList.add(risto);

                //Ora devo ottenere il numero di recensioni che ha quel ristorante
                int nReviews = 0;
                String sql2 = "select count(*) as nreviews from reviews where id_restaurant=" + risto.getId();
                //String sqlReview="select * from cuisine join restaurants_cuisine on cuisine.id = restaurants_cuisine.id_cuisine where"; //TODO QUERY

                PreparedStatement ps2 = connection.prepareStatement(sql2);
                ResultSet results2 = ps2.executeQuery();
               
                while (results2.next()) {
                    nReviews = results2.getInt(1);
                }
                risto.setNumReviews(nReviews);
                
                //Ora ottengo i tipi di cucina
                 List<Cuisine> cuisineTypes=new ArrayList<>();
              
                String sql3="select id,name from cuisine join restaurants_cuisine on cuisine.id=restaurants_cuisine.id_cuisine where id_restaurant="+risto.getId();
                  PreparedStatement ps3=connection.prepareStatement(sql3);
                ResultSet results3=ps3.executeQuery();
                while (results3.next()) {
                     Cuisine temp=new Cuisine();
                     temp.setId(results3.getInt("id"));
                     temp.setName(results3.getString("name"));
                   cuisineTypes.add(temp);
                }
                Collections.sort(cuisineTypes, new CuisineAlphabeticalComparator());
                risto.setCuisineTypes(cuisineTypes);
                
                //Ora ottengo le foto
                String sql4="select name from photos where id_restaurant=+"+risto.getId()+" LIMIT 1";
                 PreparedStatement ps4=connection.prepareStatement(sql4);
                ResultSet results4=ps4.executeQuery();
                while (results4.next()) {
                    if(results4.getString("name")!="")
                     risto.setImgPath(results4.getString("name"));
                    else
                         risto.setImgPath(results4.getString("default.png"));
                }
            }

            //    Collections.sort(restaurantsList, new RestaurantSearchNameComparator());
        } catch (SQLException ex) {
            Logger.getLogger(SearchRestaurantAutocomplete.class.getName()).log(Level.SEVERE, null, ex);
        }

        //   request.setAttribute("restaurants", restaurantsList); // Will be available as ${restaurants} in JSP
        //   request.getRequestDispatcher("results.jsp").forward(request, response);
        response.setContentType("application/json");
        response.getWriter().write(new Gson().toJson(restaurantsList));
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
