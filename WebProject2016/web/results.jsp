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
                <script src="js/results.js"></script>
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
                <jsp:include page="header.jsp" />

                <!--main container-->
                <div class="container">

                    <div id="nresults"></div>
                    <p>Ordina per:</p>
                    <button class="btn btn-success" id="btnMinPrice">Prezzo Minimo</button>
                    <button class="btn btn-success" id="btnName">Nome</button>
                    <button class="btn btn-success" id="btnVal">Valutazione</button>
                    <hr>
                    <!--thumbinail-container-->
                    <div class="thumbnail-container">
                        <div class="row row-centered">

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
