/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.CuisineBean;
import beans.ReplyBean;
import beans.RestaurantBean;
import beans.ReviewBean;
import dao.PhotoDAO;
import dao.ReplyDAO;
import dao.RestaurantDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.OpeningHours;

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
        
        //set content type for the response
        response.setContentType("text/html;charset=UTF-8");

        
        Integer id = Integer.parseInt(request.getParameter("id").toString());
        
        //DAO and bean for the response object
        RestaurantDAO restaurantDao = new RestaurantDAO();
        RestaurantBean restBean = new RestaurantBean();
        
        
        restBean = restaurantDao.searchRestaurant(id);

        request.setAttribute("r", restBean);

        //get photos
        ArrayList<String> photos = restaurantDao.getPhotos(id);
        request.setAttribute("photos", photos);
        request.setAttribute("numberOfPhotos", photos.size());

        //get price range
        ArrayList<Integer> price = restaurantDao.getPriceRange(restBean.getId_price_range());
        request.setAttribute("minPrice", price.get(0).toString());
        request.setAttribute("maxPrice", price.get(1).toString());

        //get cuisine
        ArrayList<CuisineBean> cuisines = restaurantDao.getCuisines(restBean.getId());
        request.setAttribute("cuisines", cuisines);

        //opening hours
        OpeningHours oh = restaurantDao.getOpeningHours(restBean.getId());
       
        System.out.println("restaurant: " + restBean.getName() 
                + "\nsize: " + oh.toArrayListString().size() 
                + "\ncontent: " + oh.toArrayListString());
        request.setAttribute("openingDates", oh.toArrayListString());
        
        //reviews
        PhotoDAO pDao = new PhotoDAO();
        
        //collections
        ArrayList<ReviewBean> reviews = restaurantDao.getReviews(restBean.getId());
        ArrayList<String> userNamesOfReviews = new ArrayList<>();
        ArrayList<String> replies = new ArrayList<>();
        //photo of the reviews
        ArrayList<String> photoPaths = new ArrayList<>();
        for (ReviewBean current : reviews) {
            String currName = restaurantDao.getUserName(current.getId_creator());
            userNamesOfReviews.add(currName);
            String currPhotoPath = "";
            if (((Integer)current.getId_photo()) != 0) {
                currPhotoPath = "";
                System.out.println("id_photo = " + ((Integer)current.getId_photo()));
                currPhotoPath = "img/restImgs/"+ pDao.getName(current.getId_photo());
                
                System.out.println("currentPhotoPath = " + currPhotoPath);
                if (!currPhotoPath.equals("img/restImgs/")) {
                
                photoPaths.add(currPhotoPath);
                }
                else {
                    photoPaths.add("");
                }
            }
            else photoPaths.add("");
            //reply at the reviews
            ReplyBean replyBean = new ReplyBean();
            ReplyDAO replyDao = new ReplyDAO();
            
            replyBean = replyDao.getReplyFromIdReview(current.getId());
            replies.add(replyBean.getDesc());
            
            
        }
        request.setAttribute("reviews", reviews);
        request.setAttribute("userNameOfReviews", userNamesOfReviews);
        request.setAttribute("photoPaths", photoPaths);
        
        //likes
        ArrayList<Integer> likes = new ArrayList<>();
        ArrayList<Integer> dislikes = new ArrayList<>();
        HashMap<Integer,ArrayList<Integer>> likesDislikes = restaurantDao.getLikes(restBean.getId());
        
        for (ReviewBean current : reviews) {
            if (likesDislikes.containsKey(current.getId())) {
                ArrayList<Integer> currentLD = likesDislikes.get(current.getId());
                likes.add(currentLD.get(0));
                dislikes.add(currentLD.get(1));
            }
            else {
                likes.add(0);
                dislikes.add(0);
            }
        }
        
        request.setAttribute("likes", likes);
        request.setAttribute("dislikse", dislikes);
        
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
