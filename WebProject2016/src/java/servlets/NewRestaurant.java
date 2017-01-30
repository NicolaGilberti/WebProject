/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.PhotoBean;
import beans.RestaurantBean;
import beans.UserBean;
import dao.PhotoDAO;
import dao.RestaurantDAO;
import dao.UserDAO;
import database.ManagerDB;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static java.lang.Integer.parseInt;
import java.util.Calendar;
import java.util.Collection;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import utils.GeoCoder;
import utils.GeocodeResponse;

/**
 *
 * @author riccardo, Mirko
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class NewRestaurant extends HttpServlet {

    //Path della cartella dove salvare i file immagine
    private static final String SAVE_DIR = "img\\restImgs";

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Controlliamo che i parametri siano specificati e corretti e se si procediamo.
        if (request.getParameter("nome") != null && request.getParameter("descrizione") != null && request.getParameter("cap") != null && request.getParameter("citta") != null
                && request.getParameter("stato") != null) {

            try {
                //Procediamo a salvare le informazioni
                RestaurantBean rest = new RestaurantBean();

                rest.setName(request.getParameter("nome"));
                rest.setDescription(request.getParameter("descrizione"));
                rest.setWeb_site_url(request.getParameter("URL_sito"));
                rest.setTelephone(request.getParameter("telefono"));
                rest.setMail(request.getParameter("email"));
                rest.setAddress(request.getParameter("indirizzo"));
                rest.setCap(request.getParameter("cap").isEmpty() ? 0 : parseInt(request.getParameter("cap")));
                rest.setCity(request.getParameter("citta"));
                rest.setId_country(Integer.valueOf(request.getParameter("stato")));
                rest.setId_price_range(Integer.valueOf(request.getParameter("pricerange")));
                rest.setGlobal_value(0);
                String[] checkedCuisineIds = request.getParameterValues("cuisine");
                String[] checkedOpeningHoursIds = request.getParameterValues("openinghour");

                //Dobbiamo ottenere latitudine e longitudine
                GeoCoder geo = new GeoCoder();
                GeocodeResponse geoResp = geo.getLocation(rest.getAddress(), rest.getCity(), String.valueOf(rest.getCap()));
                rest.setLatitude(geoResp.getResults().get(0).getGeometry().getLocation().getLat());
                rest.setLongitude(geoResp.getResults().get(0).getGeometry().getLocation().getLng());

                //Cerchiamo l'id dell'utente che sta creando il ristorante
                HttpSession session = request.getSession(false);
                UserBean userLogged = (UserBean) session.getAttribute("user");
                rest.setId_creator(userLogged.getId());
                rest.setId_owner(userLogged.getId());

                //Abbiamo salvato tutto nel bean, ora dobbiamo inviare il bean al DAO e salvare le modifiche al database
                RestaurantDAO restDAO = new RestaurantDAO();
                int restID = restDAO.addRestaurant(rest);

                //Ora dobbiamo salvare le relazioni per cuisineType e openinghour 
                restDAO.addRestCuisine(restID, checkedCuisineIds);
                restDAO.addRestOpeningHours(restID, checkedOpeningHoursIds);

                //Tutto è andato a buon fine, possiamo dunque salvare la foto in locale e apportare modifiche nel database
                PhotoBean foto = new PhotoBean();
                foto.setName(String.valueOf(restID) + ".jpg");
                foto.setDescription("Foto ristorante");
                foto.setId_restaurant(restID);
                foto.setId_user(userLogged.getId());

                // (2) create a java timestamp object that represents the current time (i.e., a "current timestamp")
                Calendar calendar = Calendar.getInstance();
                foto.setDate(new java.sql.Timestamp(calendar.getTime().getTime()));

                //Inseriamo la foto nel db
                PhotoDAO photoDao = new PhotoDAO();
                photoDao.addPhoto(foto);

                //Salviamo la foto in locale
                // gets absolute path of the web application
                String appPath = request.getServletContext().getRealPath("");
                // constructs path of the directory to save uploaded file
                String savePath = appPath + File.separator + SAVE_DIR;

                // creates the save directory if it does not exists
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }

                Part part = request.getPart("foto");
                String fileName = String.valueOf(restID) + ".jpg";
                // refines the fileName in case it is an absolute path
                fileName = new File(fileName).getName();
                part.write(savePath + File.separator + fileName);
                Logger.getLogger(NewRestaurant.class.getName()).log(Level.SEVERE, savePath + File.separator + fileName);

                //Fine salvataggio foto
                //Dobbiamo aggiornare l'utente se non era già ristoratore, ora che ha messo un ristorante!
                if (userLogged.getType() == 0) {
                    UserDAO userDAO = new UserDAO();
                    int affectedRows = userDAO.upgradeUser(userLogged.getId());
                    if (affectedRows == 0) {
                        throw new SQLException("Errore aggiornamento utente, no rows affected.");
                    } else {
                        userLogged.setType(1);
                        session.setAttribute("user", userLogged);
                    }
                }

                request.setAttribute("formValid", "The restaurant " + rest.getName() + " has been create ");
                RequestDispatcher rd = request.getRequestDispatcher("/createdRestaurant.jsp");
                rd.forward(request, response);

            } catch (SQLException ex) {
                Logger.getLogger(NewRestaurant.class.getName()).log(Level.SEVERE, null, ex);
            }

        } //Errore, non tutti i parametri necessari sono stati specificati.
        else {
            RequestDispatcher rd = request.getRequestDispatcher("/general_error_page.jsp");
            rd.forward(request, response);
        }

        //can also write the photo to local storage

        /*
        RestaurantBean rest = new RestaurantBean();

        rest.setName(request.getParameter("nome"));
        rest.setDescription(request.getParameter("descrizione"));
        rest.setWeb_site_url(request.getParameter("URL_sito"));
        
        rest.setAddress(request.getParameter("indrizzo"));
        rest.setCap(request.getParameter("cap").isEmpty() ? 0 : parseInt(request.getParameter("cap")));
        rest.setCity(request.getParameter("citta"));
        rest.setCountry(request.getParameter("stato"));
        
        rest.setGlobal_value(0);

        HttpSession session = request.getSession(false);
        UserBean userLogged = (UserBean) session.getAttribute("utente");
        
        if (userLogged == null) {
            //Errore log in utente
        }
        else {
            
            rest.setId_creator(userLogged.getId());
            rest.setId_owner(userLogged.getId());
            
            //connessione DataBase
            ManagerDB mdb = new ManagerDB();
            Connection con = mdb.getConnection();

            PreparedStatement ps = null;

            try {
                ps = con.prepareStatement(
                        "INSERT INTO restaurants(name,description,web_site_url,"
                                + "id_owner,id_creator,latitude,longitude,address,"
                                + "cap,city,country,telephone,e_mail)"
                                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);");

                ps.setString(1, rest.getName());
                ps.setString(2, rest.getDescription());
                ps.setString(3, rest.getWeb_site_url());
                ps.setInt(4, rest.getId_creator());
                ps.setInt(5, rest.getId_creator());
                //6-7
                ps.setString(8, rest.getAddress());
                ps.setString(9, ((Integer) rest.getCap()).toString());
                ps.setString(10, rest.getCity());
                ps.setString(11, rest.getCountry());
                ps.setString(12, rest.getTelephone());
                ps.setString(13, rest.getE_mail());

                ResultSet rs = ps.executeQuery();

            } catch (SQLException ex) {
                System.out.println(ex.toString() + " errore query");
                Logger.getLogger(NewRestaurant.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println(ex.toString() + " errore chiusura classe PreparedStatement");
                    Logger.getLogger(NewRestaurant.class.getName()).log(Level.SEVERE, null, ex);
                }

                request.setAttribute("formValid", "The restaurant " + rest.getName() + " has been create ");
                RequestDispatcher rd = request.getRequestDispatcher("/createdRestaurant.jsp");
                rd.forward(request, response);
            }
        }*/
    }
}
