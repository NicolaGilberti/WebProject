/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.StateBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * This class is used to manage the States database table.
 *
 * @author RiccardoUni,Mirko
 */
public class StateDAO {

    private ManagerDB db = null;
    private Connection con = null;

    /**
     * connect the DB
     */
    public StateDAO() {
        db = new ManagerDB();
        con = db.getConnection();
    }
    
    /**
     * 
     * @return an array list containing the states (StateBean) presents in the Database
     * @throws SQLException 
     */
    public ArrayList<StateBean> getStates() throws SQLException {

        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<StateBean> res = new ArrayList<>();

        ps = con.prepareStatement("SELECT id,name FROM states;");

        rs = ps.executeQuery();
        while (rs.next()) {
            StateBean state = new StateBean();
            state.setId(rs.getInt(1));
            state.setName(rs.getString(2));
            res.add(state);
        }
        
        ps.close();
        rs.close();
        
        return res;
    }
    
    public StateBean getState(int id) throws SQLException {
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        StateBean res = new StateBean();
        
        ps = con.prepareStatement("SELECT name FROM states WHERE id = ?;");
        ps.setInt(1, id);
        
        rs = ps.executeQuery();
        
        if (rs.next()) {
            res.setId(id);
            res.setName(rs.getString(1));
        }
        
        return res;
    }
}
