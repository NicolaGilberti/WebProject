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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import info.debatty.java.stringsimilarity.JaroWinkler;
import info.debatty.java.stringsimilarity.NGram;
/**
 *
 * @author MirkoPortatile
 */
@WebServlet(name = "getData", urlPatterns = {"/getData"})
public class getData extends HttpServlet {

 
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cittaInserita = request.getParameter("q");
         NGram twogram = new NGram(2);
      //  List<String> countries=new List<String>();
      PrintWriter out=response.getWriter();
      double test;
      
        //Instauriamo connessione
       ManagerDB manager=new ManagerDB();
 Connection connection=manager.getConnection();
       
        //Otteniamo tutte le citta salvate
       String sql = "SELECT DISTINCT citta FROM restaurant";
        try {
            PreparedStatement ps=connection.prepareStatement(sql);
            ResultSet results= ps.executeQuery();
       
            //Per tutti i risultati
            while(results.next())
            {
                //Prendiamo una citta
                String temp=results.getString("citta");
               test=twogram.distance(temp.toLowerCase(), cittaInserita);

                     out.println(temp);


                
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(getData.class.getName()).log(Level.SEVERE, null, ex);
        }
      
    
      
      
      
    
     
    
    
  //  List<String> countries = db.getData(query);
 
        
        
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
