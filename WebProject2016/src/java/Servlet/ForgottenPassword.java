/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import beans.User;
import database.ManagerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.EmailSender;

/**
 *
 * @author David
 */
@WebServlet(name = "ForgottenPassword", urlPatterns = {"/ForgottenPassword"})
public class ForgottenPassword extends HttpServlet {

    ManagerDB db = new ManagerDB();
    Connection con = db.getConnection();
    User user;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            user = authenticate(email);
            user.getId();
            if (user == null){
             response.sendRedirect(request.getContextPath() + "/erroreinserimento.html");
            } else {
                
            // String url = "http://localhost:8084/WebProject2016/confirmAccount?id=" + Integer.toString(userID) + "&cod=" + sb.toString();
            //String text = "Questa è una mail di conferma."
            //        + "Clicca qui per confermare l'account: <a href=\" " + url + " \"> Clicca qui </a>";

            String object = "[TuttoBistrò] Mail di conferma";

            //Spediamo email
            EmailSender sender = new EmailSender();
            //sender.send(email, text, object);
            response.sendRedirect("maildiconferma.html");
            }
            
            
        }
    }
public User authenticate(String email) throws SQLException {
       PreparedStatement stm = con.prepareStatement("SELECT id FROM users WHERE email = ?");
       try {
            stm.setString(1, email);

            ResultSet rs = stm.executeQuery();

            try {
                if (rs.next()) {
                    User user = new User();
                    user.setEmail(rs.getString("email"));
                    user.setName(rs.getString("name"));
                    user.setNickname(rs.getString("nickname"));
                    user.setSurname(rs.getString("surname"));
                    user.setId(rs.getInt("id"));
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
            Logger.getLogger(ForgottenPassword.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ForgottenPassword.class.getName()).log(Level.SEVERE, null, ex);
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
