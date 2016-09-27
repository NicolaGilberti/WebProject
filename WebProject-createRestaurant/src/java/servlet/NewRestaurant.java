/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.Restaurant;
import beans.User;
import database.ManagerDB;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.net.URL;
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
import static java.lang.Integer.parseInt;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Array;
import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

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

        Restaurant rest = new Restaurant();

        rest.setName(request.getParameter("nome"));
        rest.setDescription(request.getParameter("descrizione"));
        rest.setWeb_site_url(request.getParameter("URL_sito"));
        
        rest.setAddress(request.getParameter("indrizzo"));
        rest.setCap(request.getParameter("cap").isEmpty() ? 0 : parseInt(request.getParameter("cap")));
        rest.setCity(request.getParameter("citta"));
        rest.setCountry(request.getParameter("stato"));
        
        rest.setGlobal_value(0);

        HttpSession session = request.getSession(false);
        User userLogged = (User) session.getAttribute("utente");
        
        if (userLogged == null) {
            //Errore log in utente
        }
        else {
            
            rest.setId_creator(userLogged.getId());
            rest.setId_owner(userLogged.getId());
            
            //connessione DataBase
            ManagerDB mdb = new ManagerDB();
            Connection con = mdb.getConnection();

            PreparedStatement ps = null;

            try {
                ps = con.prepareStatement(
                        "INSERT INTO restaurants(name,description,web_site_url,"
                                + "id_owner,id_creator,latitude,longitude,address,"
                                + "cap,city,country,telephone,e_mail)"
                                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);");

                ps.setString(1, rest.getName());
                ps.setString(2, rest.getDescription());
                ps.setString(3, rest.getWeb_site_url());
                ps.setInt(4, rest.getId_creator());
                ps.setInt(5, rest.getId_creator());
                //6-7
                ps.setString(8, rest.getAddress());
                ps.setString(9, ((Integer) rest.getCap()).toString());
                ps.setString(10, rest.getCity());
                ps.setString(11, rest.getCountry());
                ps.setString(12, rest.getTelephone());
                ps.setString(13, rest.getE_mail());

                ResultSet rs = ps.executeQuery();

            } catch (SQLException ex) {
                System.out.println(ex.toString() + " errore query");
                Logger.getLogger(NewRestaurant.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println(ex.toString() + " errore chiusura classe PreparedStatement");
                    Logger.getLogger(NewRestaurant.class.getName()).log(Level.SEVERE, null, ex);
                }

                request.setAttribute("formValid", "The restaurant " + rest.getName() + " has been create ");
                RequestDispatcher rd = request.getRequestDispatcher("/createdRestaurant.jsp");
                rd.forward(request, response);
            }
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
