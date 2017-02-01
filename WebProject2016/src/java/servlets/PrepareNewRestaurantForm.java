/**
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.CuisineBean;
import beans.OpeningHoursBean;
import beans.PriceRangeBean;
import beans.StateBean;
import dao.OpeningHoursDAO;
import dao.PriceRangeDAO;
import dao.RestaurantDAO;
import dao.StateDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * This class prepare the form for restaurant creation.
 * It's invoked when a user want to create a new restaurant.
 * @author RiccardoUni,Mirko
 */
public class PrepareNewRestaurantForm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     * This class collect all the informations for the new restaurant form.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        //collect
        //States
        StateDAO stateDao = new StateDAO();
        ArrayList<StateBean> states = stateDao.getStates();
        request.setAttribute("states", states);
        
        //Restaurant types
        RestaurantDAO rtd = new RestaurantDAO();
        ArrayList<CuisineBean> types = rtd.getCuisineTypes();
        request.setAttribute("restaurantTypes",types);
        
        //Opening Hours
        OpeningHoursDAO oh = new OpeningHoursDAO();
        ArrayList<OpeningHoursBean> ohList = oh.getOpeningHours();
        request.setAttribute("ohList",ohList);
        
        //Price range
        PriceRangeDAO range=new PriceRangeDAO();
        ArrayList<PriceRangeBean> rangeList = range.getPriceRanges();
        request.setAttribute("rangeList",rangeList);
        
        RequestDispatcher rd = request.getRequestDispatcher("/newRestaurantForm.jsp");

        rd.forward(request, response);
        
        
    }

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PrepareNewRestaurantForm.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PrepareNewRestaurantForm.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
