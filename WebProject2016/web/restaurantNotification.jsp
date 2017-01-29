
<!DOCTYPE html-->
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header/headerFiles.jsp" />
<link rel="stylesheet" href="css/generic.css">

<link rel="stylesheet" href="css/notifcation.css">


            <ul class="nav nav-tabs" style="display: inline">
                <li class="active"><a data-toggle="tab" href="#menu"><h3 class="h3-subtitle"><strong>Notifiche non visualizzate</strong> <span class="badge">${fn:length(noty.replies)}</span></h3></a></li>
                 <li><a data-toggle="tab" href="#menu1"><h3 class="h3-subtitle"><strong>Notifiche già viste</strong><span class="badge">${fn:length(noty.chowner)}</span></h3></a></li>
            </ul>
             <div id="menu" class="tab-pane fade">
                <c:if test="${fn:length(resnoty.review_list) gt 0}">  
                    <c:forEach var="notbean" items="${resnoty.review_list}">
                        <c:if test="${notbean.view == false}">
                            <c:url value="UpdateReviewServlet" var="reviewURL">
                                <c:param name="id" value="${notbean.idrep}" />
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
            <div id="menu5" class="tab-pane fade">
                    <p>
                        <c:if test="${fn:length(resnoty.review_list) gt 0}">  
                           <c:forEach var="notbean" items="${resnoty.review_list}">
                                <c:if test="${notbean.view == true}">
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
                    </p>
            </div>