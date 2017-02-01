/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.OpeningHoursBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * This class is used to manage the Opening Hours database table and the tables connected to it.
 * @author Mirko, RiccardoUni
 */
public class OpeningHoursDAO {

    private ManagerDB db = null;
    private Connection con = null;

    /**
     * connect the DB
     */
    public OpeningHoursDAO() {
        db = new ManagerDB();
        con = db.getConnection();
    }
/**
 * 
 * @return An arrayList containing the opening hours
 * @throws SQLException 
 */
    public ArrayList<OpeningHoursBean> getOpeningHours() throws SQLException {

        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<OpeningHoursBean> res = new ArrayList<>();

        ps = con.prepareStatement("SELECT id,day_of_the_week,start_hour,end_hour FROM opening_hours_range;");

        rs = ps.executeQuery();
        while (rs.next()) {
            OpeningHoursBean o = new OpeningHoursBean(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));

            res.add(o);
        }

        return res;
    }
}
