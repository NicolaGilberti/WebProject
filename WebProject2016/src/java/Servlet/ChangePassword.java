/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import database.ManagerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import utils.EmailSender;

/**
 *
 * @author David
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/ChangePassword"})
public class ChangePassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            String md5 = request.getParameter("cod");

            String query = "SELECT * FROM users WHERE id=?";

            //Preparazione query
            ManagerDB db = new ManagerDB();
            Connection con = db.getConnection();

            PreparedStatement ps;

            ps = con.prepareStatement(query);
            ps.setInt(1, Integer.valueOf(id));
            String email = null;
            String name = null;
            String surname = null;
            String nickname = null;

            ResultSet results = ps.executeQuery();
            while (results.next()) {
                email = results.getString("email");
                name = results.getString("name");
                surname = results.getString("surname");
                nickname = results.getString("nickname");

            }
            //JOptionPane.showMessageDialog(null, id + email + name + surname + nickname);

            //Inizio generazione MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            md.update(email.getBytes());
            md.update(nickname.getBytes());
            md.update(surname.getBytes());
            md.update(name.getBytes());
            //Se è già stato confermato reindirizziamo TODO

            byte[] digest = md.digest();
            StringBuffer sb = new StringBuffer();
            for (byte b : digest) {
                sb.append(String.format("%02x", b & 0xff));
            }

           //JOptionPane.showMessageDialog(null, sb);

            //Il codice corrisponde. Confermiamo account
            if (sb.toString().equals(md5)) {

                RequestDispatcher dispatcher = request.getRequestDispatcher("changepasswordform.jsp");
                request.setAttribute("id", id); // set your String value in the attribute
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("index.html");
            }

        } catch (SQLException ex) {
            Logger.getLogger(confirmAccount.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(confirmAccount.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
