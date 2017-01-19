<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


        <!--css-->
        <jsp:include page="header/headerFiles.jsp" />
         <link href="css/resultsStyle.css" rel="stylesheet">
        <link rel="stylesheet" href="css/indexNew.css">
        <!--/css-->


    </head>

    <body>
        <!-- header -->
        <jsp:include page="header/header.jsp" />


        <div class="wide">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center searchbox">
                        <h1>Cerca Ristorante</h1>

                        <div class="col-md-8 col-md-offset-2">
                            <form method="get" action="results.jsp">
                                <div class="input-group" id="adv-search">

                                    <input type="text" name="searchinput" required class="form-control" id="searchInput" placeholder="Inserisci il nome del ristorante o la sua località" />
                                    <div class="input-group-btn">
                                        <div class="btn-group" role="group">

                                            <button type="button" onclick="geoFindMe()" class="btn btn-primary"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>GPS</button>
                                            <button type="submit" class="btn btn-yellow"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Ricerca</button>

                                        </div>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="text-center">
                <h1>I più richiesti</h1>
            </div>


            <c:forEach items="${PopularRestaurants}" var="rest">
    
                <!--singola card-->
                <div class="col-sm-6 col-xs-12 col-md-3 col-centered">
                    <div class="thumbnail">
                        <div class="module">
                            <img class="module img-responsive" src="img/restImgs/${rest.imgPath}" alt="Nessuna immagine disponibile"/>
                            <div class="overlay">
                            </div>
                            <header>
                                <h1>${rest.name}</h1>
                                <div>
                                    <c:forEach var="i" begin="1" end="${rest.score}">
                                        <span class="pull-right glyphicon glyphicon-star val"></span>
                                    </c:forEach>
                                </div>
                            </header>
                        </div>
                        <div class="caption">
                            <div class="cuisine-labels">
                                <c:forEach items="${rest.cuisineTypes}" var="cuisine">
                                    <span class="label label-info">${cuisine.name}</span>
                                </c:forEach>
                                <p class="pull-right">${rest.numReviews} Recensioni</p>
                            </div>
                            <p> <span class="glyphicon glyphicon-globe"></span>${rest.address}, ${rest.city}</p>
                            <p><span class="glyphicon glyphicon-tag"> </span>$ ${rest.minPrice} - ${rest.maxPrice}</p>
                            <div class="thumb-footer">
                                <a href="#" class="dettagli">DETTAGLI</a>
                                <div class="pull-right">
                                    <a href="http://maps.google.com/?q=${rest.address},${rest.city}" target="new_blank"><span class="glyphicon glyphicon-map-marker"> </span> Mappa</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--fine singola card-->
            </c:forEach>
        </div>
        <!-- /.container -->

        <!--scripts-->
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script type="text/javascript" src="js/autoComplete.js"></script>

        <script src="js/locationSearch.js"></script>
        <!-- /scripts-->
    </body>

</html>
