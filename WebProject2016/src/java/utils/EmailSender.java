/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author David
 */
public class EmailSender {

    private String text;
    private String object;
    private Session sessione;

    public EmailSender() {

        String host = "mail.google.com";
        final String username = "david.marinangeli@gmail.com";
        final String passw = "fsavsdakchxmflgp";
        Properties props = System.getProperties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.debug", "true");
        sessione = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication
                    getPasswordAuthentication() {
                return new PasswordAuthentication(username, passw);
            }
        });
    }

    public void send(String email, String t, String o) {
        try {

            Message msg = new MimeMessage(sessione);
            msg.setFrom(new InternetAddress("tuttobistro@gmail.com"));
            msg.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email, false));
            msg.setSubject(o);
            msg.setText(t);

            Transport.send(msg);
        } catch (Exception e) {

            e.printStackTrace();

        }

    }
}
