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

        <link rel="stylesheet" href="css/generic.css">
        <link rel="stylesheet" href="css/notifcation.css">
        <link rel="stylesheet" href="css/restaurantPage.css">
        <link rel="stylesheet" href="css/search_restaurant.css">
        <jsp:include page="header/headerFiles.jsp" />
        <script src="js/notificationpagejs.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Commento</title>
    </head>
    <body> 
        <jsp:include page = "header/header.jsp"/>
        <div class="container-fluid">
            <!--Cerco la notifica che deve essere mostrata-->
            <c:forEach var="notbean" items="${resnoty.review_list}">
                <c:if test="${notbean.id == param.id}">
                    <c:set var="review" value="${notbean}" scope="session"></c:set>
                </c:if>
            </c:forEach>
            <!--Mostro la notifica -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 style="font: bold;"><c:out value="${review.name}"/> 
                        <div>
                            <small class="text-muted">
                                <c:out value='${review.nickname}'/> 
                                <wbr>|<wbr>
                                <c:out value="${review.data_creation}"/> 
                                <div class="col-stars">
                                    <%-- stelle piene --%>
                                    <c:forEach var="i" begin="1" end="${review.global_value}">
                                        <span class="glyphicon glyphicon-star"></span>
                                    </c:forEach>
                                    <%-- stelle vuote --%>
                                    <c:forEach var="i" begin="${review.global_value + 1}" end="5">
                                        <span class="glyphicon glyphicon-star-empty"></span>
                                    </c:forEach>
                                </div>
                                <div>
                                    CIBO: <c:out value="${review.food}" /> 
                                    |
                                    QUALITA'/PREZZO: <c:out value="${review.value_for_money}" />
                                    |
                                    ATMOSFERA: <c:out value="${review.atmosphere}" />
                                    |
                                    SERVIZIO: <c:out value="${review.service}" />
                                </div>
                            </small>
                        </div>   
                    </h4>
                </div>
                <!-- Inserisco la descrizione -->
                <div class="panel-body">
                    <c:out value="${review.description}"></c:out>
                        <br>
                        <br>
                    <c:if test="${review.photo_name != ''}">
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <img src="${review.photo_name}">
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
            <!--Form per inserire la risposta e/o segnalare la foto -->    
            <div class="form-group">
                <c:url value="InsertReportImageServlet" var="reviewURL">
                    <c:param name="id_photo" value="${review.id_photo}"/>
                    <c:param name="id" value="${review.id_creator}"/>
                </c:url>
                <form action="${reviewURL}" method="POST">
                    <button type="button"  id="replybutton" name="button" class="btn btn-success">Rispondi</button>
                    <c:if test="${review.photo_name != ''}">
                        <button type="submit"  name="button" class="btn btn-success">Segnala foto</button>
                    </c:if>
                </form>
            </div>  
            <!--
                Form per inserire la risposta. All'inizio questo form sarà nascosto, 
                e una volta che il ristoratore clicca sul bottone il form sarà mostrato e sarà quindi possibile inserire una review e
                inoltrarla all'admin per far si che essa venga accettata e resa disponibile
            -->
            <form action="InsertReply" method="POST" id="replytext" style="display:none" >
                <div class="form-group">
                    <label for="textarea">Inserisci qui la risposta al commento</label>
                    <textarea name="descriptionarea" class="form-control" required></textarea>
                </div>
                <div class="form-group">
                    <button type="submit"  name="button" class="btn btn-success" value='a'>Invia</button>
                </div>
            </form>
        </div>
        <!-- 
            Panel che utilizzo per fornire un feedback al ristoratore quando chiede di reportare una foto
            Gli verrà notificato se la richiesta è andata a buon fine oppure no.
        -->
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
