package dao;

import beans.CuisineBean;
import beans.RestaurantBean;
import beans.RestaurantSearchBean;
import beans.ReviewBean;
import comparators.CuisineAlphabeticalComparator;
import database.ManagerDB;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author RiccardoUni
 */
public class RestaurantDAO {

    private ManagerDB db = null;
    private Connection con = null;

    public RestaurantDAO() {
        db = new ManagerDB();
        con = db.getConnection();
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
            pn.add("img/restImgs/" + rs.getString(1));
        }
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
        return tmp;
    }

    public ArrayList<ReviewBean> getReviews(int id) throws SQLException {
        ArrayList<ReviewBean> tmp = new ArrayList<ReviewBean>();
        PreparedStatement pd = con.prepareStatement(
                "SELECT * FROM reviews WHERE id_restaurant = ?;");
        pd.setInt(1, id);
        ResultSet rs = pd.executeQuery();

        while (rs.next()) {
            ReviewBean r = new ReviewBean();
            r.setId(rs.getInt("id"));
            r.setId_creator(rs.getInt("id_creator"));
            r.setId_restaurant(rs.getInt("id_restaurant"));
            r.setData_creation(rs.getTimestamp("data_creation").toString().substring(0, 10));
            r.setDescription(rs.getString("description"));

            tmp.add(r);
        }
        return tmp;
    }

    public String getThumbnailPath(int id) throws SQLException {
        String path = "";
        PreparedStatement pd = con.prepareStatement(
                "select name from photos where id_restaurant= ? LIMIT 1");
        pd.setInt(1, id);
        ResultSet rs = pd.executeQuery();

        while (rs.next()) {
            if (rs.getString("name") != "") {
                path = rs.getString("name");
            } else {
                path = rs.getString("default.png");
            }
        }
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
        return nReviews;
    }

    public ArrayList<RestaurantSearchBean> getRestaurantsbySearch(String searchInput) throws SQLException {

        ArrayList<RestaurantSearchBean> restaurantsList = new ArrayList<RestaurantSearchBean>();
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

            RestaurantSearchBean risto = new RestaurantSearchBean();
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
        return restaurantsList;

    }

    public ArrayList<RestaurantSearchBean> getRestaurantsbyLocation(float lat, float longi) throws SQLException {
        ArrayList<RestaurantSearchBean> restaurantsList = new ArrayList<RestaurantSearchBean>();

        PreparedStatement sqlStatement = null;

        String sql = "select restaurants.id,name,description,address,city,global_value,min_value,max_value from restaurants join price_range on restaurants.id_price_range=price_range.id WHERE abs(latitude- ?)<0.25 AND abs(longitude- ? ) <0.25";

        sqlStatement = con.prepareStatement(sql);
        sqlStatement.setFloat(1, lat);
        sqlStatement.setFloat(2, longi);

        ResultSet results = sqlStatement.executeQuery();

        while (results.next()) {

            RestaurantSearchBean risto = new RestaurantSearchBean();
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
        return restaurantsList;
    }

    public String getUserName(int userId) throws SQLException {
        PreparedStatement pd = con.prepareStatement(
                "SELECT name FROM users WHERE id = ?;");
        pd.setInt(1, userId);
        ResultSet rs = pd.executeQuery();
        rs.next();
        return rs.getString("name");
    }
}
