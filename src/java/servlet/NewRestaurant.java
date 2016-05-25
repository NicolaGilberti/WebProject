/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.User;
import database.ManagerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 *
 * @author riccardo
 */
@WebServlet(name = "NewRestaurant", urlPatterns = {"/NewRestaurant"})
public class NewRestaurant extends HttpServlet {

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
            out.println("<title>Servlet NewRestaurant</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewRestaurant at " + request.getContextPath() + "</h1>");
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
        
        request.removeAttribute("formNotValid");
        
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String address = request.getParameter("address");
        String web_site_url = request.getParameter("web_site_url");
        
        if (name==null || address==null || description==null) {
           request.setAttribute("formNotValid", "values are not valid" );
           RequestDispatcher rd = request.getRequestDispatcher("/newRestaurantForm.jsp");
           rd.forward(request, response);
        }
        else {
            //Form is valid, add the restaurant in the DB
            
            Integer userId = 1;
            ManagerDB mdb = new ManagerDB();
            Connection con = mdb.getConnection();
  
            PreparedStatement ps = null;
            try {
                ps = con.prepareStatement(
                        "INSERT INTO restaurant(name,description,web_site_url,id_owner,id_creator,address)"
                                + "VALUES (?,?,?,?,?,?);");
                
                ps.setString(1, name);
                ps.setString(2, description);
                ps.setString(3,web_site_url);
                ps.setInt(4,userId);
                ps.setInt(5,userId);
                ps.setString(6,address);
                
                
                ResultSet rs = ps.executeQuery();
                
            } catch (SQLException ex) {
                System.out.println(ex.toString() + " errore query");
                Logger.getLogger(NewRestaurant.class.getName()).log(Level.SEVERE, null, ex);
            }
            finally {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println(ex.toString() + " errore chiusura classe PreparedStatement");
                    Logger.getLogger(NewRestaurant.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            request.setAttribute("formValid", "The restaurant " + name + " has been create");
            RequestDispatcher rd = request.getRequestDispatcher("/createdRestaurant.jsp");
            rd.forward(request, response);
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
