/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author nicol
 */
public class AlertBean implements java.io.Serializable {
    
    private String title;
    private String description;
    
    // int type
    // -1 --> unknown
    //  0 --> success
    //  1 --> error
    private int type;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
    
    public AlertBean() {
        title = "unknown";
        description = "unknown";
        type = -1; //unknown
    }
    
    public AlertBean(String title, String description, int type) {
        this.title = title;
        this.description = description;
        this.type = type;
    }
    
}
