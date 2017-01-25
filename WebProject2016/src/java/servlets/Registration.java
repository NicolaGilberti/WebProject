/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.RegistrationDAO;
import database.ManagerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.EmailSender;

/**
 *
 * @author David
 */
public class Registration extends HttpServlet {

    RegistrationDAO regdao = new RegistrationDAO();

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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {

            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String nickname = request.getParameter("nickname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            password = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
            //Inizio generazione MD5 per link
            
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(name.getBytes());
            md.update(surname.getBytes());
            md.update(nickname.getBytes());
            md.update(email.getBytes());
            byte[] digest = md.digest();
            StringBuffer sb = new StringBuffer();
            for (byte b : digest) {
                sb.append(String.format("%02x", b & 0xff));
            }
            //Fine generazione MD5
            int userID = regdao.setRegistrationParameters(name, surname, nickname, email, password);            

            boolean sessionDebug = false;
            String url = "http://localhost:8084/WebProject2016/ConfirmAccount?id=" + Integer.toString(userID) + "&cod=" + sb.toString();
            String text = "Ciao, "+ nickname + ". Questa è la mail per confermare il tuo account. Clicca qui per confermare l'account: <a href=\" " + url + " \"> Clicca qui </a>";

            String object = "[TuttoBistrò] Mail di conferma";

            //Spediamo email
            EmailSender sender = new EmailSender();
            sender.send(email, text, object);
            response.sendRedirect("maildiconferma.html");

        } catch (SQLException ex) {

            response.sendRedirect("sql_error_page.html");
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
