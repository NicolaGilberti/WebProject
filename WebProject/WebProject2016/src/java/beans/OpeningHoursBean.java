/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Timestamp;

/**
 *
 * @author RiccardoUni
 */
public class OpeningHoursBean {
    private int day;
    private Timestamp openH;
    private Timestamp closeH;
    
    OpeningHoursBean(int day, Timestamp openH, Timestamp closeH) {
        this.day = day;
        this.openH = openH;
        this.closeH = closeH;
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
