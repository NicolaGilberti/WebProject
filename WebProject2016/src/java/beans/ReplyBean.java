/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Timestamp;

/**
 * Represent the Replies database table
 * @author RiccardoUni
 */
public class ReplyBean implements java.io.Serializable{
    private int id;
    private String desc;
    private Timestamp data_creation;
    private int id_review;
    private int id_owner;
    private Timestamp data_validation;
    private boolean accepted;
    private int id_validator;
    private String nameOfIdOwner;

    public String getNameOfIdOwner() {
        return nameOfIdOwner;
    }

    public void setNameOfIdOwner(String nameOfIdOwner) {
        this.nameOfIdOwner = nameOfIdOwner;
    }
    public int getId_validator() {
        return id_validator;
    }

    public void setId_validator(int id_validator) {
        this.id_validator = id_validator;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Timestamp getData_creation() {
        return data_creation;
    }

    public void setData_creation(Timestamp data_creation) {
        this.data_creation = data_creation;
    }

    public int getId_review() {
        return id_review;
    }

    public void setId_review(int id_review) {
        this.id_review = id_review;
    }

    public int getId_owner() {
        return id_owner;
    }

    public void setId_owner(int id_owner) {
        this.id_owner = id_owner;
    }

    public Timestamp getData_validation() {
        return data_validation;
    }

    public void setData_validation(Timestamp data_validation) {
        this.data_validation = data_validation;
    }

    public boolean isAccepted() {
        return accepted;
    }

    public void setAccepted(boolean accepted) {
        this.accepted = accepted;
    }
    
}
