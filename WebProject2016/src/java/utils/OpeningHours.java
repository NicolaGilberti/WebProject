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
    private final ArrayList<String> DAYS = new ArrayList<>(Arrays.asList("lunedì", "martedì", "mercoledì","giovedì","venerdì","sabato","domenica"));
    private ArrayList<Integer> openDays = new ArrayList<Integer>();
    private ArrayList<Time> openingHour = new ArrayList<Time>();
    private ArrayList<Time> closingHour = new ArrayList<Time>();
    
    
    public OpeningHours() {
    }

    public ArrayList<String> toArrayListString() {
        String tmp = "";
        ArrayList<String> orari = new ArrayList<String>();
        ArrayList<Integer> temp = new ArrayList<Integer>();
        for(int i=0;i<openDays.size();i++){
            temp.add(1);
        }
        int j=0;
        for (int i=openDays.size()-1; i>=0; i--) {
            j=i-1;
            if(j>=0 && (openDays.get(i)==(openDays.get(j)+1)) && (openingHour.get(i).equals(openingHour.get(j))) && (closingHour.get(i).equals(closingHour.get(j)))){
                temp.set(j, 0);
            }
        }
        boolean flag = true,first=true;
        for(int i=0;i<temp.size();i++){
            if(flag==true || i==temp.size()-1 || temp.get(i)==1){
                if(temp.get(i)==1 && flag){
                    //tmp = tmp.concat(" / ");
                    orari.add(tmp);
                    tmp="";
                }
                if(temp.get(i)==1){
                    flag=true;
                    tmp = tmp.concat(DAYS.get(openDays.get(i)-1)
                                    + " : "+ openingHour.get(i).toString().substring(0, 5)
                                    + " - " + closingHour.get(i).toString().substring(0, 5)
                    );
                }
                if(temp.get(i)==0){
                    flag=false;
                    if(first){
                        first=false;
                    }
                    else{
                        //tmp = tmp.concat(" / ");
                        orari.add(tmp);
                        tmp="";
                    }
                    tmp = tmp.concat(
                                    DAYS.get(openDays.get(i)-1)
                                    + " - "
                    );
                }
            }
        }
        orari.add(tmp);
        return orari;
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
