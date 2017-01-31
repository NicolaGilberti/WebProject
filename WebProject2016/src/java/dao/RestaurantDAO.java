package dao;

import beans.CuisineBean;
import beans.RestaurantBean;
import beans.ReviewBean;
import comparators.CuisineAlphabeticalComparator;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import servlets.SearchRestaurantAutocomplete;
import utils.AutoCompleteData;
import utils.OpeningHours;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author RiccardoUni, Mirko
 */
public class RestaurantDAO {

    private ManagerDB db = null;
    private Connection con = null;

    public RestaurantDAO() {
        db = new ManagerDB();
        con = db.getConnection();
    }
    public boolean reclameRestaurant(int restID, int userID) {
        
        try {
            PreparedStatement ps = con.prepareStatement("INSERT INTO request_changes_owner(id_user,id_restaurant) VALUES (?,?)");
            ps.setInt(1, userID);
            ps.setInt(2, restID);
            
            ResultSet rs = ps.executeQuery();
            int affectedRows = ps.executeUpdate();
            ps.close();
            rs.close();
            if (affectedRows == 0) {
                Logger.getLogger("Errore inserimento recensione, no rows affected.");
                return false;
            }
            return true;
            
        } catch (SQLException ex) {
            //Logger.getLogger(RestaurantDAO.class.getName()).log(Level.SEVERE, null, ex);
            Logger.getLogger("Errore inserimento recensione, keys già esistenti, no rows affected.");
            return false;
        }
        
    }
    public RestaurantBean searchRestaurant(int id) throws SQLException {
        RestaurantBean restaurant = new RestaurantBean();
        PreparedStatement st = con.prepareStatement("SELECT * FROM restaurants WHERE ? = restaurants.id");
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            restaurant.setId(rs.getInt("id"));
            restaurant.setAddress(rs.getString("address"));
            restaurant.setName(rs.getString("name"));
            restaurant.setDescription(rs.getString("description"));
            restaurant.setWeb_site_url(rs.getString("web_site_url"));
            restaurant.setId_owner(rs.getInt("id_owner"));
            restaurant.setId_creator(rs.getInt("id_creator"));
            restaurant.setId_price_range(rs.getInt("id_price_range"));
            restaurant.setLatitude(rs.getDouble("latitude"));
            restaurant.setLongitude(rs.getDouble("longitude"));
            restaurant.setGlobal_value(rs.getInt("global_value"));
        }
        
