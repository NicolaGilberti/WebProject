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
        <script src="js/vendor/bootstrap.min.js "></script>
        <script src="js/locationSearch.js"></script>

        <!-- /scripts-->

        <!--css-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Pacifico|Lato" rel="stylesheet">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/indexNew.css">
        <!--/css-->
    </head>

    <body>
        <!-- header -->
        <jsp:include page="header.jsp" />


        <div class="wide">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center searchbox">
                        <h1>Cerca Ristorante</h1>
                       
                        <div class="col-md-8 col-md-offset-2">
                            <div class="input-group" id="adv-search">
                                <input type="text" class="form-control" id="searchInput" placeholder="Inserisci il nome del ristorante o la sua località" />
                                <div class="input-group-btn">
                                    <div class="btn-group" role="group">
                                        <div class="dropdown dropdown-lg">
                                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
                                            <div class="dropdown-menu dropdown-menu-right" role="menu">
                                                <form class="form-horizontal" role="form">
                                                    <div class="form-group">
                                                        <label for="filter">Tipologia di cucina:</label>
                                                        <select class="form-control">
                                                            <option value="0" selected>All Snippets</option>
                                                            <option value="1">Featured</option>
                                                            <option value="2">Most popular</option>
                                                            <option value="3">Top rated</option>
                                                            <option value="4">Most commented</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="contain">Città:</label>
                                                        <input class="form-control" type="text" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="contain">Stato:</label>
                                                        <input class="form-control" type="text" />
                                                    </div>
                                                    <div class="text-center">
                                                        <button type="submit" class="btn btn-purple"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Ricerca Avanzata</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-yellow"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Ricerca</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="text-center">
                <h1>Content</h1>
            </div>
        </div>
        <!-- /.container -->


    </body>

</html>
