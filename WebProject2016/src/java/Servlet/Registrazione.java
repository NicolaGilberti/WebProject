/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import database.ManagerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.EmailSender;

/**
 *
 * @author David
 */
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

            ManagerDB db = new ManagerDB();
            Connection con = db.getConnection();

            PreparedStatement ps = con.prepareStatement("INSERT INTO users(name,surname,nickname,email,password,type) VALUES (?,?,?,?,?,-1)");
            ps.setString(1, name);
            ps.setString(2, surname);
            ps.setString(3, nickname);
            ps.setString(4, email);
            ps.setString(5, password);

            ps.executeUpdate();

            boolean sessionDebug = false;
            String text = "Questa è una mail di conferma";
            String object = "[TuttoBistrò] Mail di conferma";

            EmailSender sender = new EmailSender();
            sender.send(email, text, object);
            response.sendRedirect("maildiconferma.html");
        } catch (SQLException ex) {

            out.println("connessione non riuscita");
        }

    }
}
