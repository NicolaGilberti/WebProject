/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import database.ManagerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.*;
import static java.util.Objects.hash;
import javax.mail.*;
import javax.activation.*;
import javax.mail.internet.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import static sun.text.normalizer.Utility.hex;
import utils.EmailSender;
import static sun.text.normalizer.Utility.hex;

/**
 *
 * @author David
 */
@WebServlet(name = "Registrazione", urlPatterns = {"/Registrazione"})
public class Registrazione extends HttpServlet {

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

            //Preparzione query
            ManagerDB db = new ManagerDB();
            Connection con = db.getConnection();

            PreparedStatement ps = con.prepareStatement("INSERT INTO users(name,surname,nickname,email,password,type) VALUES (?,?,?,?,?,-1)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, name);
            ps.setString(2, surname);
            ps.setString(3, nickname);
            ps.setString(4, email);
            ps.setString(5, password);

            int affectedRows = ps.executeUpdate();
            int userID; //Id dell'utente appena inserito
            if (affectedRows == 0) {
                throw new SQLException("Errore creazione utente, no rows affected.");
            }
            //Andiamo a prendere l'id del nuovo utente
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    userID = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Errore creazione utente, no ID obtained.");
                }
            }

            boolean sessionDebug = false;
            String url = "http://localhost:8084/WebProject2016/confirmAccount?id=" + Integer.toString(userID) + "&cod=" + sb.toString();
            String text = "Questa è una mail di conferma."
                    + "Clicca qui per confermare l'account: <a href=\" " + url + " \"> Clicca qui </a>";

            String object = "[TuttoBistrò] Mail di conferma";

            //Spediamo email
            EmailSender sender = new EmailSender();
            sender.send(email, text, object);
            response.sendRedirect("maildiconferma.html");

        } catch (SQLException ex) {

            out.println("connessione non riuscita");
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Registrazione.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
