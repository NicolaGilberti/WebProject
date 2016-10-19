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
@WebServlet(name = "ChangeUserNickname", urlPatterns = {"/ChangeUserNickname"})
public class ChangeUserNickname extends HttpServlet {

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
        //response.setContentType("text/html;charset=UTF-8");
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
        
        HttpSession session = request.getSession();
        UserBean user = (UserBean) session.getAttribute("user");
        int id = user.getId();

        String pwd = request.getParameter("nicknamePwd");
        pwd = org.apache.commons.codec.digest.DigestUtils.sha256Hex(pwd);
        String nickname = request.getParameter("newNickname");

        ManagerDB manager = new ManagerDB();
        Connection connection = manager.getConnection();

        RequestDispatcher dispatcher = request.getRequestDispatcher("UserRestaurants");

        try {
            String pwd_query = "SELECT password FROM users WHERE id=" + id;
            PreparedStatement ps = connection.prepareStatement(pwd_query);
            ResultSet results = ps.executeQuery();

            if (results.next()) {

                String db_pwd = results.getString("password");

                if (pwd.equals(db_pwd)) {

                    String nick_query = "UPDATE users SET nickname='" + nickname + "' WHERE id=" + id;

                    ps = connection.prepareStatement(nick_query);
                    ps.executeUpdate();
                    
                    user.setNickname(nickname);

                    request.setAttribute("alert", 0);
                    request.setAttribute("alert_title", "Nickname modificato con successo in ");
                    request.setAttribute("alert_text", nickname);
                    dispatcher.forward(request, response);
                } else {

                    request.setAttribute("alert", 1);
                    request.setAttribute("alert_title", "Errore!");
                    request.setAttribute("alert_text", "Password non valida. Riprovare");
                    dispatcher.forward(request, response);
                }
            } else {

                request.setAttribute("alert", 1);
                request.setAttribute("alert_title", "Errore!");
                request.setAttribute("alert_text", "Si è verificato un errore nel sistema. Riprovare più tardi");
                dispatcher.forward(request, response);
            }
        } catch (Exception ex) {
            System.out.println("changeUserPwd "+ex.toString());
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
