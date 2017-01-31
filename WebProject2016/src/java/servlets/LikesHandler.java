/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.ReviewDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MirkoPortatile
 */
public class LikesHandler extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int revId = Integer.valueOf(request.getParameter("revId"));
            int value = Integer.valueOf(request.getParameter("value"));
            //Evitiamo che qualcuno vada ad inserire un valore non possibile.
            if (value != 1 && value != 0) {
                value = 0;
            }
            int userId = Integer.valueOf(request.getParameter("userId"));

            ReviewDAO rDao = new ReviewDAO();
            //Inseriamo il like nel db
            rDao.addLikeOrDislike(revId, value, userId);

            response.setContentType("text/plain");   
            response.setCharacterEncoding("UTF-8"); 
            response.getWriter().write("OK");     

            //Se l'utente ha gia votato andremo in una eccezione
        } catch (SQLException ex) {
            
        }

    }

}
