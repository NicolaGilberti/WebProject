/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comparators;

import beans.Cuisine;
import java.util.Comparator;

/**
 *
 * @author MirkoPortatile
 */
public class CuisineAlphabeticalComparator implements Comparator<Cuisine> {

    public int compare(Cuisine cuisine1, Cuisine cuisine2) {
        return cuisine1.getName().compareTo(cuisine2.getName());
    }
}
