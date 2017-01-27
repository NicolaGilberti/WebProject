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
import javax.servlet.RequestDispatcher;
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
public class ChangePassword extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            String md5 = request.getParameter("cod");

            UserDAO user = new UserDAO();
            
            StringBuffer sb = user.changePassword(id, md5);

            
            //Se il codice corrisponde, permetto all'utente di cambiare password
            if (sb.toString().equals(md5)) {

                RequestDispatcher dispatcher = request.getRequestDispatcher("changepasswordform.jsp");
                request.setAttribute("id", id); // set your String value in the attribute
                request.setAttribute("cod", md5);
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("/");
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConfirmAccount.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ConfirmAccount.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
