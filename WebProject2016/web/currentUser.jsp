<%-- 
    Document   : currentUser
    Created on : 22-set-2016, 16.26.18
    Author     : nicol
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <script src="js/vendor/bootstrap.min.js"></script>
        <title>TuttoBistrò - User</title>

        <style>
            img {
                max-width: 100%;
            }
            div {
                /*max-width: 100%;*/
                /*border: 1px solid black;*/
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

            @media screen and (max-width: 991px) {
                .iconInfo {
                    padding-left: 75px;
                }
            }

            @media screen and (max-width: 626px) {
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
                    <form action="#">
                        <div class="modal-body">
                            <p>

                                <label for="newNickname">Nuovo nickname:</label>
                                <input type="text" class="form-control" id="newNickname" />
                                <label for="pwd">Password:</label>
                                <input type="password" class="form-control" id="pwd" />

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
                    <form action="#">
                        <div class="modal-body">
                            <p>

                                <label for="oldPwd">Vecchia password:</label>
                                <input type="password" class="form-control" id="oldPwd" />
                                <label for="newPwd">Nuova password:</label>
                                <input type="password" class="form-control" id="newPwd" />
                                <label for="newPwd2">Ripeti password:</label>
                                <input type="password" class="form-control" id="newPwd2" />

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

        <div class="container">
            <div class="user-info">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="col-xs-center">
                            <%--<c:out value="${user.name + ' ' + user.surname}" /> --%>Nicola Schiavon
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
                            <%--<c:out value="${user.nickname}" /> --%>nicolaburetta
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
                            <%--<c:out value="${user.mail}" /> --%>nicolaburetta@gmail.com
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
                            <%--<c:out value="${user.last_log}" /> --%>ultimo accesso 12:34
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

            <%--<c:if test="${fn:length(restaurants) > 0}">--%>

            <hr>

            <div class="row">
                <div class="col-xs-12 col-md-12">
                    <h2 class="col-xs-center">I miei ristoranti</h2>
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

            <div class="row">
                <div class="col-sm-12">
                    <h3>Ristorante 1</h3>
                </div>
                <div class="col-sm-12">
                    <p>via lemanidalculo 69, Trento (TN)</p>
                </div>
            </div>

            <%--</c:if> --%>

            <%-- fine ristoranti --%>


            <%-- LE MIE ULTIME RECENSIONI --%>

            <%--<c:if test=${fn:length(reviews) > 0}>--%>

            <hr>

            <div class="row">
                <div class="col-sm-12">
                    <h2>Le mie ultime recensioni</h2>
                </div>
            </div>

            <c:forEach items="${reviews}" var="r">
                <div class="review">
                    <div class="row">
                        <div class="col-sm-2 stars">
                            <c:forEach var="i" begin="1" end="${r.getGlobalValue()}">
                                <h4>
                                    <span class="glyphicon glyphicon-star"></span>
                                </h4>
                            </c:forEach>
                            <c:forEach var="i" begin="${r.getGlobalValue() + 1}" end="5">
                                <h4>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </h4>
                            </c:forEach>
                        </div>
                        <div class="col-sm-7">
                            <h3>
                                <c:out value="${r.getRestaurantName()}"></c:out>
                                </h3>
                            </div>
                            <div class="col-sm-3">
                                <h4>(<c:out value="${r.getRestaurantCity}"></c:out>)</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <h5>
                                <c:out value="${r.getDataCreation()}"></c:out>
                                </h5>
                            </div>
                            <div class="col-sm-10">
                            <c:out value="${r.getDescription()}"></c:out>
                            </div>
                        </div>
                    </div>
            </c:forEach>

            <%-- fine recensioni --%>


            <div class="row">
                <div class="col-sm-2">
                    <h3>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                    </h3>
                </div>
                <div class="col-sm-6">
                    <h3>Nome ristorante</h3>
                </div>
                <div class="col-sm-2">
                    <h3>(Città)</h3>
                </div>
                <div class="col-sm-2">
                    <h3>22-09-2016</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <p class="comment">
                        Questo ristorante mi ha fatto un sacco cagare.
                    </p>
                </div>
            </div>


            <div class="row">
                <div class="col-sm-2">
                    <h3>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                    </h3>
                </div>
                <div class="col-sm-6">
                    <h3>Nome ristorante</h3>
                </div>
                <div class="col-sm-2">
                    <h3>(Città)</h3>
                </div>
                <div class="col-sm-2">
                    <h3>22-09-2016</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <p class="comment">
                        Questo ristorante mi ha fatto un sacco cagare.
                    </p>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-2">
                    <h3>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                    </h3>
                </div>
                <div class="col-sm-6">
                    <h3>Nome ristorante</h3>
                </div>
                <div class="col-sm-2">
                    <h3>(Città)</h3>
                </div>
                <div class="col-sm-2">
                    <h3>22-09-2016</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <p class="comment">
                        Questo ristorante mi ha fatto un sacco cagare.
                    </p>
                </div>
            </div>


            <%--</c:if>--%>


        </div>

    </body>
</html>

<script>

</script>