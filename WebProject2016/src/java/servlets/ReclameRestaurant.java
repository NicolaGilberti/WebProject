/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.UserBean;
import dao.RestaurantDAO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RiccardoUni
 */
@WebServlet(name = "ReclameRestaurant", urlPatterns = {"/ReclameRestaurant"})
public class ReclameRestaurant extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReclameRestaurant</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReclameRestaurant at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        processRequest(request, response);
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
        //response type
        response.setContentType("text/html;charset=UTF-8");
        
        //fetch userID e restID
        HttpSession session = request.getSession();
        UserBean userLogged = (UserBean) session.getAttribute("user");
        int userID = userLogged.getId();
        int restID = 0;       
        String stringRestID = request.getParameter("restaurantID");
        if (stringRestID != null && !stringRestID.isEmpty()) {
            restID = parseInt(stringRestID);
        }
        
        String responsePath =  request.getContextPath()+"/RestaurantRequest?id=" + restID;
        
        if (userID != 0) {
            RestaurantDAO restDao = new RestaurantDAO();
            
            response.setIntHeader("id", restID);
            if (restDao.reclameRestaurant(userID,restID)) {
                response.sendRedirect(responsePath);
            }
            else {
                response.sendRedirect(responsePath + "&notReclamed");
            }
        }
        else {
            response.sendRedirect("/index.jsp");
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
