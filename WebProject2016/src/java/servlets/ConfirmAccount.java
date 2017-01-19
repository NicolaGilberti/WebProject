/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

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
 * @author MirkoPortatile
 */

public class ConfirmAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            String md5 = request.getParameter("cod");
            String query = "SELECT * FROM users WHERE id=?";
            String email = "";
            //Preparazione query
            ManagerDB db = new ManagerDB();
            Connection con = db.getConnection();

            PreparedStatement ps;

            ps = con.prepareStatement(query);
            ps.setInt(1, Integer.valueOf(id));
            ResultSet results = ps.executeQuery();

            //Inizio generazione MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            //Per tutti i risultati
            while (results.next()) {
                md.update(results.getString("name").getBytes());
                md.update(results.getString("surname").getBytes());
                md.update(results.getString("nickname").getBytes());
                email = results.getString("email");
                md.update(email.getBytes());
                //Se è già stato confermato reindirizziamo TODO
                if(results.getInt("type")!=-1)
                {
                    response.sendRedirect("index.jsp");
                }
            }
            
            byte[] digest = md.digest();
            StringBuffer sb = new StringBuffer();
            for (byte b : digest) {
                sb.append(String.format("%02x", b & 0xff));
            }

            //Il codice corrisponde. Confermiamo account
            if (sb.toString().equals(md5)) {
                query = "UPDATE users SET type=0 WHERE id=?";
                ps = con.prepareStatement(query);
                ps.setInt(1, Integer.valueOf(id));
                int affected = ps.executeUpdate();
                if (affected == 0) {
                    throw new SQLException("Errore creazione utente, no rows affected.");

                }
                //Abbiamo aggiornato l'account dell'utente. Ora potrà fare l'accesso.   
                //Spediamo email TODO migliorare
                EmailSender sender = new EmailSender();
                sender.send(email, "Ciao, hai confermato il tuo account! Ora puoi utilizzare il sito normalmente", "[TuttoBistrò] Email di conferma account");
                response.sendRedirect("accountregistrato.html");
            } else {
                response.sendRedirect("index.jsp");
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConfirmAccount.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ConfirmAccount.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
