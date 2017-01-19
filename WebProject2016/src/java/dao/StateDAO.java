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
import java.util.List;

/**
 *
 * @author RiccardoUni
 */
public class StateDAO {
    private ManagerDB db = null;
    private Connection con = null;

    public StateDAO() {
        db = new ManagerDB();
        con = db.getConnection();
    }
    
    public ArrayList<String> getStates() throws SQLException {

        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<String> res = new ArrayList<>();

        ps = con.prepareStatement("SELECT name FROM states;");
   
        rs = ps.executeQuery();
        while(rs.next()) {
            res.add(rs.getString(1));
        }
        
        return res;
    }
}
