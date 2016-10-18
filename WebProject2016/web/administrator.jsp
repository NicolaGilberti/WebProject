<%-- 
    Document   : administrator
    Created on : 11-ott-2016, 11.12.58
    Author     : Marco
--%>
<%@page import="utils.NotificationReplies"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>     
        <script type="text/javascript">
           
            var url = 'serevlet/SearchNotification.java';

            $(document).ready(function() {

            $.ajaxSetup({ cache: true }); 
            
            setInterval(function() {
                $("#displayarea").load("SearchNotification")}, 60000);
            });
 
        </script>
    </head>
    <body>
        <div id="displayarea">
        <jsp:include page="header.jsp"/>
        <div class="container-fluid" >
           <div class="panel panel-default">
                <div class="panel-body">
                    <h2 style="display:inline"> Benvenuto <strong><c:out value="${user.nickname}"></c:out></strong></h2>
                </div>
              </div>
            <ul class="nav nav-tabs" style="display: inline">
                 <li class="active"><a data-toggle="tab" href="#home"><h5><strong>Replies To Confirm</strong> <span class="badge">${fn:length(noty.replies)}</span></h5></a></li>
                  <li><a data-toggle="tab" href="#menu1"><h5><strong>Change owner Request </strong><span class="badge">${fn:length(noty.chowner)}</span></h5></a></li>
                  <li><a data-toggle="tab" href="#menu2"><h5><strong>Delete Photo Request </strong><span class="badge">${fn:length(noty.delphotos)}</span></h5></a></li>
             </ul>
            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <p>
                        <c:if test="${fn:length(noty.replies) gt 0}">
                            <c:forEach var="notbean" items="${noty.replies}">
                                   <div class="list-group">
                                       <a href="showreplyconfirm.jsp?notbean=${notbean.idrep}" class="list-group-item">
                                          <strong><c:out value="${notbean.ristoratore}"/></strong>
                                          Ha risposto ad un commento di <strong><c:out value="${notbean.customer}"/></strong> sul proprio ristorante.
                                    </a>
                                  </div>
                             </c:forEach>
                        </c:if>
                         <c:if test="${empty noty.replies}">
                            <h1> Per ora non ci sono notifiche, torna più tardi</h1>
                         </c:if>
                    </p>
                </div>
                <div id="menu1" class="tab-pane fade">
                    <p>
                        <c:if test="${fn:length(noty.chowner) gt 0}">   
                           <c:forEach var="notbean" items="${noty.chowner}">
                                 <div class="list-group">
                                  <a href="#" class="list-group-item">
                                        <strong><c:out value="${notbean.nickname}"/></strong>
                                        ha richiesto di diventare il proprietario di <strong><c:out value="${notbean.resname}"/></strong>.
                                        <button type="button" class="btn btn-lg" aria-label="Left Align" style="float:right" value="Decline"></button>
                                  </a>
                                </div>
                           </c:forEach>
                         </c:if>
                        <c:if test="${empty noty.chowner}">
                            <h1> Per ora non ci sono notifiche, torna più tardi</h1>
                        </c:if>
                     </p>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <p>
                        <c:if test="${fn:length(noty.delphotos) gt 0}">
                          <c:forEach var="notbean" items="${noty.delphotos}">
                                <div class="list-group">
                                 <a href="#" class="list-group-item">
                                       <strong><c:out value="${notbean.ristoratore}"/></strong>
                                       Ha risposto ad un commento di <strong><c:out value="${notbean.customer}"/></strong> sul proprio ristorante.
                                 </a>
                               </div>
                          </c:forEach>
                         </c:if>
                         <c:if test="${empty noty.delphotos}">
                             <h1> Per ora non ci sono notifiche, torna più tardi</h1>
                         </c:if>
                    <p>
                </div>
              </div>
              <div class="navbar">
                <!--footer-->
                <footer>
                    <hr>
                    <p>Realizzato da Mirko, Nicola, David, Marco e Riccardo.</p>
                </footer>
            </div>
        </div>
        </div>
         
    </body>
</html>
