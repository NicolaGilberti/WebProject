/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comparators;

import beans.CuisineBean;
import java.util.Comparator;

/**
 *
 * @author MirkoPortatile
 */
public class CuisineAlphabeticalComparator implements Comparator<CuisineBean> {

    public int compare(CuisineBean cuisine1, CuisineBean cuisine2) {
        return cuisine1.getName().compareTo(cuisine2.getName());
    }
}
