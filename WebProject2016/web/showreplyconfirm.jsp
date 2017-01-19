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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="idrepl" value="${param.id}"></c:set>
        
        <!--Search that i used to find the reply that was clicked-->
        <c:forEach var="notbean" items="${noty.replies}">
            <c:if test="${notbean.idrep == idrepl}">
                <c:set var="repliestoconfirm" value="${notbean}"></c:set>
            </c:if>
         </c:forEach>
        
        
        
    </body>
</html>
