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
        <link href="css/notifcation.css" rel="stylesheet">
        <link rel="stylesheet" href="css/notification.css">
        <link rel="stylesheet" href="css/genericsnotification.css">
        <jsp:include page="header/headerFiles.jsp"/>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>    
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <jsp:include page = "header/header.jsp"/>
        <div class="container-fluid">
            <!--Search that i used to find the reply that was clicked-->
            <c:forEach var="notbean" items="${noty.delphotos}">
                <c:if test="${notbean.idphoto == param.id}">
                    <c:set var="deletephoto" value="${notbean}"></c:set>
                </c:if>
            </c:forEach>
            <h1>Questa fotografia è opportuna?</h1>
            <hr class="style15">
            <!-- test which kind of user is and so i can show the right notification-->
            <!--area che verrà aggiornata dallo script-->
            <div class="row" style="text-align: center">
                <div class=" col-sx-8 col-md-8" >
                        <img src="${deletephoto.photoname}">
                </div>
            </div>
            <br>
            <h4>Premendo su <strong>SI</strong> la fotografia sarà mostrata al pubblico, premendo su <strong>NO</strong> la fotograifa non sarà più visibile.</h4> 
        </div>
        <!-- panel per la conferma dei cambiamenti -->  
        <div style="text-align:right">
            <div class="form-group">
                <!--Setting get parameter (id of reply) using jstl -->
                <c:url value="DeletePhotoRequest" var="deletephotoURL">
                    <c:param name="id" value="${param.id}"/>
                </c:url>
                <form action="${deletephotoURL}" method="POST">
                    <button type="submit"  name="button" class="btn btn-danger " value='n'>No</button>
                    <button type="submit"  name="button" class="btn btn-success" value='s'>Si</button>
                </form>
            </div>
        </div>
    </body>
</html>
