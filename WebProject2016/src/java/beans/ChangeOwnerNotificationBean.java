/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Marco
 */
public class ChangeOwnerNotificationBean implements java.io.Serializable {
    private int resid;
    private int usrid;
    private String resname;
    private String surname;
    private String nickname;
    private boolean accepted;

    public boolean isAccepted() {
        return accepted;
    }

    public void setAccepted(boolean accepted) {
        this.accepted = accepted;
    }
    

    public void setUsername(String username) {
        this.username = username;
    }
    private String username;

    public int getResid() {
        return resid;
    }

    public String getUsername() {
        return username;
    }

    public int getUsrid() {
        return usrid;
    }

    public void setResid(int resid) {
        this.resid = resid;
    }

    public void setUsrid(int usrid) {
        this.usrid = usrid;
    }

    public void setResname(String resname) {
        this.resname = resname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getResname() {
        return resname;
    }

    public String getSurname() {
        return surname;
    }

    public String getNickname() {
        return nickname;
    }
    
}
