/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.UserBean;
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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import utils.EmailSender;

/**
 *
 * @author David
 */

public class ForgottenPassword extends HttpServlet {

    ManagerDB db = new ManagerDB();
    Connection con = db.getConnection();
    UserBean user = new UserBean();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            user = authenticate(email);
            if (user != null) {
                String name = user.getName();
                String surname = user.getSurname();
                String nickname = user.getNickname();
                int id = user.getId();

                //Inizio generazione MD5
                MessageDigest md = MessageDigest.getInstance("MD5");
                md.update(email.getBytes());
                md.update(nickname.getBytes());
                md.update(surname.getBytes());
                md.update(name.getBytes());
                byte[] digest = md.digest();
                StringBuffer sb = new StringBuffer();
                for (byte b : digest) {
                    sb.append(String.format("%02x", b & 0xff));
                }

                String url = "http://localhost:8084/WebProject2016/ChangePassword?id=" + Integer.toString(id) + "&cod=" + sb.toString();
                String text = "Ciao, questa mail ti è arrivata perché hai richiesto la reimpostazione della password. "
                        + "Clicca qui per modificare la password: <a href=\" " + url + " \"> Clicca qui </a>";

                String object = "[TuttoBistrò] Modifica Password";

                EmailSender sender = new EmailSender();
                sender.send(email, text, object);
                response.sendRedirect("changepasswordinfo.html");
            } else {
            
            response.sendRedirect("erroreinserimento.html");
            }
           

        } catch (Exception ex) {
            response.sendRedirect("login.html");
        }
    }

    public UserBean authenticate(String email) throws SQLException {
        PreparedStatement stm = con.prepareStatement("SELECT * FROM users WHERE email = ?");
        try {
            stm.setString(1, email);

            ResultSet rs = stm.executeQuery();

            try {
                if (rs.next()) {
                    UserBean user = new UserBean();
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
            try {
                processRequest(request, response);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(ForgottenPassword.class.getName()).log(Level.SEVERE, null, ex);
            }
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
        } catch (NoSuchAlgorithmException ex) {
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
