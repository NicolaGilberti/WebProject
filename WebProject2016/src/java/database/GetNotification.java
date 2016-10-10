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
import java.util.ArrayList;

/**
 *
 * @author Marco
 */
public class GetNotification {
    ManagerDB db;
    Connection con;
    
    public GetNotification(){
        db= new ManagerDB();
        con = db.getConnection();
    }
    
    public ArrayList getAllNotification() throws SQLException{
        ArrayList temp = new ArrayList();
        //mi creo un array con le replies
        //mi serve commento user 
        PreparedStatement replies = con.prepareStatement("SELECT t1.data_creation AS datarep,t2.data_creation AS revdata, t1.description AS des1, t2.description, users.nickname,users.id FROM (replies AS t1 INNER JOIN reviews AS t2 ON (t1.id_review = t2.id)) INNER JOIN users ON (t2.id_creator = users.id OR t1.id_owner = users.id) WHERE t1.id_validator IS NULL");
        ResultSet rs = replies.executeQuery();
        temp.add(rs);
        
        PreparedStatement cown = con.prepareStatement("SELECT t2.name AS resname,t3.name AS usrname,t3.surname,t3.nickname FROM (request_changes_owner AS t1 INNER JOIN restaurants AS t2 ON (t1.id_restaurant =t2.id)) INNER JOIN users AS t3 ON (t1.id_user = t3.id OR t2.id_owner = t3.id) WHERE t1.accepted IS NULL;");
        rs = cown.executeQuery();
        temp.add(rs);
        
        PreparedStatement dphoto = con.prepareStatement("SELECT t2.name AS resname,t3.name AS photoname,t3.surname,t3.nickname FROM (request_delete_photos AS t1 INNER JOIN photos AS t2 ON (t1.id_photo = t2.id)) INNER JOIN users AS t3 ON (t1.id_user = t3.id) WHERE t1.accepted IS NULL;");
        rs = dphoto.executeQuery();
        temp.add(rs);
        
        
        return temp;
    }
    
}
