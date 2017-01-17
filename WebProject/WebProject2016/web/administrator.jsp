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
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/header.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
           
            var url = 'serevlets/NotificationUpdateJsp.java';

            $(document).ready(function() {

            $.ajaxSetup({ cache: true }); 
            
            setInterval(function() {
                $("#displayarea").load("NotificationUpdateJsp")}, 10000);
            });
 
        </script>
        <title>JSP Page</title>     
    </head>
    <body>
        <jsp:include page = "header/header.jsp"/>
        <div id="displayarea">
            <jsp:include page="notification.jsp"></jsp:include>
        </div>
         
    </body>
</html>
