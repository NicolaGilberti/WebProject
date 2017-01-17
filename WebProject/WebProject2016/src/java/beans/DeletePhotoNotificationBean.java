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
public class DeletePhotoNotificationBean {
    private int usrid;
    private int idphoto;
    private String resname;
    private String photoname;
    private String nickname;

    public int getUsrid() {
        return usrid;
    }

    public int getIdphoto() {
        return idphoto;
    }

    public String getResname() {
        return resname;
    }

    public void setUsrid(int usrid) {
        this.usrid = usrid;
    }

    public void setIdphoto(int idphoto) {
        this.idphoto = idphoto;
    }

    public void setResname(String resname) {
        this.resname = resname;
    }

    public void setPhotoname(String photoname) {
        this.photoname = photoname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPhotoname() {
        return photoname;
    }

    public String getNickname() {
        return nickname;
    }
    
    
}
