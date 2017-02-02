/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Genera il vero path dell'immagine in questione, correggendo la stringa in
 * modo che possa essere interpretata correttamente.
 * @param {type} photoname
 */
function setModalImage(photoname) {
    path = photoname.replace(/\r/g, "\\r");
    document.getElementById("photo-modal-img").src = path;
}