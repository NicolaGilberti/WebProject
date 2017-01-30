/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.UserDAO;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author David,Mirko
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
            //Controlliamo la validita' del codice generato 
            boolean codeIsValid = user.isValidmd5(id, md5);

            
            //Se il codice corrisponde, permetto all'utente di cambiare password
            if (codeIsValid) {

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
