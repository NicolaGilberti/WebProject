/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comparators;

import beans.RestaurantSearch;
import java.util.Comparator;

/**
 *
 * @author MirkoPortatile
 */
public class RestaurantSearchMaxPriceComparator implements Comparator<RestaurantSearch> {

    public int compare(RestaurantSearch rest1, RestaurantSearch rest2) {
        return (int) (rest1.getMaxPrice() - rest2.getMaxPrice());
    }

}