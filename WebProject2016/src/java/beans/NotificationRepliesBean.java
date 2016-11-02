/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Date;
import java.sql.Timestamp;
/**
 *
 * @author Marco
 */
public class NotificationRepliesBean  {
   private int idrep;
   private  Date datarep;
   private Date datarew;
   private String replydescription;
   private String reviewdescription;
   private String customer;
   private String ristoratore;

    public void setIdrep(int idrep) {
        this.idrep = idrep;
    }

    public void setDatarep(Date datarep) {
        this.datarep = datarep;
    }

    public int getIdrep() {
        return idrep;
    }

    public Date getDatarep() {
        return datarep;
    }

    public Date getDatarew() {
        return datarew;
    }

    public String getReplydescription() {
        return replydescription;
    }

    public String getReviewdescription() {
        return reviewdescription;
    }

    public String getCustomer() {
        return customer;
    }

    public String getRistoratore() {
        return ristoratore;
    }

    public void setDatarew(Date datarew) {
        this.datarew = datarew;
    }

    public void setReplydescription(String replydescription) {
        this.replydescription = replydescription;
    }

    public void setReviewdescription(String reviewdescription) {
        this.reviewdescription = reviewdescription;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public void setRistoratore(String ristoratore) {
        this.ristoratore = ristoratore;
    }
    
}
