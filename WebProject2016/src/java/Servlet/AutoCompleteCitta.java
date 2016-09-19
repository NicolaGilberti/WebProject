/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import com.google.gson.Gson;
import database.ManagerDB;
import info.debatty.java.stringsimilarity.NGram;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.AutoCompleteData;

/**
 *
 * @author MirkoPortatile
 */
@WebServlet(name = "AutoCompleteCitta", urlPatterns = {"/AutoCompleteCitta"})
public class AutoCompleteCitta extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cittaInserita = request.getParameter("term");
        NGram twogram = new NGram(2);
        List<String> countries = new ArrayList<String>();
        double test;

        //Instauriamo connessione
        ManagerDB manager = new ManagerDB();
        Connection connection = manager.getConnection();

        //Otteniamo tutte le citta salvate
        String sql = "SELECT DISTINCT citta FROM restaurant";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet results = ps.executeQuery();

            //Per tutti i risultati
            while (results.next()) {
                //Prendiamo una citta
                String temp = results.getString("citta");
                test = twogram.distance(temp.toLowerCase(), cittaInserita);
                if (test > 0.3) {
                    countries.add(temp);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AutoCompleteCitta.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Map real data into JSON
        response.setContentType("application/json");

        final List<AutoCompleteData> result = new ArrayList<AutoCompleteData>();
        for (final String country : countries) {
            result.add(new AutoCompleteData(country, country));
        }
        response.getWriter().write(new Gson().toJson(result));
    }

}
