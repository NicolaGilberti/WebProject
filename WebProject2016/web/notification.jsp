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
        <jsp:include page="header/headerFiles.jsp"/>
        <link href="css/notifcation.css" rel="stylesheet">
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script type="text/javascript" src="js/notificationpagejs.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Le notifiche </title>
    </head>
    <body>
        <!--
            Pagina esterna dove rimando sia ristoratore sia amministratore quando si loggano.
            In base al loro user type importo la jsp adminNotification.jsp oppure restaurantNotificationjsp
        -->
        <jsp:include page = "header/header.jsp"/>
        <div class="container-fluid">
            <div class="panel-body">
                <h1 class="notification-title">Le Notifiche </h1>
            </div>
            <hr class="style15">
            <!-- test which kind of user is and so i can show the right notification-->
            <div id="displayarea" class='container'>
                <c:if test="${user.type == 1}">
                    <jsp:include page="restaurantNotification.jsp"></jsp:include>
                </c:if>
                <c:if test="${user.type == 2}">
                    <jsp:include page="adminNotification.jsp"></jsp:include>
                </c:if>
            </div>
            <!--area che verrà aggiornata dallo script-->
        
        <!-- 
            panel per la conferma dei cambiamenti. Ogni volta che eseguo una query mando un feedback all'user
            in base alla riuscita o pure no della modifica che voleva apportare.
        -->    
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn btn-yellow" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Modifica avvenuta!</h4>
                        <div style="text-align:right">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
