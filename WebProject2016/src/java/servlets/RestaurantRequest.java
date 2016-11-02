/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.CuisineBean;
import beans.RestaurantBean;
import beans.ReviewBean;
import database.ManagerDB;
import dao.RestaurantDAO;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;

/**
 *
 * @author RiccardoUni
 */

public class RestaurantRequest extends HttpServlet {
    private String restImagesPath = "/img/restImgs/";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        Integer id = Integer.parseInt(request.getParameter("id").toString());
        RestaurantDAO rq = new RestaurantDAO();
        RestaurantBean r = new RestaurantBean();

        r = rq.searchRestaurant(id);

        request.setAttribute("r", r);

        //get photos
        ArrayList<String> photos = rq.getPhotos(id);
        request.setAttribute("photos", photos);
        request.setAttribute("numberOfPhotos", photos.size());
        
        //get price range
        ArrayList<Integer> price = rq.getPriceRange(r.getId_price_range());
        String tmp = price.get(0).toString(); 
        request.setAttribute("minPrice", price.get(0).toString());
        request.setAttribute("maxPrice", price.get(1).toString());
        
        //get cuisine
        ArrayList<CuisineBean> cuisines = rq.getCuisines(r.getId());
        request.setAttribute("cuisines", cuisines);
        
        //reviews
        ArrayList<ReviewBean> reviews = rq.getReviews(r.getId());
        ArrayList<String> userNamesOfReviews = new ArrayList<String>();
        for(ReviewBean current:reviews) {
            String currName = rq.getUserName(current.getId_creator());
            userNamesOfReviews.add(currName);
        }
        request.setAttribute("reviews", reviews);
        request.setAttribute("userNameOfReviews", userNamesOfReviews);
        
        RequestDispatcher rd = request.getRequestDispatcher("/restaurant.jsp");
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
            Logger.getLogger(RestaurantRequest.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RestaurantRequest.class.getName()).log(Level.SEVERE, null, ex);
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
