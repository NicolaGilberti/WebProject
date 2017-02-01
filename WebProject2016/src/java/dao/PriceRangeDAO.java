/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.PriceRangeBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * This class is used to manage the PriceRange database table and the tables connected to it.
 * @author Mirko
 */
public class PriceRangeDAO {

    private ManagerDB db = null;
    private Connection con = null;

    /**
     * connect the DB
     */
    public PriceRangeDAO() {
        db = new ManagerDB();
        con = db.getConnection();
    }
/**
 * 
 * @return an arrayList containings all the price ranges
 * @throws SQLException 
 */
    public ArrayList<PriceRangeBean> getPriceRanges() throws SQLException {

        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<PriceRangeBean> res = new ArrayList<>();

        ps = con.prepareStatement("SELECT id,min_value,max_value FROM price_range;");

        rs = ps.executeQuery();
        while (rs.next()) {
            PriceRangeBean o = new PriceRangeBean();
            o.setId(rs.getInt(1));
            o.setMin_value(rs.getDouble(2));
            o.setMax_value(rs.getDouble(3));
            res.add(o);
        }

        return res;
    }
}
