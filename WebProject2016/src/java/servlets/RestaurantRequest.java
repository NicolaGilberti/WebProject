/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.CuisineBean;
import beans.PhotoBean;
import beans.ReplyBean;
import beans.RestaurantBean;
import beans.ReviewBean;
import beans.StateBean;
import dao.PhotoDAO;
import dao.ReplyDAO;
import dao.RestaurantDAO;
import dao.StateDAO;
import dao.UserDAO;
import java.io.IOException;
import static java.lang.Integer.parseInt;
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
 * Manage the Request for a Restaurant. This class prepare the variables that
 * will be visualized in the restaurant page.
 *
 * @author RiccardoUni
 */
public class RestaurantRequest extends HttpServlet {
    
    private final String restImagesPath = "/img/restImgs/";
    private final String reviewImagesPath = "img/reviewsImgs/";

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

        //the id of the restaurant requested
        Integer id = Integer.parseInt(request.getParameter("id").toString());

        //DAO and bean for the response object
        RestaurantDAO restaurantDao = new RestaurantDAO();
        RestaurantBean restBean = new RestaurantBean();

        //retreive restaurant
        restBean = restaurantDao.searchRestaurant(id);
        if (restBean != null) {
            request.setAttribute("r", restBean);
            //increment n_visit
            restaurantDao.incrNumVisit(id);

            //get state
            StateDAO stateDAO = new StateDAO();
            StateBean stateBean = stateDAO.getState(parseInt(restBean.getCountry()));
            request.setAttribute("state", stateBean);

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

            //get opening hours
            OpeningHours oh = restaurantDao.getOpeningHours(restBean.getId());
            request.setAttribute("openingDates", oh.toArrayListString());

            //reviews
            //collections for reviews
            ArrayList<ReviewBean> reviews = restaurantDao.getReviews(restBean.getId());
            ArrayList<String> userNickamesOfReviews = new ArrayList<>();
            //collecting photo of the reviews and name of the user
            PhotoDAO pDao = new PhotoDAO();
            ArrayList<String> photoPaths = new ArrayList<>();
            UserDAO userdao = new UserDAO();
            for (ReviewBean current : reviews) {
                String currName = userdao.getUserNickname(current.getId_creator());
                //name of the user
                userNickamesOfReviews.add(currName);
                String currPhotoPath = "";
                int idPhoto = current.getId_photo();
                //if any photo exists
                if (idPhoto != 0 && pDao.isValid(idPhoto)) {
                    currPhotoPath = reviewImagesPath + pDao.getName(idPhoto);
                    photoPaths.add(currPhotoPath);
                } else {
                    photoPaths.add("");
                }
            }

            //replies
            ReplyDAO replyDao = new ReplyDAO();
            for (ReviewBean current : reviews) {
                ReplyBean replyBean = replyDao.getReplyFromIdReview(current.getId());
                if (replyBean != null) {
                    UserDAO userDao = new UserDAO();
                    replyBean.setNameOfIdOwner(userDao.getName(replyBean.getId_owner()));
                    current.setReply(replyBean);
                }
                
            }
            
            request.setAttribute("reviews", reviews);
            request.setAttribute("userNicknamesOfReviews", userNickamesOfReviews);
            request.setAttribute("photoPaths", photoPaths);

            //likes
            ArrayList<Integer> likes = new ArrayList<>();
            ArrayList<Integer> dislikes = new ArrayList<>();
            HashMap<Integer, ArrayList<Integer>> likesDislikes = restaurantDao.getLikes(restBean.getId());
            //collecting likes
            for (ReviewBean current : reviews) {
                if (likesDislikes.containsKey(current.getId())) {
                    ArrayList<Integer> currentLD = likesDislikes.get(current.getId());
                    likes.add(currentLD.get(0));
                    dislikes.add(currentLD.get(1));
                } else {
                    likes.add(0);
                    dislikes.add(0);
                }
            }
            request.setAttribute("likes", likes);
            request.setAttribute("dislikes", dislikes);

            //send
            RequestDispatcher rd = request.getRequestDispatcher("/restaurant.jsp");
            
            rd.forward(request, response);
            
        } else {
            response.sendError(404);
        }
        
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
