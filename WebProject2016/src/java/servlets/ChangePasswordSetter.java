/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.ManagerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
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
 * @author David
 */
public class ChangePasswordSetter extends HttpServlet {

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
            ManagerDB db = new ManagerDB();
            Connection con = db.getConnection();
            
            // setto la nuova password
            String query = "UPDATE users SET password=? WHERE id=?";
            
            // prendendola direttamente dalla form
            String password = request.getParameter("password");
            
            String id = request.getParameter("id");
            
            String cod = request.getParameter("cod");
            JOptionPane.showMessageDialog(null, "ecco 'l'id " + id + "ed il cod ->" + cod);
            
            // la cripto in SHA256
            password = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);

            
            // la inserisco all'interno del database
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(2, Integer.valueOf(id));
            ps.setString(1, password);
            int affected = ps.executeUpdate();
            int userID;
            
            if (affected == 0) {
                throw new SQLException("Errore utente, no rows affected.");

            }
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    userID = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Errore creazione utente, no ID obtained.");
                }
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
        processRequest(request, response);
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
