/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;
import utils.NotificationReplies;

/**
 *
 * @author Marco
 */
public class NotificationBean implements java.io.Serializable {
   private  ArrayList replies;
   private ArrayList chowner;
   private ArrayList delphotos;
   
   public NotificationBean(){
       replies = new ArrayList();
       chowner = new ArrayList();
       delphotos = new ArrayList();
   }
   
   public void addReplies(NotificationReplies rep){
       replies.add(rep);
   }
   public void addChowner(NotificationReplies rep){
       replies.add(rep);
   }
    public void addDelPhotos(NotificationReplies rep){
       replies.add(rep);
   }
         
    
    
}
