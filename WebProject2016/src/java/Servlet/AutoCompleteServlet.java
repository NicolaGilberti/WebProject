/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
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
@WebServlet(name = "AutoCompleteServlet", urlPatterns = {"/AutoCompleteServlet"})
public class AutoCompleteServlet extends HttpServlet {

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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        final List<String> countryList = new ArrayList<String>();
        countryList.add("USA");
        countryList.add("Pakistan");
        countryList.add("Britain");
        countryList.add("India");
        countryList.add("Italy");
        countryList.add("Ireland");
        countryList.add("Bangladesh");
        countryList.add("Brazil");
        countryList.add("United Arab Emirates");
        Collections.sort(countryList);

        // Map real data into JSON
        response.setContentType("application/json");

        final String param = request.getParameter("term");
        final List<AutoCompleteData> result = new ArrayList<AutoCompleteData>();
        for (final String country : countryList) {
            if (country.toLowerCase().startsWith(param.toLowerCase())) {
                result.add(new AutoCompleteData(country, country));
            }
        }
        response.getWriter().write(new Gson().toJson(result));
    }

    
}


