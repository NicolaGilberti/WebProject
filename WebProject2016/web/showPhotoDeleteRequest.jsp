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
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>    
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/notifcation.css" rel="stylesheet">
        <link rel="stylesheet" href="css/generic.css">
        <title>Elimina foto</title>
    </head>
    <body>
        <!--Ricerca della notifica cliccata in base all'id ricevuto-->
        <c:forEach var="notbean" items="${noty.delphotos}">
            <c:if test="${notbean.idphoto == param.id}">
                <c:set var="deletephoto" value="${notbean}"></c:set>
            </c:if>
        </c:forEach>
        <jsp:include page = "header/header.jsp"/>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <h1>Questa fotografia e' opportuna?</h1>
                </div>
            </div>
            <hr class="style15">
            <!-- 
                qui mostro la foto con i due bottoni, dove un admin può scegliere se secondo lui l'immagine
                è opportuna o non può essere mostrata al pubblico
            -->
            <div class="row" style="text-align:center">
                <div class="col-lg-12 col-sx-12 col-sm-12 col-md-12" >
                    <img src="${deletephoto.photoname}">
                </div>
            </div>
            <br>
            <div class="row" style="text-align:center">
                <h4>Questa è la fotografia del ristorante <strong><c:out value="${deletephoto.resname}"></c:out></strong>
                    postata da <strong><c:out value="${deletephoto.phname}"></c:out></strong>
                </h4> 
                <h4>Premendo su <strong>SI</strong> la fotografia rimarrà visibile, premendo su 
                    <strong>NO</strong> la fotografia verrà rimossa.</h4> 
            </div>  
            <div class="row" style="text-align:center">
                <div class="col-lg-12 col-sx-12 col-sm-12 col-md-12" >
                    <c:url value="DeletePhotoRequest" var="deletephotoURL">
                        <c:param name="id" value="${param.id}"/>
                    </c:url>
                    <!-- 
                        Form che manda alla servlet che si occuperà di apportare le modifiche nel database
                        L'if serve per tenere nascosti i bottoni in caso in cui io acceda alla pagina passando per le "noticiche già accettate
                    -->
                    <form action="${deletephotoURL}" method="POST">
                        <div class="form-group">
                            <c:if test="${param.sh == true}">
                                <!--Setting get parameter (id of the photo that i have to delete  or not) using jstl -->
                                <button type="submit"  name="button" class="btn btn-danger" value='n'>No</button>
                                <button type="submit"  name="button" class="btn btn-success" value='s'>Si</button>
                            </c:if>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
