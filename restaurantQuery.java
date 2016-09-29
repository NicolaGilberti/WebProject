/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import beans.Restaurant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.catalina.Manager;

/**
 *
 * @author Marco
 */
public class restaurantQuery {
    private ManagerDB db ;
    private Connection con;
    
    public restaurantQuery(){
        db = new ManagerDB();
        con = db.getConnection();
    }
    
    public Restaurant searchRestaurant(int id) throws SQLException{
      Restaurant temp = new Restaurant();
      PreparedStatement st = con.prepareStatement("SELECT * FROM resturants WHERE ? = restaurants.id");
      st.setInt(1,id);
      ResultSet res = st.executeQuery();
      temp.setAddress(res.getString("address"));
      temp.setId(res.getInt("id"));
      temp.setDescription(res.getString("description"));
      temp.setWeb_site_url(res.getString("web_site_url"));
      temp.setId_owner(res.getInt("id_owner"));
      temp.setId_creator(res.getInt("id_creator"));
      temp.setId_price_range(res.getInt("id_price_range"));
      temp.setLatitude(res.getDouble("latitude"));
      temp.setLongitude(res.getDouble("longitude"));
      return temp;
    }
}
