<%-- 
    Document   : showreplyconfirm
    Created on : 15-ott-2016, 19.47.36
    Author     : Marco
--%>
<%@page import="beans.NotificationRepliesBean"%>
<%@page import="beans.NotificationBean"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="header/headerFiles.jsp"/>
        <link rel="stylesheet" href="css/generic.css">
        <link rel="stylesheet" href="css/restaurantPage.css">
        <link rel="stylesheet" href="css/search_restaurant.css">
        <script src="js/notificationpagejs.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Cambio Propietario</title>
    </head>
    <body> 
        <jsp:include page = "header/header.jsp"/>
        <div class="container-fluid">

            <!--Ricerca della notifica cliccata in base all'id ricevuto-->
            <c:forEach var="notbean" items="${noty.chowner}">
                <c:if test="${notbean.usrid == param.idu && notbean.resid == param.idr}">
                    <c:set var="chowner" value="${notbean}" scope="session"></c:set>
                </c:if>
            </c:forEach>
            <div class="panel panel-default">
                <!-- Mostro i dati della notifica in un panel -->
                <div class="panel-body">
                    <h3><strong><c:out value="${chowner.nickname}"></c:out></strong></h3>
                        <div style="padding-left:50px">
                            <h3>vorrebbe diventare il proprietario di 
                                <strong><c:out value="${chowner.resname}"></c:out></strong>
                            al posto di <strong><c:out value="${chowner.resnickname}"></c:out></strong>
                            </h3>
                            <div style="text-align:right">
                                <div class="form-group">
                                    <!--setto i parametri per la modifica-->
                                <c:url value="ChangeOwnerRequestServlet" var="chownerURL">
                                    <c:param name="idu" value="${param.idu}" />
                                    <c:param name="idr" value="${param.idr}" />
                                </c:url>
                                <!-- 
                                    Form che manda alla servlet che si occuperà di apportare le modifiche nel database
                                    L'if serve per tenere nascosti i bottoni in caso in cui io acceda alla pagina passando per le "noticiche già accettate
                                -->
                                <c:if test="${param.sh == true}">  
                                    <form action="${chownerURL}" method="POST">
                                        <button type="submit"  name="button" class="btn btn-danger " value='d'>Rifiuta</button>
                                        <button type="submit"  name="button" class="btn btn-success" value='a'>Accetta</button>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
        </div>
    </body>
</html>
