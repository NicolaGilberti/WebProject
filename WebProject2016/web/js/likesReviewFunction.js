/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Funzione che serve ad invocare la servlet per aggiornare il like di quella specifica recensione
function like(revId, value, userId)
{

    $.ajax({
        type: 'POST',
        url: 'LikesHandler',
        data: {
            'revId': revId,
            'value': value,
            'userId': userId
        },
        success: function (msg) {
            if (msg === "OK")
            {
                var label = $("#" + revId + "-" + value);
                var text = label.text();
                text = Number(text) + 1;
                label.text(text);
            }
            else
            {
                alert("Hai gia votato, oppure c'è stato un errore.");
            }
        }
    });



}
