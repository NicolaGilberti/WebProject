/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import beans.OpeningHoursBean;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.AbstractMap.SimpleEntry;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author RiccardoUni
 */
public class OpeningHours {
    private final ArrayList<String> DAYS = new ArrayList<>(Arrays.asList("lun", "mar", "mer","gio","ven","sab","dom"));
    private ArrayList<Integer> openDays = new ArrayList<Integer>();
    private ArrayList<Time> openingHour = new ArrayList<Time>();
    private ArrayList<Time> closingHour = new ArrayList<Time>();
    
    
    public OpeningHours() {
    }

    @Override
    public String toString() {
        String tmp = "";
        for (int i=0; i<openDays.size(); i++) {
            tmp = tmp.concat(
                    DAYS.get(openDays.get(i) -1 ) + 
                    " : " + openingHour.get(i).toString().substring(0, 5) + 
                    " - " + closingHour.get(i).toString().substring(0, 5) +  " \n ");
        }
        return tmp;
    }
    
    public ArrayList<Integer> getOpenDays() {
        return openDays;
    }

    public void setOpenDays(Integer openDays) {
        this.openDays.add(openDays);
    }

    public ArrayList<Time> getOpeningHour() {
        return openingHour;
    }

    public void setOpeningHour(Time openingHour) {
        this.openingHour.add(openingHour);
    }

    public ArrayList<Time> getClosingHour() {
        return closingHour;
    }

    public void setClosingHour(Time closingHour) {
        this.closingHour.add(closingHour);
    }

}
