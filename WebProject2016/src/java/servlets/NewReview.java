/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.PhotoBean;
import beans.RestaurantBean;
import beans.ReviewBean;
import beans.UserBean;
import dao.PhotoDAO;
import dao.ReviewDAO;
import java.io.File;
import java.io.IOException;
import static java.lang.Integer.parseInt;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author RiccardoUni
 */
@WebServlet(name = "NewReview", urlPatterns = {"/NewReview"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class NewReview extends HttpServlet {
    
    //Path della cartella dove salvare i file immagine
    private static final String SAVE_DIR = "img\\restImgs";
    
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
        HttpSession session = request.getSession();
        UserBean userLogged = (UserBean) session.getAttribute("user");
        int restID = parseInt(request.getParameter("restaurantId"));
        
        //popoliamo il review
        ReviewBean review = new ReviewBean();
        review.setName(request.getParameter("name"));
        review.setGlobal_value(parseInt(request.getParameter("stars")));
        review.setFood(parseInt(request.getParameter("food")));
        review.setAtmosphere(parseInt(request.getParameter("atmosphere")));
        review.setValue_for_money(parseInt(request.getParameter("valueForMoney")));
        review.setDescription(request.getParameter("description"));
        review.setId_creator(userLogged.getId());
        review.setId_restaurant(restID);
        
        //CURRENT DATE
        Date data_creation = new Date();
        Timestamp tmp = new Timestamp(data_creation.getTime());
        review.setData_creation(tmp);
        
        
        // inseriamo review nel database
        ReviewDAO rDao = new ReviewDAO();
        int reviewID = rDao.insertReview(review);
        RequestDispatcher rd = request.getRequestDispatcher("WebProject2016");

        rd.forward(request, response);
        //aggiungiamo foto
        PhotoBean foto = new PhotoBean();
        foto.setName("rev" + String.valueOf(reviewID) + ".jpg");
        foto.setDescription("Foto review");
        foto.setId_restaurant(restID);
        foto.setId_user(userLogged.getId());
        
        //Inseriamo la foto nel db
        PhotoDAO photoDao = new PhotoDAO();
        int photoID = photoDao.addPhoto(foto);
        
        //e in bean
        rDao.addPhoto(reviewID, photoID);

        //Salviamo la foto in locale
        //gets absolute path of the web application
        String appPath = request.getServletContext().getRealPath("");
        
        // constructs path of the directory to save uploaded file
        String savePath = appPath + File.separator + SAVE_DIR;

        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        Part part = request.getPart("foto");
        String fileName = "rev" + String.valueOf(restID) + ".jpg";
        
        //refines the fileName in case it is an absolute path
        fileName = new File(fileName).getName();
        part.write(savePath + File.separator + fileName);
        Logger.getLogger(NewRestaurant.class.getName()).log(Level.SEVERE, savePath + File.separator + fileName);

        
        //RequestDispatcher rd = request.getRequestDispatcher("RestaurantRequest?id=3");

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
            Logger.getLogger(NewReview.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(NewReview.class.getName()).log(Level.SEVERE, null, ex);
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
