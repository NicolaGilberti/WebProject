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
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script type="text/javascript" src="js/autoComplete.js"></script>
    
        <script src="js/locationSearch.js"></script>
        <!-- /scripts-->

        <!--css-->
         <jsp:include page="header/headerFiles.jsp" />
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

        <div class="container">
            <div class="text-center">
                <h1>Lores ipsum</h1>
            </div>
        </div>
        <!-- /.container -->


        <script src="js/login.js"></script>

    </body>

</html>
