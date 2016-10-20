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
import javax.servlet.http.HttpSession;

/**
 *
 * @author nicol
 */

public class ChangeUserPassword extends HttpServlet {

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
        //processRequest(request, response);

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
        //processRequest(request, response);
        HttpSession session = request.getSession();
        UserBean user = (UserBean) session.getAttribute("user");
        int id = user.getId();

        String oldpwd = request.getParameter("oldPwd");
        String newpwd = request.getParameter("newPwd");
        String newpwd2 = request.getParameter("newPwd2");

        ManagerDB manager = new ManagerDB();
        Connection connection = manager.getConnection();
        String oldpwd_query = "SELECT password FROM users WHERE id=" + id;

        RequestDispatcher dispatcher = request.getRequestDispatcher("UserRestaurants");

        try {

            PreparedStatement ps = connection.prepareStatement(oldpwd_query);
            ResultSet results = ps.executeQuery();

            if (results.next()) {

                String old_db_pwd = results.getString("password");
                oldpwd = org.apache.commons.codec.digest.DigestUtils.sha256Hex(oldpwd);
                newpwd = org.apache.commons.codec.digest.DigestUtils.sha256Hex(newpwd);
                newpwd2 = org.apache.commons.codec.digest.DigestUtils.sha256Hex(newpwd2);

                if (old_db_pwd.equals(oldpwd)) {
                    if (newpwd.equals(newpwd2)) {
                        String newpwd_query = "UPDATE users SET password='" + newpwd + "' WHERE id=" + id;

                        ps = connection.prepareStatement(newpwd_query);
                        ps.executeUpdate();

                        request.setAttribute("alert", 0);
                        request.setAttribute("alert_title", "La modifica della password è avvenuta con successo.");
                        dispatcher.forward(request, response);
                    } else {
                        request.setAttribute("alert", 1);
                        request.setAttribute("alert_title", "Errore!");
                        request.setAttribute("alert_text", "Nuova password non valida. Riprovare");
                        dispatcher.forward(request, response);
                    }
                } else {
                    request.setAttribute("alert", 1);
                    request.setAttribute("alert_title", "Errore!");
                    request.setAttribute("alert_text", "Vecchia password non valida. Riprovare");
                    dispatcher.forward(request, response);
                }

            } else {
                request.setAttribute("alert", 1);
                request.setAttribute("alert_title", "Errore!");
                request.setAttribute("alert_text", "Utente non riconosciuto dal sistema.");
                dispatcher.forward(request, response);
            }
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            /* request.setAttribute("oldpwd", ex.toString());
            dispatcher.forward(request, response);*/
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
