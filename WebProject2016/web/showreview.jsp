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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <jsp:include page="header/headerFiles.jsp" />
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/generic.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> 
        <jsp:include page = "header/header.jsp"/>
        <div class="container-fluid">

            <!--Search that i used to find the reply that was clicked-->
            <c:forEach var="notbean" items="${resnoty.review_list}">
                <c:if test="${notbean.id == param.id}">
                    <c:set var="review" value="${notbean}"></c:set>
                </c:if>
            </c:forEach>
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
                <div class="panel-body">
                    <c:out value="${review.description}"></c:out>
                    </div>
                </div>
        </div>
    </body>
</html>
