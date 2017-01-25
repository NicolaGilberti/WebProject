
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header/headerFiles.jsp" />
<link rel="stylesheet" href="css/generic.css">


<!DOCTYPE html-->
    <body>
        <c:if test="${fn:length(resnoty.review_list) gt 0}">  
            <c:forEach var="notbean" items="${resnoty.review_list}">
                <c:if test="${notbean.view == false}">
                    <c:url value="showreview.jsp" var="reviewURL">
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
        <div class="navbar">
                <!--footer-->
            <footer>
                <hr>
                    <p>Realizzato da Mirko, Nicola, David, Marco e Riccardo.</p>
            </footer>
        </div>
