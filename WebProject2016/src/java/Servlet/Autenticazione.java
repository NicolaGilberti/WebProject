/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import database.ManagerDB;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.exit;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.jni.Time;
import beans.User;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author David
 */

@WebServlet(name = "Autenticazione", urlPatterns = {"/Autenticazione"})
public class Autenticazione extends HttpServlet {

    ManagerDB db = new ManagerDB();
    Connection con = db.getConnection();

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
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            out.print("<HTML><head></head><body>");
            
            User user;
            user = authenticate(email, password);

            String exit = null;
            // se non esiste, ridirigo verso pagina di login con messaggio di errore
            if (user == null) {
                // metto il messaggio di errore come attributo di Request, così nel JSP si vede il messaggio

                //inserire qui il comportamento se la password e' sbagliata
                response.sendRedirect(request.getContextPath() + "/header.jsp");
            } else {

                HttpSession session = request.getSession();
                session.setAttribute("utente",user.getClass());

                Integer autenticato = (Integer) session.getAttribute("accessCount");
                if (autenticato == null) {
                    autenticato = 0;
                    //inserire qui il comportamento se la password e' giusta 
                    response.sendRedirect(request.getContextPath() + "/header.jsp");

                }
                session.setAttribute("accessCount", autenticato);
            }
            response.setContentType("text/html;charset=UTF-8");

        }

    }

    public User authenticate(String email, String password) throws SQLException {
       PreparedStatement stm = con.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");

        try {
            stm.setString(1, email);
            stm.setString(2, password);

            ResultSet rs = stm.executeQuery();

            try {
                if (rs.next()) {
                    User user = new User();
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));

                    return user;
                } else {
                    return null;
                }
            } finally {
                // ricordarsi SEMPRE di chiudere i ResultSet in un blocco finally 
                rs.close();
            }
        } finally { // ricordarsi SEMPRE di chiudere i PreparedStatement in un blocco finally 
            stm.close();
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
            Logger.getLogger(Autenticazione.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Autenticazione.class.getName()).log(Level.SEVERE, null, ex);
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
