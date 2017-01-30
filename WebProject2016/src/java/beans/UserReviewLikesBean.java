/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author RiccardoUni
 */
public class UserReviewLikesBean {
    private int idUser;
    private int idReview;
    private boolean likeDislike; /*!!!!! like=1, dislike=0 !!!!!*/
    private String dataCreation; 

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdReview() {
        return idReview;
    }

    public void setIdReview(int idReview) {
        this.idReview = idReview;
    }

    public boolean isLikeDislike() {
        return likeDislike;
    }

    public void setLikeDislike(boolean likeDislike) {
        this.likeDislike = likeDislike;
    }

    public String getDataCreation() {
        return dataCreation;
    }

    public void setDataCreation(String dataCreation) {
        this.dataCreation = dataCreation;
    }
    
}
