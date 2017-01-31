<%-- 
    Document   : notification
    Created on : 18-gen-2017, 0.39.15
    Author     : Marco
--%>


<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <link rel="stylesheet" href="css/notification.css">
 <link rel="stylesheet" href="css/generic.css">
 

<!DOCTYPE html>

        <!-- header -->
        <div class="col-lg-6 col-sm-12 col-xs-12 col-md-6">
            <ul class="nav nav-tabs">
                 <li class="active"><a data-toggle="nav nav-tabs" href="#home"><strong class="h3-subtitle">Risposte da confermare</strong></a></li>
                 <li><a data-toggle="tab" href="#menu1"><strong class="h3-subtitle">Richiesta di cambiamento proprietario </strong></h3></a></li>
                 <li><a data-toggle="tab" href="#menu2"><strong class="h3-subtitle">Elimina richiesta foto </strong></h3></a></li>
                 <li><a data-toggle="tab" href="#menu4"><strong  class="h3-subtitle">Notifiche ristorante </strong></h3></a></li>
                 <li><a data-toggle="tab" href="#menu5"><strong class="h3-subtitle">Notifiche ristorante già viste</strong></h3></a></li>
                 <li><a data-toggle="tab" href="#menu3"><strong class="h3-subtitle">Notifiche accettate </strong></h3></a></li>
            </ul>
        </div>
        <div class="col-sm-12 col-xs-12">
            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <p>
                        <c:if test="${fn:length(noty.replies) gt 0}">
                            <c:forEach var="replybean" items="${noty.replies}">
                                <c:if test="${replybean.accepted == false}">
                                    <div class="list-group">
                                        <c:url value="showreplyconfirm.jsp" var="repliesURL">
                                             <c:param name="id" value="${replybean.idrep}" /> --%>
                                        </c:url>
                                        <a href="${repliesURL}" class="list-group-item">
                                            <strong><c:out value="${replybean.ristoratore}"/></strong>
                                            Ha risposto ad un commento di <strong><c:out value="${replybean.customer}"/></strong> sul proprio ristorante.
                                        </a>
                                    </div>
                                </c:if>
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
                                <c:if test="${notbean.accepted == ''}">
                                    <div class="list-group">
                                    <c:url value="showchangeowner.jsp" var="chownerURL">
                                             <c:param name="idu" value="${notbean.usrid}" />
                                             <c:param name="idr" value="${notbean.resid}" />
                                    </c:url>
                                    <a href="${chownerURL}" class="list-group-item">
                                        <strong><c:out value="${notbean.nickname}"/></strong>
                                        ha reclamato il ristorante <strong><c:out value="${notbean.resname}"/></strong> sul proprio ristorante.
                                    </a>
                                    </div>
                                </c:if>
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
                                <c:if test="${notbean.accepted == false}">
                                <c:url value="showPhotoDeleteRequest.jsp" var="photoURL">
                                    <c:param name="id" value="${notbean.idphoto}" />
                                </c:url>
                                    <div class="list-group">
                                     <a href="${photoURL}" class="list-group-item">
                                         E'stata segnalata una foto di 
                                           <strong><c:out value="${notbean.nickname}"/></strong>
                                     </a>
                                    </div>
                                </c:if>
                          </c:forEach>
                         </c:if>
                         <c:if test="${empty noty.delphotos}">
                             <h1> Per ora non ci sono notifiche, torna più tardi</h1>
                         </c:if>
                    <p>
                </div>
                <div id="menu3" class="tab-pane fade">
                    <p>
                         <c:forEach var="notbean" items="${noty.replies}">
                                <c:if test="${notbean.accepted == true}">
                                    <div class="list-group">
                                        <c:url value="showreplyconfirm.jsp" var="repliesURL">
                                             <c:param name="id" value="${notbean.idrep}" />
                                        </c:url>
                                        <a href="${repliesURL}" class="list-group-item">
                                            <strong><c:out value="${notbean.ristoratore}"/></strong>
                                            Ha risposto ad un commento di <strong><c:out value="${notbean.customer}"/></strong> sul proprio ristorante.
                                        </a>
                                    </div>
                                </c:if>
                            </c:forEach>
                        <c:forEach var="notbean" items="${noty.chowner}">
                            <c:if test="${notbean.accepted == true}">
                                <div class="list-group">
                                    <c:url value="showchangeowner.jsp" var="chownerURL">
                                             <c:param name="id" value="${notbean.usrid}" />
                                    </c:url>
                                    <a href="${chownerURL}" class="list-group-item">
                                        <strong><c:out value="${notbean.nickname}"/></strong>
                                        Ha risposto ad un commento di <strong><c:out value="${notbean.nickname}"/></strong> sul proprio ristorante.
                                    </a>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:forEach var="notbean" items="${noty.delphotos}">
                            <c:if test="${notbean.accepted == true}">
                                <c:url value="showPhotoDeleteRequest.jsp" var="photodeleteURL">
                                    <c:param name="id" value="${notbean.idphoto}" />
                                </c:url>
                                <div class="list-group">
                                    <a href="${photodeleteURL}" class="list-group-item">
                                        E'stata segnalata una foto di 
                                           <strong><c:out value="${notbean.nickname}"/></strong>
                                    </a>
                                </div>
                            </c:if>
                        </c:forEach>
                    <p>
                </div>
                
                <div id="menu4" class="tab-pane fade">
                    <p>
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
                            <h1> Per ora non ci sono notifiche, torna più tardi</h1>
                        </c:if>
                     </p>
                </div>
                
                <div id="menu5" class="tab-pane fade">
                    <p>
                          <c:if test="${fn:length(resnoty.review_list) gt 0}">  
                           <c:forEach var="notbean" items="${resnoty.review_list}">
                                <c:if test="${notbean.view == true}">
                                    <c:url value="showreview.jsp" var="reviewURL">
                                        <c:param name="id" value="${notbean.idphoto}" />
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
                     </p>
                </div>
                
              </div>
        </div>