        st.close();
        rs.close();
        return restaurant;

    }

    public void closeConnection() throws SQLException {
        con.close();
    }

    public ArrayList<String> getPhotos(int id_restaurant) throws SQLException {
        PreparedStatement pd = con.prepareStatement(
                "SELECT name FROM photos WHERE id_restaurant = ?;");
        pd.setInt(1, id_restaurant);
        ResultSet rs = pd.executeQuery();
        ArrayList<String> pn = new ArrayList<String>();
        while (rs.next()) {
            String name = rs.getString(1);
            if (name.substring(0, 3).equals("rev")) {
                pn.add("img/reviewsImgs/" + name);
            }
            else {
                pn.add("img/restImgs/" + name);
            }
        }
        rs.close();
        pd.close();
        return pn;
    }

    public ArrayList<Integer> getPriceRange(int id_price_range) throws SQLException {
        ArrayList<Integer> tmp = new ArrayList<Integer>();
        PreparedStatement pd = con.prepareStatement(
                "SELECT min_value,max_value FROM price_range WHERE id = ?;");
        pd.setInt(1, id_price_range);
        ResultSet rs = pd.executeQuery();
        while (rs.next()) {
            tmp.add(rs.getInt(1));
            tmp.add(rs.getInt(2));
        }
        pd.close();
        rs.close();
        return tmp;
    }

    public ArrayList<CuisineBean> getCuisines(int id) throws SQLException {
        ArrayList<CuisineBean> tmp = new ArrayList<CuisineBean>();
        PreparedStatement pd = con.prepareStatement(
                "SELECT cuisine.id,cuisine.name FROM cuisine "
                + "JOIN restaurants_cuisine ON cuisine.id = "
                + "restaurants_cuisine.id_cuisine AND id_restaurant = ?;");
        pd.setInt(1, id);
        ResultSet rs = pd.executeQuery();
        while (rs.next()) {
            CuisineBean c = new CuisineBean();
            c.setId(rs.getInt(1));
            c.setName(rs.getString(2));
            tmp.add(c);
        }
        pd.close();
        rs.close();
        return tmp;
    }

    public ArrayList<ReviewBean> getReviews(int id) throws SQLException {
        ArrayList<ReviewBean> tmp = new ArrayList<ReviewBean>();
        PreparedStatement pd = con.prepareStatement(
                "SELECT * FROM reviews WHERE id_restaurant = ?");
        pd.setInt(1, id);
        ResultSet rs = pd.executeQuery();

        while (rs.next()) {
            ReviewBean r = new ReviewBean();
            r.setId(rs.getInt("id"));
            r.setName(rs.getString("name"));
            r.setId_creator(rs.getInt("id_creator"));
            r.setId_restaurant(rs.getInt("id_restaurant"));
            r.setData_creation(rs.getTimestamp("data_creation"));
            r.setDescription(rs.getString("description"));
            r.setId_photo(rs.getInt("id_photo"));
            r.setName(rs.getString("name"));
            tmp.add(r);
        }
        pd.close();
        rs.close();
        return tmp;
    }

    public String getThumbnailPath(int id) throws SQLException {
        String path = "";
        PreparedStatement pd = con.prepareStatement(
                "select name from photos where id_restaurant= ? LIMIT 1");
        pd.setInt(1, id);
        ResultSet rs = pd.executeQuery();

        while (rs.next()) {
            if (!"".equals(rs.getString("name"))) {
                path = rs.getString("name");
            } else {
                path = rs.getString("default.png");
            }
        }
        
        pd.close();
        rs.close();
        return path;
    }

    public int getNumOfReviews(int id) throws SQLException {
        int nReviews = 0;
        PreparedStatement pd = con.prepareStatement(
                "select count(*) as nreviews from reviews where id_restaurant= ?;");
        pd.setInt(1, id);
        ResultSet rs = pd.executeQuery();

        while (rs.next()) {
            nReviews = rs.getInt(1);
        }
        
        pd.close();
        rs.close();
        return nReviews;
    }

    public ArrayList<RestaurantBean> getRestaurantsbySearch(String searchInput) throws SQLException {

        ArrayList<RestaurantBean> restaurantsList = new ArrayList<RestaurantBean>();
        searchInput = searchInput.replaceAll("'", "''");
        String[] valoriInseriti = searchInput.split("\\s+");
        PreparedStatement sqlStatement = null;
        String whereParams = "";

        String sql = "select id,name,description,address,city,global_value,min_value,max_value "
                + "from (select restaurants.id,name,description,address,city,global_value,min_value,max_value,(name ||' , '|| address ||' , '||city) as t"
                + " from restaurants join price_range on restaurants.id_price_range=price_range.id) as a "
                + "where t @@ ?";
        for (int i = 0; i < valoriInseriti.length; i++) {
            whereParams += valoriInseriti[i] + " && ";

        }
        // sql += "'";
        sqlStatement = con.prepareStatement(sql);
        sqlStatement.setString(1, whereParams);

        ResultSet results = sqlStatement.executeQuery();

        while (results.next()) {

            RestaurantBean risto = new RestaurantBean();
            risto.setId(results.getInt("id"));
            risto.setName(results.getString("name"));
            risto.setAddress(results.getString("address"));
            risto.setCity(results.getString("city"));
            risto.setScore(results.getInt("global_value"));
            risto.setMinPrice(results.getDouble("min_value"));
            risto.setMaxPrice(results.getDouble("max_value"));

            //Ora devo ottenere il numero di recensioni che ha quel ristorante
            int nReviews = this.getNumOfReviews(risto.getId());
            risto.setNumReviews(nReviews);

            //Ora ottengo i tipi di cucina
            List<CuisineBean> cuisineTypes = new ArrayList<>();
            cuisineTypes = this.getCuisines(risto.getId());

            Collections.sort(cuisineTypes, new CuisineAlphabeticalComparator());

            risto.setCuisineTypes(cuisineTypes);

            //Ora ottengo le foto
            risto.setImgPath(this.getThumbnailPath(risto.getId()));

            //E infine aggiungo il ristorante alla lista
            restaurantsList.add(risto);
        }
        
        sqlStatement.close();
        results.close();
        return restaurantsList;

    }

    public ArrayList<RestaurantBean> getRestaurantsbyLocation(float lat, float longi) throws SQLException {
        ArrayList<RestaurantBean> restaurantsList = new ArrayList<RestaurantBean>();

        PreparedStatement sqlStatement = null;

        String sql = "select restaurants.id,name,description,address,city,global_value,min_value,max_value from restaurants join price_range on restaurants.id_price_range=price_range.id WHERE abs(latitude- ?)<0.25 AND abs(longitude- ? ) <0.25";

        sqlStatement = con.prepareStatement(sql);
        sqlStatement.setFloat(1, lat);
        sqlStatement.setFloat(2, longi);

        ResultSet results = sqlStatement.executeQuery();

        while (results.next()) {

            RestaurantBean risto = new RestaurantBean();
            risto.setId(results.getInt("id"));
            risto.setName(results.getString("name"));
            risto.setAddress(results.getString("address"));
            risto.setCity(results.getString("city"));
            risto.setScore(results.getInt("global_value"));
            risto.setMinPrice(results.getDouble("min_value"));
            risto.setMaxPrice(results.getDouble("max_value"));

            //Ora devo ottenere il numero di recensioni che ha quel ristorante
            int nReviews = this.getNumOfReviews(risto.getId());
            risto.setNumReviews(nReviews);

            //Ora ottengo i tipi di cucina
            List<CuisineBean> cuisineTypes = new ArrayList<>();
            cuisineTypes = this.getCuisines(risto.getId());

            Collections.sort(cuisineTypes, new CuisineAlphabeticalComparator());

            risto.setCuisineTypes(cuisineTypes);

            //Ora ottengo le foto
            risto.setImgPath(this.getThumbnailPath(risto.getId()));

            //E infine aggiungo il ristorante alla lista
            restaurantsList.add(risto);
        }
        
        sqlStatement.close();
        results.close();
        return restaurantsList;
    }

    public String getUserNickname(int userId) throws SQLException {
        PreparedStatement pd = con.prepareStatement(
                "SELECT nickname FROM users WHERE id = ?;");
        pd.setInt(1, userId);
        ResultSet rs = pd.executeQuery();
        rs.next();
        String res = rs.getString(1);
        
        pd.close();
        rs.close();
        return res;
        
    }

    public OpeningHours getOpeningHours(int id) throws SQLException {
        OpeningHours oh = new OpeningHours();
        PreparedStatement pd = con.prepareStatement(
                "SELECT day_of_the_week,start_hour,end_hour "
                + "FROM opening_hours_range_restaurant "
                + "JOIN opening_hours_range ON id_range = id "
                + "WHERE id_restaurant = ?"
                + "ORDER BY start_hour, day_of_the_week");
        pd.setInt(1, id);
        ResultSet rs = pd.executeQuery();
        while (rs.next()) {
            oh.setOpenDays(rs.getInt(1));
            oh.setOpeningHour(Time.valueOf(rs.getTime(2).toString()));
            oh.setClosingHour(Time.valueOf(rs.getTime(3).toString()));
        }

        pd.close();
        rs.close();
        return oh;
    }

    public ArrayList<RestaurantBean> getRestaurantsbyPopularity() throws SQLException {
        ArrayList<RestaurantBean> restaurantsList = new ArrayList<RestaurantBean>();

        PreparedStatement sqlStatement = null;

        String sql = "select restaurants.id,name,description,address,city,global_value,min_value,max_value,n_visits from restaurants join price_range on restaurants.id_price_range=price_range.id ORDER BY n_visits DESC LIMIT 4";

        sqlStatement = con.prepareStatement(sql);

        ResultSet results = sqlStatement.executeQuery();

        while (results.next()) {

            RestaurantBean risto = new RestaurantBean();
            risto.setId(results.getInt("id"));
            risto.setName(results.getString("name"));
            risto.setAddress(results.getString("address"));
            risto.setCity(results.getString("city"));
            risto.setScore(results.getInt("global_value"));
            risto.setMinPrice(results.getDouble("min_value"));
            risto.setMaxPrice(results.getDouble("max_value"));
            risto.setN_visits(results.getInt("n_visits"));

            //Ora devo ottenere il numero di recensioni che ha quel ristorante
            int nReviews = this.getNumOfReviews(risto.getId());
            risto.setNumReviews(nReviews);

            //Ora ottengo i tipi di cucina
            List<CuisineBean> cuisineTypes = new ArrayList<>();
            cuisineTypes = this.getCuisines(risto.getId());

            Collections.sort(cuisineTypes, new CuisineAlphabeticalComparator());

            risto.setCuisineTypes(cuisineTypes);

            //Ora ottengo le foto
            risto.setImgPath(this.getThumbnailPath(risto.getId()));

            //E infine aggiungo il ristorante alla lista
            restaurantsList.add(risto);
        }
        
        sqlStatement.close();
        results.close();
        return restaurantsList;
    }

    public ArrayList<CuisineBean> getCuisineTypes() throws SQLException {
        ArrayList<CuisineBean> tmp = new ArrayList<>();
        PreparedStatement st = con.prepareStatement("SELECT name,id FROM cuisine");
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            CuisineBean a = new CuisineBean();
            a.setName(rs.getString(1));
            a.setId(rs.getInt(2));
            tmp.add(a);
        }

        st.close();
        rs.close();
        return tmp;
    }

    public int addRestaurant(RestaurantBean rest) throws SQLException {

        int affectedRows = 0;
        int restID = 0;

        String query = "INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, rest.getName());
        ps.setString(2, rest.getDescription());
        ps.setString(3, rest.getWeb_site_url());
        ps.setInt(4, rest.getGlobal_value());
        ps.setInt(5, rest.getId_owner());
        ps.setInt(6, rest.getId_creator());
        ps.setInt(7, rest.getId_price_range());
        ps.setDouble(8, rest.getLatitude());
        ps.setDouble(9, rest.getLongitude());
        ps.setString(10, rest.getAddress());
        ps.setInt(11, rest.getCap());
        ps.setString(12, rest.getCity());
        ps.setInt(13, rest.getId_country());

        affectedRows = ps.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Errore inserimento ristorante, no rows affected.");
        }
        //Andiamo a prendere l'id del nuovo ristorante
        try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                restID = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Errore creazione utente, no ID obtained.");
            }
            ps.close();
            generatedKeys.close();
            
        }
        
        return restID;
    }

    public void addRestCuisine(int id, String[] checkedCuisineIds) throws SQLException {

        int affectedRows = 0;
        //Creiamo la query da eseguire. Un insert per ogni tipologia di cucina.
        String query = "";
        for (int i = 0; i < checkedCuisineIds.length; i++) {
            query += "INSERT INTO restaurants_cuisine VALUES (" + checkedCuisineIds[i] + ",+" + id + ");";
        }
        PreparedStatement ps = con.prepareStatement(query);
        affectedRows = ps.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Errore inserimento tipologia di cucina, no rows affected.");
        }
        ps.close();

    }

    public void addRestOpeningHours(int id, String[] checkedOpeningHoursIds) throws SQLException {
        int affectedRows = 0;
        //Creiamo la query da eseguire. Un insert per ogni tipologia di cucina.
        String query = "";
        for (int i = 0; i < checkedOpeningHoursIds.length; i++) {
            query += "INSERT INTO opening_hours_range_restaurant VALUES (" + checkedOpeningHoursIds[i] + ",+" + id + ");";
        }
        PreparedStatement ps = con.prepareStatement(query);
        affectedRows = ps.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Errore inserimento tipologia di cucina, no rows affected.");
        }
        ps.close();
    }

    public List<AutoCompleteData> getAutoCompleteData(String[] valoriInseriti) {
        List<String> valori = new ArrayList<String>();
        final List<AutoCompleteData> result = new ArrayList<AutoCompleteData>();
        //Otteniamo tutte le citta salvate
        String sql = "select t "
                + "from (select (name ||' , '|| address ||' , '||city) as t"
                + " from restaurants) as a "
                + "where t @@ '";
        for (int i = 0; i < valoriInseriti.length; i++) {
            sql += valoriInseriti[i];
            sql += " && ";
        }
        sql += "'";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet results = ps.executeQuery();

            //Per tutti i risultati
            while (results.next()) {
                //Prendiamo una citta
                String temp = results.getString("t");
                valori.add(temp);

            }

            for (final String country : valori) {
                result.add(new AutoCompleteData(country, country));
            }
            ps.close();
            results.close();
        } catch (SQLException ex) {
            Logger.getLogger(SearchRestaurantAutocomplete.class.getName()).log(Level.SEVERE, null, ex);
        }
        
       
        return result;
    }

    public HashMap<Integer,ArrayList<Integer>> getLikes(int id) throws SQLException {
        HashMap<Integer,ArrayList<Integer>> result = new HashMap<>();
        PreparedStatement pd = con.prepareStatement(
            "SELECT rev.id, SUM(url.like_type) AS n_like,"
                    + " COUNT(url.like_type) AS questo_meno_like_implica_dislike"
                    + " FROM public.reviews rev "
                    + "FULL OUTER JOIN public.user_review_likes url ON (url.id_review = rev.id) "
                    + "WHERE rev.id_restaurant = ? GROUP BY rev.id ORDER BY rev.id");
        pd.setInt(1, id);
        ResultSet rs = pd.executeQuery();
        while (rs.next()) {
            //arrayList per likes dislikes
            ArrayList<Integer> tmp = new ArrayList();
            tmp.add(rs.getInt(2));
            tmp.add(rs.getInt(3)-rs.getInt(2));
            result.put(rs.getInt(1), tmp);
        }
        pd.close();
        rs.close();
       return result;
    }
    public void incrNumVisit(int id_restaurant) throws SQLException{
        PreparedStatement pd = con.prepareStatement(
                "UPDATE restaurants" +
                " SET n_visits=n_visits+1" +
                " WHERE id=?");
        pd.setInt(1, id_restaurant);
        int rs = pd.executeUpdate();
        if (rs == 0) {
            throw new SQLException("Errore inserimento tipologia di cucina, no rows affected.");
        }
        pd.close();
    }
}
