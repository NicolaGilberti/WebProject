<%-- 
    Document   : currentUser
    Created on : 22-set-2016, 16.26.18
    Author     : nicol
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="header/headerFiles.jsp" />
        <link href="css/userpage.css" rel="stylesheet">
        <link href="css/resultsStyle.css" rel="stylesheet">
        <script src="js/checkNewPwd.js"></script>

        <title>TuttoBistrò - User</title>

    </head>
    <body>

        <!-- header -->
        <jsp:include page="header/header.jsp" />

        <%--<c:if test="${sessionScope.user != null}">--%>

        <div id="photo-modal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content photo-modal-content">
                    <img id="photo-modal-img" src="" >
                </div>

            </div>
        </div>

        <!-- Modal -->
        <div id="changeNickname" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modifica nickname</h4>
                    </div>
                    <form method="post" action="ChangeUserNickname">
                        <div class="modal-body">
                            <p>

                                <label for="newNickname">Nuovo nickname:</label>
                                <input type="text" class="form-control" id="newNickname" name="newNickname" required />
                                <label for="pwd">Password:</label>
                                <input type="password" class="form-control" id="nicknamePwd" name="nicknamePwd" required />

                            </p>
                        </div>
                        <div class="modal-footer">

                            <button type="submit" class="btn btn-default">Salva</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Annulla</button>

                        </div>
                    </form>
                </div>

            </div>
        </div>

        <!-- Modal -->
        <div id="changePassword" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modifica password</h4>
                    </div>
                    <form method="post" action="ChangeUserPassword" onsubmit="return checkNewPwd()">
                        <div class="modal-body">
                            <p>

                                <label for="oldPwd">Vecchia password:</label>
                                <input type="password" class="form-control" id="oldPwd" name="oldPwd" required >
                                <label for="newPwd" id="label-newPwd">Nuova password:</label>
                                <input type="password" class="form-control" id="newPwd" name="newPwd" required >
                                <label for="newPwd2" id="label-newPwd2">Ripeti password:</label>
                                <input type="password" class="form-control" id="newPwd2" name="newPwd2" required >

                            </p>
                        </div>
                        <div class="modal-footer">

                            <button type="submit" class="btn btn-default">Salva</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="resetChangePwd()">Annulla</button>

                        </div>
                    </form>
                </div>

            </div>
        </div>

        <div class="container">
            <c:if test="${alert.type gt -1}">
                <div class="user-alert-box">
                    <c:choose>
                        <c:when test="${alert.type == 0}">
                            <div class="alert alert-success fade in">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>
                                    <c:out value="${alert.title}" />
                                </strong>
                                <c:out value="${alert.description}" />
                            </div>
                        </c:when>
                        <c:when test="${alert.type == 1}">
                            <div class="alert alert-danger fade in">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>
                                    <c:out value="${alert.title}" />
                                </strong>
                                <c:out value="${alert.description}" />
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </c:if>

            <!--
            <div class="prova row">
                <div class="col-md-2">
                    <img src="img/reviewsImgs/cbk.jpg" />
                </div>
                <div class="col-md-2">
                    <img src="img/reviewsImgs/cbk.jpg" />
                </div>
                <div class="col-md-2">
                    <img src="img/reviewsImgs/cbk.jpg" />
                </div>
                <div class="col-md-2">
                    <img src="img/reviewsImgs/cbk.jpg" />
                </div>
                <div class="col-md-2">
                    <img src="img/reviewsImgs/cbk.jpg" />
                </div>
                <div class="col-md-2">
                    <img src="img/reviewsImgs/cbk.jpg" />
                </div>
                <div class="col-md-2">
                    <img src="img/reviewsImgs/cbk.jpg" />
                </div>
                <div class="col-md-2">
                    <img src="img/reviewsImgs/cbk.jpg" />
                </div>
                <div class="col-md-2">
                    <img src="img/reviewsImgs/cbk.jpg" />
                </div>
                <div class="col-md-2">
                    <img src="img/reviewsImgs/cbk.jpg" />
                </div>
                <div class="col-md-2">
                    <img src="img/reviewsImgs/cbk.jpg" />
                </div>
                <div class="col-md-2">
                    <img src="img/reviewsImgs/cbk.jpg" />
                </div>
            </div>
            -->

            <div class="user-info">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="col-xs-center">
                            <c:out value="${user.name} ${user.surname}" />
                        </h1>
                        <!--
                                                <form class="col-sm-6" action="#" method="post">
                                                    <button type="submit" class="nameModifyButton iconButton"><span class="glyphicon glyphicon-edit"></span></button>
                                                </form> -->
                    </div>
                </div>
                <br>

                <div class="row">

                    <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                        <span class="iconInfo glyphicon glyphicon-user"></span>
                    </div>
                    <div class="col-xs-8 col-sm-4 col-md-3 col-lg-3">
                        <p class="pUser">
                            <c:out value="${user.nickname}" />
                        </p>
                    </div>
                    <div class="col-xs-2 col-sm-6 col-md-8 col-lg-8">
                        <button type="button" class="iconButton" data-toggle="modal" data-target="#changeNickname"><span class="glyphicon glyphicon-pencil"></span></button>
                    </div>

                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                        <span class="iconInfo glyphicon glyphicon-envelope"></span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-11 col-lg-11">
                        <p class="pUser">
                            <c:out value="${user.email}" />
                        </p>
                    </div>
                    <div class="col-xs-2"></div>
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                        <span class="iconInfo glyphicon glyphicon-time"></span>
                    </div>
                    <div class="col-xs-8 col-sm-10 col-md-11 col-lg-11">
                        <p class="pUser">
                            Ultimo accesso: 
                            <c:out value="${user.last_log}" />
                        </p>
                    </div>
                    <div class="col-xs-2"></div>
                </div>
                <div class="row">
                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-xs-12 col-sm-11 col-md-11 col-lg-11">
                        <button type="button" class="btn btn-default col-xs-center" data-toggle="modal" data-target="#changePassword">Modifica password</button>
                    </div>
                </div>

            </div>


            <%-- I MIEI RISTORANTI --%>

            <c:if test="${user.type gt 0 && fn:length(restaurants) gt 0}">

                <hr class="user-hr">

                <div class="row">
                    <div class="user-restaurants-title col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <h2 class="user-restaurants user-title col-xs-center">I miei ristoranti</h2>
                    </div>
                    <div class="user-new-restaurant-btn col-xs-12 col-sm-8 col-md-9 col-lg-9">
                        <form action="newRestaurantForm.jsp">
                              <button type="submit" class="btn btn-default col-xs-center" >Aggiungi nuovo</button>
                        </form>
                    </div>
                </div>

                <!-- Avvia servlet per ricerca miei ristoranti -->
                <div class="row" id="row-thumbnail">

                    <c:forEach items="${restaurants}" var="restaurant">
                        <div class="col-sm-6 col-xs-12 col-md-4 col-centered">
                            <div class="thumbnail">
                                <div class="module">
                                    <img class="module img-responsive" src="img/restImgs/<c:out value='${restaurant.imgPath}' />" alt="Nessuna immagine disponibile">
                                    <div class="overlay"></div>
                                    <header>
                                        <h1>
                                            <c:out value="${restaurant.name}" />
                                        </h1>
                                        <div>
                                            <c:forEach var="j" begin="${restaurant.globalValue + 1}" end="5">
                                                <span class="pull-right glyphicon glyphicon-star-empty val"></span>
                                            </c:forEach>
                                            <c:forEach var="i" begin="1" end="${restaurant.globalValue}">
                                                <span class="pull-right glyphicon glyphicon-star val"></span>
                                            </c:forEach>
                                        </div>
                                    </header>
                                </div>
                                <div class="caption">
                                    <div class="cuisine-labels">
                                        <c:forEach var="cuisine" items="${restaurant.cuisineTypes}">
                                            <span class="label label-info">
                                                <c:out value="${cuisine.name}" />
                                            </span>
                                        </c:forEach>
                                        <p class="pull-right">
                                            <c:out value="${restaurant.numReviews}" />
                                            <c:choose>
                                                <c:when test="${restaurant.numReviews eq 1}">
                                                    Recensione
                                                </c:when>
                                                <c:otherwise>
                                                    Recensioni
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                    <p>
                                        <span class="glyphicon glyphicon-globe"></span>
                                        <c:out value="${restaurant.address}" />
                                    </p>
                                    <%--
                                    <p>
                                        <c:out value="${restaurant.description}" />
                                    </p>
                                    --%>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <!--/row-->
                </div>

                <!--
                <div class="row">
                    <div class="col-sm-12">
                        <h3>Ristorante 1</h3>
                    </div>
                    <div class="col-sm-12">
                        <p>via X 69, Trento (TN)</p>
                    </div>
                </div>
                -->

            </c:if>

            <%-- fine ristoranti --%>


            <%-- LE MIE ULTIME RECENSIONI --%>

            <c:if test="${fn:length(reviews) gt 0}" >

                <hr class="user-hr">

                <div class="row">
                    <div class="col-sm-12">
                        <h2 class="user-reviews user-title col-xs-center">Le mie ultime recensioni</h2>
                    </div>
                </div>

                <div class="panel-group">
                    <c:forEach var="r" items="${reviews}">
                        <div class="panel panel-default panel-review">
                            <div class="panel-heading panel-outer">
                                <div class="panel-heading-inner"></div>
                                <div class="row">
                                    <div class="panel-title col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <h3>
                                            <c:out value="${r.name}" />
                                        </h3>
                                    </div>
                                    <div class="col-stars col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <%-- stelle piene --%>
                                        <c:forEach var="i" begin="1" end="${r.global_value}">
                                            <span class="glyphicon glyphicon-star"></span>
                                        </c:forEach>
                                        <%-- stelle vuote --%>
                                        <c:forEach var="i" begin="${r.global_value + 1}" end="5">
                                            <span class="glyphicon glyphicon-star-empty"></span>
                                        </c:forEach>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="valutations">
                                            <span class="label label-warning label-review">CIBO: 
                                                <span class="badge badge-review">
                                                    <c:out value="${r.food}" />
                                                </span>
                                            </span>
                                            <span class="label label-warning label-review">QUALITA'/PREZZO: 
                                                <span class="badge badge-review">
                                                    <c:out value="${r.value_for_money}" />
                                                </span>
                                            </span>
                                            <span class="label label-warning label-review">ATMOSFERA: 
                                                <span class="badge badge-review">
                                                    <c:out value="${r.atmosphere}" />
                                                </span>
                                            </span>
                                            <span class="label label-warning label-review">SERVIZIO: 
                                                <span class="badge badge-review">
                                                    <c:out value="${r.service}" />
                                                </span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="review-rest col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <h4>
                                            <c:out value="${r.restaurant_name}" />
                                            <small class=" review-sm-date text-muted">
                                                <c:out value="${r.restaurant_city} - ${fn:split(r.data_creation, ' ')[0]}" />
                                            </small>
                                        </h4>
                                        <h4 class="review-xs-date">
                                            <small class="text-muted">
                                                <c:out value="${r.restaurant_city} - ${fn:split(r.data_creation, ' ')[0]}" />
                                            </small>
                                        </h4>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <c:out value="${r.description}" />
                            </div>
                            <c:if test="${r.photo_name != ''}">
                                <div class="panel-footer panel-outer">
                                    <div class="photos-container">
                                        <div class="review-photo">
                                            <a data-toggle="modal" data-target="#photo-modal" onclick="setModalImage('<c:out value='${r.photo_name}' />')">
                                                <img src="
                                                     <c:out value='${r.photo_name}' />
                                                     " >
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>

                <%--
                <div class="row reviews">
                    <c:set var="index" value="${1}" />
                    <c:forEach items="${reviews}" var="r">
                        <div class="
                             <c:choose>
                                 <c:when test="${index%2 eq 0}">
                                     <c:out value="review-wrap-right" />
                                 </c:when>
                                 <c:otherwise>
                                     <c:out value="review-wrap-left" />
                                 </c:otherwise>
                             </c:choose>
                             col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="review">
                                <c:choose>
                                    <c:when test="${r.photo_name != ''}">
                                        <div class="user-review-image col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                            <img src="<c:out value='${r.photo_name}' />" alt="Nessuna immagine disponibile" >
                                            <div class="overlay"></div>
                                        </div>
                                        <c:set var="photo" value="8" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="photo" value="12" />
                                    </c:otherwise>
                                </c:choose>
                                <div class="review-content col-xs-12 
                                     <c:out value="col-sm-${photo} col-md-${photo} col-lg-${photo}" />
                                     ">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <h3 class="user-review-name user-review-name-<c:out value='${photo}' /> ">
                                                <c:out value="${r.name}" />
                                            </h3>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <h4 class="user-review-rest-name user-review-rest-name-<c:out value='${photo}' /> ">
                                                <c:out value="${r.restaurant_name}" />
                                            </h4>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-7 col-lg-6 user-review-rest-city">
                                            <h3>
                                                <small class="text-muted">
                                                    <c:out value="${r.restaurant_city} - ${fn:split(r.data_creation, ' ')[0]}" />
                                                </small>
                                            </h3>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-6 col-md-5-stars">
                                            <h4 class="col-stars">
                <%-- stelle piene -->
                <c:forEach var="i" begin="1" end="${r.global_value}">
                    <span class="glyphicon glyphicon-star"></span>
                </c:forEach>
                <%-- stelle vuote -->
                <c:forEach var="i" begin="${r.global_value + 1}" end="5">
                    <span class="glyphicon glyphicon-star-empty"></span>
                </c:forEach>
            </h4>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-6 review-food">
            <h5>
                <c:out value="CIBO: ${r.food}/5" />
            </h5>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-7 col-lg-6 review-atmosphere">
            <h5>
                <c:out value="ATMOSFERA: ${r.atmosphere}/5" />
            </h5>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-6 review-service">
            <h5>
                <c:out value="SERVIZIO: ${r.service}/5" />
            </h5>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-7 col-lg-6 review-value-for-money">
            <h5>
                <c:out value="QUALITÀ/PREZZO: ${r.value_for_money}/5" />
            </h5>
        </div>
    </div>
</div>
<div class="review-description col-xs-12 col-sm-12 col-md-12 col-lg-12">
    <blockquote class="blockquote user-review-description">
        <p class="m-b-0">
            <c:out value="${r.description}" />
        </p>
    </blockquote>
    <p class="user-review-description-xs">
        <c:out value="${r.description}" />
    </p>
</div>

</div>
</div>
<c:set var="index" value="${index + 1}" />
</c:forEach>
</div>
                --%>

            </c:if>

            <%-- fine recensioni --%>

            <div>
                <c:out value="${sql}" />
            </div>

        </div>


        <script>
            function setModalImage(photoname) {
                path = photoname.replace("\r", "\\r");
                path = path.replace("Imgs", "Imgs\\");
                document.getElementById("photo-modal-img").src = path;
            }
        </script>
    </body>
</html>
