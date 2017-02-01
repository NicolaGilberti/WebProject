
<!DOCTYPE html-->
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <link rel="stylesheet" href="css/notification.css">
 <link rel="stylesheet" href="css/generic.css">

            <!-- 
                Pagina che utilizzo per mostrare le notifiche all'utente che è solo ristoratore.
            -->
            <ul class="nav nav-tabs" style="display: inline">
                 <li class="active"><a data-toggle="tab" href="#menu"><h3 class="h3-subtitle"><strong>Notifiche non visualizzate</strong></h3></a></li>
                 <li><a data-toggle="tab" href="#menu1"><h3 class="h3-subtitle"><strong>Notifiche visualizzate</strong></h3></a></li>
            </ul>
            <div class="tab-content">
                <!--
                    Tab per le notifiche non viste. Quando un ristoratore cliccka sulla notifica, prima passa per la servlet UpdateReviewServlet
                    che segna come vista la notifica e poi rimanda alla jsp showReview.jsp. Passo sempre alla pagina l'id della review,
                    cosi che posso mostrarla correttamente nella jsp.
                -->
                    <div id="menu" class="tab-pane fade in active">
                       <br>
                       <c:if test="${fn:length(resnoty.review_list) gt 0}">  
                           <c:forEach var="notbean" items="${resnoty.review_list}">
                               <c:if test="${notbean.view == false}">
                                   <c:url value="UpdateReviewServlet" var="reviewURL">
                                       <c:param name="id" value="${notbean.id}" />
                                   </c:url>
                                  <div class="list-group">
                                       <a href="${reviewURL}" class="list-group-item">
                                           <strong><c:out value="${notbean.nickname}"/></strong>
                                           ha scritto una recensione sul tuo ristorante.
                                     </a>
                                   </div>
                                </c:if>
                           </c:forEach>
                         </c:if>
                        <c:if test="${empty resnoty.review_list}">
                            <h2 class="h2-title"> Per ora non ci sono notifiche, torna più tardi</h2>
                        </c:if>
                    </div>
                <!-- 
                    Panel per le notifiche già viste dal ristoratore
                -->
                <div id="menu1" class="tab-pane fade">
                       <br>
                       <c:if test="${fn:length(resnoty.review_list) gt 0}">  
                           <c:forEach var="notbean" items="${resnoty.review_list}">
                               <c:if test="${notbean.view == true}">
                                   <!-- 
                                        In questo caso ogni volta che un ristoratore clicca su una notifica, viene rimandato direttamente alla jsp perchè
                                        la notifica è già stata aggiornata.    
                                    -->
                                   <c:url value="showreview.jsp" var="reviewURL">
                                       <c:param name="id" value="${notbean.id}" />
                                   </c:url>
                                  <div class="list-group">
                                       <a href="${reviewURL}" class="list-group-item">
                                           <strong><c:out value="${notbean.nickname}"/></strong>
                                           ha scritto una recensione sul tuo ristorante.
                                     </a>
                                   </div>
                                </c:if>
                           </c:forEach>
                         </c:if>
                        <c:if test="${empty resnoty.review_list}">
                            <h2 class="h2-title"> Per ora non ci sono notifiche, torna più tardi</h2>
                        </c:if>
                </div>
            </div>
