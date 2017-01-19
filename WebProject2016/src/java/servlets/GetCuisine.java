/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.CuisineBean;
import beans.RestaurantBean;
import beans.UserBean;
import com.google.gson.Gson;
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

public class GetCuisine extends HttpServlet {

    

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
         ManagerDB db = new ManagerDB();
    Connection con = db.getConnection();
       List<CuisineBean> cuisineList = new ArrayList<CuisineBean>();
       
       
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM cuisine order by name");
            
            ResultSet results = stm.executeQuery();

            //Per tutti i risultati
            while (results.next()) {
                CuisineBean cus=new CuisineBean();
                cus.setId(results.getInt("id"));
                cus.setName(results.getString("name"));
                cuisineList.add(cus);
            }
            results.close();
            stm.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(GetCuisine.class.getName()).log(Level.SEVERE, null, ex);
        }
          response.setContentType("application/json");
        response.getWriter().write(new Gson().toJson(cuisineList));
    }

}
