/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.NotificationBean;
import beans.RestaurantNotificationBean;
import beans.UserBean;
import dao.AdminNotificationsDAO;
import dao.RestaurantNotificationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sun.rmi.server.Dispatcher;

/**
 * Servlet principale che utilizzo per prendere dal database tutte le notifiche,
 * scremandole per notifiche ristoratore e notifiche admin.
 * @author Marco
 */
public class SearchNotification extends HttpServlet {

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
            throws ServletException, IOException, SQLException, Throwable {
        response.setContentType("text/html;charset=UTF-8");
        // Creo gli oggetti Bean e DAO che necessito nella pagina
        NotificationBean notbean = new NotificationBean();
        RestaurantNotificationBean resbean = null;
        AdminNotificationsDAO notify = new AdminNotificationsDAO();
        RestaurantNotificationDAO resnoty = new RestaurantNotificationDAO();
        UserBean user_type = (UserBean) request.getSession().getAttribute("user");
        //parametri che utilizzo per dare il feedback all'utente, dopo che ha applicato una modifica al db
        String query_result = request.getParameter("query_result");
        String insert_reply_result = request.getParameter("insert_reply_result");
        int param;
        int param_insert = 0;

        //questi due controlli li uso per settare la visibilità dei panel per la conferma di avvenuta modifica(panel si trovano in notification.jsp)
        if (query_result == null) {
            param = -1;
        } else {
            param = Integer.parseInt(query_result);
        }

        if (insert_reply_result == null) {
            param_insert = -1;
        } else {
            param_insert = Integer.parseInt(insert_reply_result);
        }
        
        try {
            /*
            prendo sempre le notifiche del ristoratore, dato che un admin può esserlo, e in più, se chi si logga è
            admin, recupero anche le notifiche dell'administrator.
            Per fare questo utilizzo il valore del type dell'utente loggato
            */
            if (user_type.getType() == 2) {
                notbean = notify.getAllNotification();
                request.getSession().setAttribute("noty", notbean);

            }
            resbean = resnoty.getAllNotification(user_type.getId());
            request.getSession().setAttribute("resnoty", resbean);

        } catch (Exception e) {
            System.err.print(e);
        }

        RequestDispatcher ds;
        /*
            il primo controllo mi serve per far si che,essendo la prima volta che passo di qui, riesca a caricare tutta la pagina della servlet
        */
        if (request.getParameter("flag") == null) {
            ds = request.getRequestDispatcher("notification.jsp?query_result=" + param + "&insert_result=" + insert_reply_result);
            ds.forward(request, response);
        } else {
            /*
                qui invece, essendo che sono nella pagina admin e devo aggiornare le notifiche, non mi serve caricare
                la pagina completa notification, ma vado ad aggiornare direttamente le sotto jsp in base a che tipo di user sono.
            */
            if (user_type.getType() == 2) {
                ds = request.getRequestDispatcher("adminNotification.jsp");

            } else {
                ds = request.getRequestDispatcher("restaurantNotification.jsp");
            }
            //infine faccio il farward della richiesta
            ds.forward(request, response);
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
            // Logger.getLogger(SearchNotification.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Throwable ex) {
            Logger.getLogger(SearchNotification.class.getName()).log(Level.SEVERE, null, ex);
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
            //  Logger.getLogger(SearchNotification.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Throwable ex) {
            Logger.getLogger(SearchNotification.class.getName()).log(Level.SEVERE, null, ex);
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
