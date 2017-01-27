/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function checkforms(){
    
    var cuisine = document.getElementsByName('cuisine');
    var openinghour = document.getElementsByName('openinghour');
    
    var hasCheckedcuisine = false;
    var hasCheckedhours = false;
    
    var hasChecked = false;
    
    for (var i = 0; i < cuisine.length; i++) {
        if (cuisine[i].checked) {
            hasCheckedcuisine = true;
            break;
        }
    }
    
    for (var i = 0; i < openinghour.length; i++) {
        if (openinghour[i].checked) {
            hasCheckedhours = true;
            break;
        }
    } 
    if (!hasCheckedcuisine) {
        alert("Seleziona almeno una tipologia di cucina");
        return false;
    }

    if (!hasCheckedhours) {
        alert("Seleziona un orario");
        return false;
    }
    
   if (hasCheckedcuisine && hasCheckedhours){
       return true;
   }

}
