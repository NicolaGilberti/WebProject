/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Funzione di aiuto, usata per ottenere il valore dei parametri nell'url.
function getParameterByName(name, url) {
    if (!url)
        url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
    if (!results)
        return null;
    if (!results[2])
        return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}



 $(document).ready(function() {
            var flag = 1;
            $.ajaxSetup({ cache: true }); 
            setInterval(function() {
                $("#displayarea").load("SearchNotification?flag=1")}, 30000);
                var param = getParameterByName("query_result");
                var param_ins = getParameterByName("insert_reply");
                    //parte del modal relativa all'admin
                    console.log(param);
                    if(param > 0){
                       $('#myModal').modal();
                       $('#myModal').on('hidden.bs.modal', function() {
                           param_ins = 0;
                          });
                    }
                    else if(param == 0 ){
                        $("#myModalLabel").html("Modifica non avvenuta");
                        $('#myModal').modal();
                    }
                 
                 // modal del ristoratore
                 
                    if(param_ins > 0 ){
                       
                       $('#myModal').modal();
                       $("#myModalLabel").html("La sua risposta è stata inoltrata ad un amministratore. La sua risposta sarà visibile una volta accettata dall'amministratore.");
                       $('#myModal').on('hidden.bs.modal', function() {
                           param_ins = 0;
                          });
                    }
                    else if(param_ins == 0 ){
                        $("#myModalLabel").html("Modifica non avvenuta");
                        $("#myModalLabel").html("Si e' verificato un erroe. La sua risposta non è stat inoltrata.");
                        $('#myModal').modal();
                    }
                    
            });

  
 