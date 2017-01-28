<%-- 
    Document   : administrator
    Created on : 11-ott-2016, 11.12.58
    Author     : Marco
--%>
<%@page import="beans.NotificationRepliesBean"%>
<%@page import="beans.NotificationBean"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/notificationpagejs.js"></script>
        <link href="css/notifcation.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <jsp:include page="header/headerFiles.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            $(document).ready(function(){ 
                var param = ${param.query_result};
                var param_ins = ${param.insert_reply}
                    //parte del modal relativa all'admin
                    if(param > 0){
                         $('#myModal').modal();
                           
                       $('#myModal').on('hidden.bs.modal', function() {
                           param = 0;
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
        </script>
        <title>Notifiche</title>     
    </head>
    <body>
        <jsp:include page = "header/header.jsp"/>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h2 class="h2-title"> Benvenuto nella pagina delle notifiche <strong><c:out value="${user.nickname}"></c:out></strong> </h2>
                </div>
            </div>
                <!-- test which kind of user is and so i can show the right notification-->
                <div id="displayarea">
                    <c:if test="${user.type == 1}">
                            <jsp:include page="restaurantNotification.jsp"></jsp:include>
                    </c:if>
                    <c:if test="${user.type == 2}">
                            <jsp:include page="adminNotification.jsp"></jsp:include>
                    </c:if>
                </div>
            <!--area che verrà aggiornata dallo script-->
        </div>
        <!-- panel per la conferma dei cambiamenti -->    
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="myModalLabel">Modifica avvenuta!</h4>
                  <div style="text-align:right">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
        </div>
    </body>
</html>
