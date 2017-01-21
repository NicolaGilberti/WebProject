/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author RiccardoUni
 */
public class restaurantTypesDAO {
    
     private ManagerDB db = null;
    private Connection con = null;

    public restaurantTypesDAO() {
        db = new ManagerDB();
        con = db.getConnection();
       
    }

    public ArrayList<String> getTypes() throws SQLException {
        ArrayList<String> tmp = new ArrayList<>();
        PreparedStatement st = con.prepareStatement("SELECT name FROM cuisine");
        ResultSet rs = st.executeQuery();
        
        while(rs.next()) {
            tmp.add(rs.getString(1));
        }
        
        return tmp;
    }
    
}
