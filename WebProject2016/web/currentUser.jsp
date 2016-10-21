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
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/resultsStyle.css" rel="stylesheet">
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/checkNewPwd.js"></script>

        <title>TuttoBistrò - User</title>

        <style>
            .user-new-restaurant-btn {
                display: none;
            }
            .user-restaurants {
                margin-top: 10px;
                display: inline-block;
            }
            .add-rest-button {
                width: 40px;
                height: 40px;
                display: inline-block;
                margin: 10px;
            }
            .add-rest-button > .button-circle {
                width: 100%;
                height: 100%;
                border: 1px solid #fff;
                background-color: #ff5733;
                border-radius: 20px;
                padding: 6px;
            }
            .add-rest-button > .button-circle > .button-text {
                width: 100%;
                height: 100%;
                background: none;
                border: none;
                font-size: 30px;
                display: inline-block;
                line-height: 100%;
                color: #fff;
            }
            .panel-outer {
                display: block;
                position: relative;
            }
            .panel-heading-inner {
                background: linear-gradient( to bottom, rgba(51, 51, 51, 0.1), rgba(255, 255, 255, 1));
                height: 100%;
                width: 100%;
                top: 0;
                left: 0;
                position: absolute;
                padding: 0;
                border-radius: 4px;
            }
            .panel-footer-inner {
                /*background: linear-gradient( to bottom, rgba(255, 255, 255, 1), rgba(51, 51, 51, 0.1));*/
                height: 100%;
                width: 100%;
                top: 0;
                left: 0;
                position: absolute;
                padding: 0;
            }
            .panel-title > h3 {
                margin-top: 0;
                margin-bottom: 5px;
            }
            .review-rest > h4 {
                margin: 0;
            }
            .review-xs-date {
                display: none;
            }
            .review-sm-date {
                display: inline;
            }
            .panel-review {
                /*border-color: #581845;*/
                box-shadow: rgba(0, 0, 0, 0.1) 0px 5px 5px 2px;
                margin: 15px 0 !important;
            }
            .col-stars {
                margin: 3px 0 7px 0;
                color: #ffc300;
            }
            .valutations {
                margin: 0 0 7px 0;
            }
            .label-review {
                display: inline-block;
                font-size: 82%;
                margin-bottom: 3px;
                padding: 0.3em .4em .1em .4em;
                background-color: #900c3f;
            }
            .badge-review {
                margin-bottom: 1px;
            }
            .prova {
                position: relative;
            }
            .prova > .col-md-2 {
                display: inline-block;
            }
            img {
                max-width: 100%;
            }
            .user-info {
                margin-bottom: 40px;
            }
            .iconButton {
                border: none;
                background: none;
            }
            .iconInfo {
                padding-left: 55px;
                padding-top: 2px;
            }
            .pUser {
                /*margin-bottom: 5px;*/
            }
            .user-hr {
                margin-bottom: 0;
            }
            .row.reviews {
                margin: 0;
            }
            .review-wrap-left {
                padding: 10px 10px 10px 0;
            }
            .review-wrap-right {
                padding: 10px 0 10px 10px;
            }
            .review {
                border: 1px solid #ddd;
                border-radius: 4px;
                padding: 4px;
                float: left;

            }
            .review-content {
                padding: 9px 9px 0 9px;
            }
            .user-review-name {
                margin-top: 0;
            }
            .user-review-rest-city > h3 {
                margin-top: 0px;
            }
            .blockquote.user-review-description {
                display: inline-block;
                margin-bottom: 0;
            }
            .user-review-description-xs {
                display: none;
            }
            .review-description {
                padding-bottom: 9px;
            }
            h4.user-review-rest-name {
                margin-top: 5px;
                margin-bottom: 5px;
            }
            .user-review-image {
                float: right;
                padding: 0;
            }
            .user-alert-box > .alert {
                margin-bottom: 0;
                margin-top: 0;
            }
            .col-sm-6.review-value-for-money > h5, .col-md-7.review-value-for-money > h5,
            .col-lg-6.review-value-for-money > h5, .col-sm-6.review-service > h5,
            .col-md-5.review-service > h5, .col-lg-6.review-service > h5 {
                margin-top: 0;
                margin-bottom: 20px;
            }
            .col-md-5.col-md-5-stars {
                padding-left: 5px;
            }
            .user-new-restaurant-btn > button {
                margin-top: 20px;
            }

            @media screen and (max-width: 991px) {
                .iconInfo {
                    padding-left: 75px;
                }
                .col-sm-12.review-wrap-left, .col-sm-12.review-wrap-right {
                    padding: 7px 0;
                }
            }

            @media screen and (max-width: 767px) {
                .iconInfo {
                    padding-left: 25px;
                    float: right;
                }
                .col-xs-center {
                    float: none;
                    display: block;
                    margin: 0 auto;
                }
                h1.col-xs-center, h2.col-xs-center {
                    margin-top: 20px;
                    margin-bottom: 10px;
                    text-align: center;
                }
                .col-xs-6 > .pUser {
                    text-align: center;
                }
                .review {
                    padding: 4px;
                }

                /*
                user-review-name-8 = review con foto
                user-review-name-12 = review senza foto
                */
                .user-review-name {
                    text-align: center;
                }
                h3.user-review-name-8 {
                    margin: -75px 0 0 0;
                    color: white;
                }
                .user-review-name > .user-review-rest-city {
                    display: none;
                }
                .overlay {
                    background: linear-gradient( to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.9));
                    bottom: 0;
                    left: 0;
                    opacity: 1;
                    position: absolute;
                    right: 0;
                    top: 0;
                    z-index: 1;
                }
                .col-xs-12.user-review-rest-city {
                    display: block;
                    text-align: center;
                }
                .col-xs-12.user-review-rest-city-xs > h3 {
                    margin-top: 0;
                }
                h4.user-review-rest-name {
                    text-align: center;
                }
                h4.user-review-rest-name-8 {
                    margin-top: -45px;
                    color: white;
                }
                h4.col-stars {
                    margin: 0 auto;
                    margin-bottom: 10px;
                    text-align: center;
                }
                .blockquote.user-review-description {
                    display: none;
                }
                .user-review-description-xs {
                    display: block;
                    text-align: center;
                    margin: 0 auto;
                }
                .user-review-image {
                    float: left;
                }
                .col-xs-12.review-food > h5, .col-xs-12.review-service > h5,
                .col-xs-12.review-atmosphere > h5, .col-xs-12.review-value-for-money > h5 {
                    text-align: center;
                }
                .col-xs-12.review-value-for-money > h5 {
                    margin-bottom: 15px;
                }
                .col-xs-12.review-value-for-money > h5, .col-xs-12.review-service > h5,
                .col-xs-12.review-food > h5, .col-xs-12.review-atmosphere > h5 {
                    margin: 0 0 10px 0;
                }
                .col-xs-12.review-wrap-left, .col-xs-12.review-wrap-right {
                    padding: 7px 0;
                }
                .add-rest-button {
                    display: none;
                }
                .user-new-restaurant-btn {
                    display: block;
                }
                .user-new-restaurant-btn > button {
                    margin-top: 0;
                    margin-bottom: 15px;
                }
                .col-xs-12.col-md-5-stars {
                    padding-left: 15px;
                }
                .col-stars > span {
                    float: left !important;
                }
                .col-stars {
                    margin: 0 0 10px 0;
                }
                .review-rest > h4 {
                    margin-bottom: 5px;
                }
                .review-xs-date {
                    display: inline;
                    margin-bottom: 0;
                }
                .review-sm-date {
                    display: none;
                }
                .valutations {
                    margin: 0 0 5px 0;
                }

            }

            @media screen and (max-width: 370px) {
                .user-restaurants.user-title, .user-reviews.user-title {
                    font-size: 26px;
                }
            }
        </style>
    </head>
    <body>

        <!-- header -->
        <jsp:include page="header.jsp" />

        <%--<c:if test="${sessionScope.user != null}">--%>

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
            <c:if test="${alert gt -1}">
                <div class="user-alert-box">
                    <c:choose>
                        <c:when test="${alert == 0}">
                            <div class="alert alert-success fade in">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>
                                    <c:out value="${alert_title}" />
                                </strong>
                                <c:out value="${alert_text}" />
                            </div>
                        </c:when>
                        <c:when test="${alert == 1}">
                            <div class="alert alert-danger fade in">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>
                                    <c:out value="${alert_title}" />
                                </strong>
                                <c:out value="${alert_text}" />
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
                    <div class="user-restaurants-title col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <h2 class="user-restaurants user-title col-xs-center">I miei ristoranti</h2>
                        <div class="add-rest-button">
                            <button type="button" class="button-circle">
                                <div class="button-text">+</div>
                            </button>
                        </div>
                    </div>
                    <div class="user-new-restaurant-btn col-xs-12 col-sm-8 col-md-9 col-lg-9">
                        <button type="button" class="btn btn-default col-xs-center">Aggiungi nuovo</button>
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
                            <div class="panel-footer panel-outer">
                                <div class="panel-footer-inner"></div>
                                Foto del commento
                            </div>
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

    </body>
</html>

<script>

</script>