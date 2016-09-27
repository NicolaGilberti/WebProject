/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author RiccardoUni
 */
public class StateQueries {
    
    public ResultSet states() throws SQLException {
        ManagerDB mdb = new ManagerDB();
        Connection con = mdb.getConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;

        ps = con.prepareStatement("SELECT name FROM states;");
   
        rs = ps.executeQuery();
        return rs;
    }
}
