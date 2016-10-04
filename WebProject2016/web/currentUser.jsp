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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/checkNewPwd.js"></script>

        <title>TuttoBistrò - User</title>

        <style>
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
                padding: 0 10px 10px 0;
            }
            .col-xs-12.review-wrap-left {
                padding: 0 0 10px 0;
            }
            .review {
                border: 1px solid #ddd;
                border-radius: 4px;
                padding: 4px;
                float: left;

            }
            .review-content {
                padding: 9px;
            }
            .user-review-rest-name {
                margin-top: 0;
            }
            .col-stars {
                margin-top: 5px;
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
            .user-review-image {
                float: right;
                padding: 0;
            }
            .user-alert-box > .alert {
                margin-bottom: 0;
                margin-top: 20px;
            }
            .col-sm-6.review-value-for-money > h5, .col-md-7.review-value-for-money > h5,
            .col-lg-6.review-value-for-money > h5, .col-sm-6.review-service > h5,
            .col-md-5.review-service > h5, .col-lg-6.review-service > h5 {
                margin-top: 0;
                margin-bottom: 20px;
            }
            .col-xs-12.review-value-for-money > h5, .col-xs-12.review-service > h5,
            .col-xs-12.review-food > h5, .col-xs-12.review-atmosphere > h5 {
                margin: 0 0 10px 0;
            }
            .col-md-5.col-md-5-stars {
                padding-left: 5px;
            }

            @media screen and (max-width: 991px) {
                .iconInfo {
                    padding-left: 75px;
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
                .user-review-rest-name {
                    margin: 20px 0 10px 0;
                    text-align: center;
                }
                .user-review-rest-name > .user-review-rest-city {
                    display: none;
                }
                .col-xs-12.user-review-rest-city {
                    display: block;
                    text-align: center;
                }
                .col-xs-12.user-review-rest-city-xs > h3 {
                    margin-top: 0;
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
            }

            @media screen and (max-width: 370px) {
                .user-restaurants.user-title, .user-reviews.user-title {
                    font-size: 26px;
                }
            }
        </style>
    </head>
    <body>

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

                    <div class="col-xs-3 col-sm-2 col-md-1 col-lg-1">
                        <span class="iconInfo glyphicon glyphicon-user"></span>
                    </div>
                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                        <p class="pUser">
                            <c:out value="${user.nickname}" />
                        </p>
                    </div>
                    <div class="col-xs-3 col-sm-6 col-md-8 col-lg-8">
                        <button type="button" class="iconButton" data-toggle="modal" data-target="#changeNickname"><span class="glyphicon glyphicon-pencil"></span></button>
                    </div>

                </div>
                <div class="row">
                    <div class="col-xs-3 col-sm-2 col-md-1 col-lg-1">
                        <span class="iconInfo glyphicon glyphicon-envelope"></span>
                    </div>
                    <div class="col-xs-6 col-sm-10 col-md-11 col-lg-11">
                        <p class="pUser">
                            <c:out value="${user.email}" />
                        </p>
                    </div>
                    <div class="col-xs-3"></div>
                </div>
                <div class="row">
                    <div class="col-xs-3 col-sm-2 col-md-1 col-lg-1">
                        <span class="iconInfo glyphicon glyphicon-time"></span>
                    </div>
                    <div class="col-xs-6 col-sm-10 col-md-11 col-lg-11">
                        <p class="pUser">
                            Ultimo accesso: 
                            <c:out value="${user.last_log}" />
                        </p>
                    </div>
                    <div class="col-xs-3"></div>
                </div>
                <div class="row">
                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-xs-12 col-sm-11 col-md-11 col-lg-11">

                        <button type="button" class="btn btn-default col-xs-center" data-toggle="modal" data-target="#changePassword">Modifica password</button>

                    </div>
                </div>

            </div>


            <%-- I MIEI RISTORANTI --%>

            <c:if test="${fn:length(restaurants) gt 0}">

                <hr class="user-hr">

                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <h2 class="user-restaurants user-title col-xs-center">I miei ristoranti</h2>
                    </div>

                </div>

                <!-- Avvia servlet per ricerca miei ristoranti -->
                <!--thumbinail-container-->
                <div class="thumbnail-container">
                    <div class="row row-centered">

                        <c:forEach items="${restaurants}" var="restaurant">
                            <div class="col-sm-6 col-xs-12 col-md-4 col-centered">
                                <div class="thumbnail">
                                    <img src="..." alt="Nessuna immagine disponibile">
                                    <div class="caption">
                                        <h3>
                                            <c:out value="${restaurant.name}" />
                                        </h3>
                                        <p>
                                            <c:out value="${restaurant.address}" />
                                        </p>
                                        <p>
                                            <c:out value="${restaurant.description}" />
                                        </p>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <!--/row-->
                    </div>
                    <!--/thumbnail-container-->
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

            <%--<c:if test="${fn:length(reviews) gt 0}" >--%>

            <hr class="user-hr">

            <div class="row">
                <div class="col-sm-12">
                    <h2 class="user-reviews user-title col-xs-center">Le mie ultime recensioni</h2>
                </div>
            </div>

            <c:forEach items="${reviews}" var="r">
                <div class="review">
                    <div class="row">

                        <%-- STELLE --%>

                        <div class="col-sm-2 stars">
                            <h4>
                                <%-- stelle piene --%>
                                <c:forEach var="i" begin="1" end="${r.getGlobalValue()}">
                                    <span class="glyphicon glyphicon-star"></span>
                                </c:forEach>
                                <%-- stelle vuote --%>
                                <c:forEach var="i" begin="${r.getGlobalValue() + 1}" end="5">
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </c:forEach>
                            </h4>
                        </div>

                        <%-- fine stelle --%>

                        <%-- NOME e CITTA --%>

                        <div class="col-sm-7 user-restaurant-name">
                            <h3><c:out value="${r.restaurant_name}"></c:out></h3>
                            </div>
                            <div class="col-sm-3 user-restaurant-city">
                                <h4>(<c:out value="${r.restaurant_city}"></c:out>)</h4>
                            </div>

                        <%-- --%>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 user-review-date">
                            <h5><c:out value="${r.data_creation}"></c:out></h5>
                            </div>
                            <div class="col-sm-10 user-review-description">
                                <p>
                                <c:out value="${r.description}"></c:out>
                                </p>
                            </div>
                        </div>
                    </div>
            </c:forEach>

            <%--</c:if>--%>

            <%-- fine recensioni --%>

            <div class="row reviews">
                <c:set var="index" value="${1}" />
                <c:forEach items="${reviews}" var="r">
                    <div class="review-wrap-
                         <c:choose>
                             <c:when test="${index%2 eq 0}">
                                 <c:out value="right" />
                             </c:when>
                             <c:otherwise>
                                 <c:out value="left" />
                             </c:otherwise>
                         </c:choose>
                         left col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="review">
                            <div class="user-review-image col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <img src="..." alt="Nessuna immagine disponibile" >
                            </div>
                            <div class="review-content col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <h3 class="user-review-rest-name">
                                            <c:out value="${r.restaurant_name}" />
                                        </h3>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-7 col-lg-6 user-review-rest-city">
                                        <h3>
                                            <small class="text-muted">
                                                <c:out value="(${r.restaurant_city} - ${r.data_creation})" />
                                            </small>
                                        </h3>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-5 col-lg-6 col-md-5-stars">
                                        <h4 class="col-stars">
                                            <%-- stelle piene --%>
                                            <c:forEach var="i" begin="1" end="${r.global_value}">
                                                <span class="glyphicon glyphicon-star"></span>
                                            </c:forEach>
                                            <%-- stelle vuote --%>
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
                                <div class="row">
                                    <div class="col-sm-1"></div>
                                    <div class="col-xs-12 col-sm-11">
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
                        </div>
                    </div>
                    <c:set var="index" value="${index + 1}" />
                </c:forEach>
            </div>

        </div>

    </body>
</html>

<script>

</script>