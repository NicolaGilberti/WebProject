<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
    <!--<![endif]-->

    <head>
        <!--meta-->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>TuttoBistro</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--/meta-->

        <!--scripts-->
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script type="text/javascript" src="js/autoComplete.js"></script>
        <script src="js/vendor/bootstrap.min.js "></script>
        <script src="js/login.js"></script>
        <!-- /scripts-->

        <!--css-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
            body {
                padding-top: 50px;
                padding-bottom: 20px;
            }

        </style>

        <link href="https://fonts.googleapis.com/css?family=Indie+Flower|Lato" rel="stylesheet">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
        <link rel="stylesheet" href="css/generic.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/results.css">


        <!--/css-->

    </head>

    <body>

        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="loginmodal-container">
                    <h1>Effettua il login</h1><br>
                    <form method="post" id="formlogin">
                        <div class="form-group">
                            <label for="email" class="control-label">Email</label>
                            <input type="text" id="email" name="email" required placeholder="Username">
                        </div>
                        <div class="form-group">
                            <label for="pass" class="control-label">Password</label>
                            <input type="password" id="password" name="pass" required placeholder="Password">
                        </div>
                        <span id="messaggio" class="label-warning"></span>
                        <input type="submit" class="login loginmodal-submit" value="Login">

                    </form>

                    <div class="login-help">
                        <a href="registrazione.html">Registrati</a> - <a href="#">Password dimenticata?</a>
                    </div>
                </div>
            </div>
        </div>


        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">TuttoBistro</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">

                        <%-- //Se l'utente esiste nella sessionScope vuol dire che e' loggato e non ha bisogno di vedere il tasto login --%>
                        <c:if test="${sessionScope.user == null}">
                            <li class=""><a href="#" data-toggle="modal" data-target="#login-modal">Login<span class="sr-only">(current)</span></a></li>
                            </c:if>

                        <li><a href="#">Link</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <input type="text" class="searchbar form-control" placeholder="Search">
                        </div>

                    </form>
                    <c:if test="${sessionScope.user != null}">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <span class="glyphicon glyphicon-user"></span>
                                    <strong> <c:out value="${user.nickname}" /></strong>
                                    <span class="glyphicon glyphicon-chevron-down"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <div class="navbar-login">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <p class="text-center">
                                                        <span class="glyphicon glyphicon-user icon-size"></span>
                                                    </p>
                                                </div>
                                                <div class="col-lg-8">
                                                    <p class="text-left"><strong><c:out value="${user.name}" /> <c:out value="${user.surname}" /></strong></p>
                                                    <p class="text-left small"><c:out value="${user.email}" /></p>
                                                    <p class="text-left">
                                                        <a href="#" class="btn btn-primary btn-block btn-sm">Impostazioni</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <div class="navbar-login navbar-login-session">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <p>
                                                    <form action="LogoutAttempt" method="post">
                                                        <button class="btn btn-danger btn-block" type="submit" name="logout" value="logout" class="btn-link">Disconnettiti</button>
                                                    </form>
                                                    <!--<a href="#" class="">Disconnettiti</a> -->
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </c:if>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <!--fine header -->

        <!--main container-->
        <div class="container">

            <p id="nresults">Risultati Trovati : ${fn:length(restaurants)}</p>
            <hr>
            <!--thumbinail-container-->
            <div class="thumbnail-container">
                <div class="row row-centered">

                    <c:forEach items="${restaurants}" var="restaurant">
                        <div class="col-sm-6 col-xs-12 col-md-6 col-centered">
                            <div class="thumbnail">
                                <img class="img-responsive" src="img/ristoTest.jpg" alt="Nessuna immagine disponibile">
                                <div class="caption">
                                    <h3>
                                        <c:out value="${restaurant.name}" />
                                    </h3>
                                    <p> <a href="http://maps.google.com/?q=<c:out value=" ${restaurant.address} ${restaurant.city} " />"><span class="glyphicon glyphicon-map-marker"></span></a>
                                        <c:out value="${restaurant.address}" />,
                                        <c:out value="${restaurant.city}" />
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


            <!--footer-->
            <footer>
                <hr>
                <p><span class="glyphicon glyphicon-heart-empty"></span> Realizzato da Mirko, Nicola, David, Marco e Riccardo.</p>
            </footer>
            <!--/container-->
        </div>



    </body>

</html>
