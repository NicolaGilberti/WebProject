/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package autocompletamento;

import database.ManagerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MirkoPortatile
 */
@WebServlet(name = "getData", urlPatterns = {"/getData"})
public class getData extends HttpServlet {

 
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       ManagerDB manager=new ManagerDB();
 Connection connection=manager.getConnection();
       //PreparedStatement ps=connection.prepareStatement(sql);
       String sql = "SELECT restaurant set age=? WHERE id=?";
      stmt = conn.prepareStatement(sql);
      
      //Bind values into the parameters.
      stmt.setInt(1, 35);  // This would set age
      stmt.setInt(2, 102); // This would set ID
      
      
      
    String query = request.getParameter("q");
     
    
    
  //  List<String> countries = db.getData(query);
 
    Iterator<String> iterator = countries.iterator();
    while(iterator.hasNext()) {
        String country = (String)iterator.next();
        out.println(country);
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
        
    }

   
}
