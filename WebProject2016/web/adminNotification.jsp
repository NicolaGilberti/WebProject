<%-- 
    Document   : notification
    Created on : 18-gen-2017, 0.39.15
    Author     : Marco
--%>


<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <link rel="stylesheet" href="css/notifcation.css">
 <link rel="stylesheet" href="css/generic.css">
 

<!DOCTYPE html>

        <!-- menu a tab per la selezione delle varie categorie delle notifiche: risposte da confermare,
        cambiamento propietario,eliminzaione di foto, notifiche accettate e le notifiche del ristorante
        in caso un amministratore sia propietario anche di un ristoratne
        -->
        <!--menu delle notifiche-->
            <ul class="nav nav-tabs">
                 <li class="active"><a data-toggle="tab" href="#home"><strong class="h3-subtitle">Risposte da confermare</strong></a></li>
                 <li><a data-toggle="tab" href="#menu1"><strong class="h3-subtitle">Richiesta di cambiamento proprietario </strong></h3></a></li>
                 <li><a data-toggle="tab" href="#menu2"><strong class="h3-subtitle">Elimina richiesta foto </strong></h3></a></li>
                 <li><a data-toggle="tab" href="#menu4"><strong  class="h3-subtitle">Notifiche ristorante </strong></h3></a></li>
                 <li><a data-toggle="tab" href="#menu5"><strong class="h3-subtitle">Notifiche ristorante già viste</strong></h3></a></li>
                 <li><a data-toggle="tab" href="#menu3"><strong class="h3-subtitle">Notifiche accettate </strong></h3></a></li>
            </ul>
            <!-- da qui inizio a mostrare i pannelli delle notifiche-->
            <div class="tab-content">
                <!-- 
                Primo pannello relativo alla conferma delle reply, dove mostro il panel con la notifica, e gli appendo come attributo l'id
                che mi serve per sapere quale notifica mostrare nella pagina showrepl
                -->
                <div id="home" class="tab-pane fade in active">
                    <br>
                    <c:if test="${fn:length(noty.replies) gt 0}">
                        <c:forEach var="replybean" items="${noty.replies}">
                            <c:if test="${replybean.accepted == false}">
                                <div class="list-group">
                                    <c:url value="showreplyconfirm.jsp" var="repliesURL">
                                        <c:param name="id" value="${replybean.idrep}" /> 
                                        <c:param name="sh" value="true"/> 
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
                </div>
                
                <!-- 
                    Secondo pannello che utilizzo per mostrare le notifiche del change owner 
                    utilizzando la stessa modalità descritta nel pannello sopra
                -->
                
                <div id="menu1" class="tab-pane fade">
                    <br>
                    <c:if test="${fn:length(noty.chowner) gt 0}">   
                        <c:forEach var="notbean" items="${noty.chowner}">
                            <c:if test="${notbean.accepted == ''}">
                                <div class="list-group">
                                    <c:url value="showchangeowner.jsp" var="chownerURL">
                                        <c:param name="idu" value="${notbean.usrid}" />
                                        <c:param name="idr" value="${notbean.resid}" />
                                        <c:param name="sh" value="true"/> 
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
                </div>
                
                 <!-- 
                    Secondo pannello che utilizzo per mostrare le notifiche per la rimozione di una foto 
                    utilizzando la stessa modalità descritta nel pannello sopra
                -->
                
                <div id="menu2" class="tab-pane fade">
                    <br>
                    <c:if test="${fn:length(noty.delphotos) gt 0}">
                        <c:forEach var="notbean" items="${noty.delphotos}">
                            <c:if test="${notbean.accepted == false}">
                                <c:url value="showPhotoDeleteRequest.jsp" var="photoURL">
                                    <c:param name="id" value="${notbean.idphoto}" />
                                    <c:param name="sh" value="true"/> 
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
                </div>
                
                 <!-- 
                    Questo è il pannello dove mostro tutte le notifiche che sono già state gestite da un amministratore
                    Ogni volta mostro  le reply già confermate, le foto già gestite e anche le pratiche per il cambiamento del
                    propietario già gestite.
                -->
                
                <div id="menu3" class="tab-pane fade">
                    <br>
                    <!-- Reply -->
                    <c:forEach var="notbean" items="${noty.replies}">
                        <c:if test="${notbean.accepted == true}">
                            <div class="list-group">
                                <c:url value="showreplyconfirm.jsp" var="repliesURL">
                                    <c:param name="id" value="${notbean.idrep}" />
                                    <c:param name="sh" value="false"/> 
                                </c:url>
                                <a href="${repliesURL}" class="list-group-item">
                                    <strong><c:out value="${notbean.ristoratore}"/></strong>
                                    Ha risposto ad un commento di <strong><c:out value="${notbean.customer}"/></strong> sul proprio ristorante.
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                    <!-- Change owner request -->
                    <c:forEach var="notbean" items="${noty.chowner}">
                        <c:if test="${notbean.accepted == true}">
                            <div class="list-group">
                                <c:url value="showchangeowner.jsp" var="chownerURL">
                                    <c:param name="id" value="${notbean.usrid}"/>
                                    <c:param name="idr" value="${notbean.resid}" />
                                    <c:param name="sh" value="false"/> 
                                </c:url>
                                <a href="${chownerURL}" class="list-group-item">
                                    <strong><c:out value="${notbean.nickname}"/></strong>
                                    ha reclamato il ristorante <strong><c:out value="${notbean.resname}"/></strong>.
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                    <!--Delete Photo Request -->
                    <c:forEach var="notbean" items="${noty.delphotos}">
                        <c:if test="${notbean.accepted == true}">
                            <c:url value="showPhotoDeleteRequest.jsp" var="photodeleteURL">
                                <c:param name="id" value="${notbean.idphoto}" />
                                <c:param name="sh" value="false"/> 
                            </c:url>
                            <div class="list-group">
                                <a href="${photodeleteURL}" class="list-group-item">
                                    E'stata segnalata una foto di 
                                    <strong><c:out value="${notbean.nickname}"/></strong>
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                
                <!-- 
                    Secondo pannello che utilizzo per mostrare le notifiche del ristorante il cui propietario è l'admin loggato
                    utilizzando la stessa modalità dei pannelli sopra
                -->
                
                <div id="menu4" class="tab-pane fade">
                    <br>
                    <c:if test="${fn:length(resnoty.review_list) gt 0}">  
                        <c:forEach var="notbean" items="${resnoty.review_list}">
                            <c:if test="${notbean.view == false}">
                                <!-- 
                                    In questo caso ogni volta che un ristoratore clicca su una notifica, la segno come vista passando per la servlet UpdateReviewServlet,
                                    e quindi il sitoratore la potrà trovare nelle notifiche già viste.    
                                -->
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
                </div>
                
                <!-- 
                    Secondo pannello che utilizzo per mostrare le notifiche del ristorante il cui propietario è l'admin loggato già viste
                    utilizzando la stessa modalità dei pannelli sopra
                -->
                
                <div id="menu5" class="tab-pane fade">
                    <br>
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
                </div>    
            </div>