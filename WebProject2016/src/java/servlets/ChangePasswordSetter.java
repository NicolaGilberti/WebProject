/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.UserDAO;
import database.ManagerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import utils.EmailSender;

/**
 *
 * @author David,Mirko
 */
public class ChangePasswordSetter extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     * Gestione nuova password: prende la nuova password dal form, controlla l'MD5 e la setta nel database
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.security.NoSuchAlgorithmException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            
            
            // prendo la nuova passowrd direttamente dalla form
            String password = request.getParameter("password");
            // la cripto in SHA256
            password = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);

            // prendo ID e COD per un controllo ed il set della password
            String id = request.getParameter("id");
            String cod = request.getParameter("cod");

            UserDAO user = new UserDAO();
            
            // controllo se l'MD5 generato è valido o è stato manomesso
            boolean codeIsValid = user.isValidmd5(id, cod);

            //Se il codice corrisponde, permetto all'utente di cambiare password
            if (codeIsValid) {
                int affected = user.changePassword(Integer.valueOf(id), password);
                if (affected == 0) {
                    throw new SQLException("Errore utente, no rows affected.");

                } else {
                    response.sendRedirect("/WebProject2016/new_password_set.html");
                }

            }
            else
            {
                response.sendRedirect("/WebProject2016/general_error_page.jsp");
            }

        } catch (SQLException ex) {
            Logger.getLogger(ChangePasswordSetter.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ChangePasswordSetter.class.getName()).log(Level.SEVERE, null, ex);
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
