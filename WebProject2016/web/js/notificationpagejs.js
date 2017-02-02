/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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


 $(document).ready(function(){
            $.ajaxSetup({ cache: true }); 
            setInterval(function() {
                $("#displayarea").load("SearchNotification?flag=1")}, 30000);
                
                var param = getParameterByName("query_result");
                var param_ins = getParameterByName("insert_reply");
                //parte del modal relativa all'admin
                if (param > 0) {
                    $('#myModal').modal();

                    $('#myModal').on('hidden.bs.modal', function () {
                          var url = removeParam("query_result",document.URL);
                          window.history.pushState('',document.title,url);       
                    });
                } else if (param == 0) {
                    $("#myModalLabel").html("Modifica non avvenuta");
                    $('#myModal').modal();
                    $('#myModal').on('hidden.bs.modal', function () {
                          var url = removeParam("query_result",document.URL);
                          window.history.pushState('',document.title,url);       
                    });
                }

                // modal del ristoratore

                if (param_ins > 0) {

                    $('#myModal').modal();
                    $("#myModalLabel").html("La sua richiesta è stata inoltrata ad un amministratore. La sua risposta sarà visibile una volta accettata dall'amministratore.");
                    $('#myModal').on('hidden.bs.modal', function () {
                          var url = removeParam("insert_reply",document.URL);
                          window.history.pushState('',document.title,url);       
                     });
                } else if (param_ins == 0) {
                    $("#myModalLabel").html("Questa richiesta è già stata inoltrata e quindi è impossibile inoltrarne una nuova.");
                    $('#myModal').modal();
                     $('#myModal').on('hidden.bs.modal', function () {
                          var url = removeParam("insert_reply",document.URL);
                          window.history.pushState('',document.title,url);       
                    });
                    
                }
                
                $("#replybutton").click(function(){
                     $("#replytext").show();
                });

            });
  
 /* funzione per eliminare i parametri dalla get*/
 function removeParam(key, sourceURL) {
    var rtn = sourceURL.split("?")[0],
        param,
        params_arr = [],
        queryString = (sourceURL.indexOf("?") !== -1) ? sourceURL.split("?")[1] : "";
    if (queryString !== "") {
        params_arr = queryString.split("&");
        for (var i = params_arr.length - 1; i >= 0; i -= 1) {
            param = params_arr[i].split("=")[0];
            if (param === key) {
                params_arr.splice(i, 1);
            }
        }
        rtn = rtn + "?" + params_arr.join("&");
    }
    return rtn;
}