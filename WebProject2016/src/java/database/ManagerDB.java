/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nicola
 */
public class ManagerDB {
    private Connection c = null;
    /***
     * Costruttore per instaurare la connessione al database
     * 
     */
    public ManagerDB(){
        try {
            Class.forName("org.postgresql.Driver");
            c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/WebProjectDB","postgres", "postgres");
        } catch (Exception e) {
            /*e.printStackTrace();
            System.err.println(e.getClass().getName()+": "+e.getMessage());
            System.exit(0);*/
            //gestire errore in caso di errore driver e/o errore connessione al database
        }
   }
    /**
     * metodo get 
     * @return l'attributo per eseguire query sul database
     */
   public Connection getConnection(){
       return this.c;
   }
   
}
