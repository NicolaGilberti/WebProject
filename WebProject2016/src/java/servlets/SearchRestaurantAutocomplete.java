/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.google.gson.Gson;
import dao.RestaurantDAO;
import database.ManagerDB;
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
public class SearchRestaurantAutocomplete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     *doPost:Usato per rispondere ad una richiesta POST alla rispettiva Servlet.
     * Funzione usata per l'autocompletamento dei risultati nella barra di ricerca. 
     * Invia tramite response in formato json i suggerimenti ottenuti dal DB.
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Otteniamo il parametro formato da varie stringhe
        String valoreInserito = request.getParameter("term");
        //Splittiamo il parametro in tante stringhe
        String[] valoriInseriti = valoreInserito.split("\\s+");

        //Otteniamo i dati autocomplete dal DAO apposito
        RestaurantDAO restDAO=new RestaurantDAO();
        List<AutoCompleteData> result= restDAO.getAutoCompleteData(valoriInseriti);
        
        //Rispediamo i dati
        response.setContentType("application/json");
        response.getWriter().write(new Gson().toJson(result));
    }

}
