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
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <jsp:include page="header/headerFiles.jsp" />
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/generic.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            $(document).ready(function(){ 
                var param = ${param.query_result};
                    if(param != 0){
                         $('#myModal').modal();
                        }   
                       $('#myModal').on('hidden.bs.modal', function() {
                           param = 0;
                          });
            });
        </script>
        <title>JSP Page</title>     
    </head>
    <body>
        <jsp:include page = "header/header.jsp"/>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h2> Benvenuto <strong><c:out value="${user.nickname}"></c:out></strong> </h2>
                </div>
            </div>
                <!-- test which kind of user is and so i can show the right notification-->
               <!-- <c:if test="${sessionScope.admin == 1}">
                    <c:set var="path"  value="resturantNotification.jsp"></c:set>
                </c:if>
                <c:if test="${sessionScope.admin == 2}">
                    <c:set var="path"  value="adminNotification.jsp"></c:set>
                </c:if>-->
            <!--area che verrà aggiornata dallo script-->
            <div id="displayarea">
                <jsp:include page="adminNotification.jsp"></jsp:include>
            </div>
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
