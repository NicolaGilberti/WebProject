/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author David
 */


/* Bella ragazzi, per utilizzare questa classe come bean usate questo tag nel JSP/HTML/dove vi pare <jsp:useBean id="userBean" class="utils.UserBean"/>

*/
public class UserBean implements java.io.Serializable{
   private int id;
   private String name;
   private String surname;
   private String nickname;
   private String email;
   private String password;
   private int type;
   private String last_log;

    public UserBean() {
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }
    
    public void setId(int id){
        this.id = id;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setLast_log(String last_log) {
        this.last_log = last_log;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getNickname() {
        return nickname;
    }
    
     public int getId(){
        return id;
   }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public int getType() {
        return type;
    }

    public String getLast_log() {
        return last_log;
    }

}
