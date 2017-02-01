/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Timestamp;

/**
 * Represent the OpeningHours database table
 * @author RiccardoUni,Mirko
 */
public class OpeningHoursBean implements java.io.Serializable{

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOpenHS() {
        return openHS;
    }

    public void setOpenHS(String openHS) {
        this.openHS = openHS;
    }

    public String getCloseHS() {
        return closeHS;
    }

    public void setCloseHS(String closeHS) {
        this.closeHS = closeHS;
    }
    private int day;
    private String openHS;
    private String closeHS;
    
    //Usati?
    private Timestamp openH;
    private Timestamp closeH;

    OpeningHoursBean(int day, Timestamp openH, Timestamp closeH) {
        this.day = day;
        this.openH = openH;
        this.closeH = closeH;
    }

    public OpeningHoursBean(int id, int day, String openH, String closeH) {
        this.id = id;
        this.day = day;
        this.openHS = openH;
        this.closeHS = closeH;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public Timestamp getOpenH() {
        return openH;
    }

    public void setOpenH(Timestamp openH) {
        this.openH = openH;
    }

    public Timestamp getCloseH() {
        return closeH;
    }

    public void setCloseH(Timestamp closeH) {
        this.closeH = closeH;
    }

}
