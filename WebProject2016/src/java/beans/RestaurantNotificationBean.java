/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;

/**
 *
 * @author Marco
 */
public class RestaurantNotificationBean {
    private ArrayList<ReviewBean> review_list = new ArrayList<ReviewBean>();

    public ArrayList<ReviewBean> getReview_list() {
        return review_list;
    }

    public void setReview_list(ArrayList<ReviewBean> review_list) {
        this.review_list = review_list;
    }
    
    public void addReviewBean(ReviewBean rb){
        this.review_list.add(rb);
    }
    
    public ReviewBean getReviewBean(int i){
        return this.review_list.get(i);
    }
    public int size(){
        return review_list.size();
    }
}
