<!DOCTYPE html>
<html lang="en">

<head>
    <!--css-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Indie+Flower|Lato" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
    <link href="css/header.css" rel="stylesheet">
    <link href="css/resultsStyle.css" rel="stylesheet">


</head>

<body>


    <!-- header -->
    <jsp:include page="header.jsp" />



    <!--Container generale -->
    <div class="container-fluid">

        <!--row generale -->
        <div class="row">


            <!--Barra sinistra -->
            <div class="col-sm-3">
                <a href="#"><strong class="bartitle"><i class="glyphicon glyphicon-wrench"></i> Strumenti</strong></a>

                <hr>

                <form id="searchForm">
                    <div class="input-group stylish-input-group">

                        <input type="text" class="form-control" id="searchInput" placeholder="Search">
                        <span class="input-group-addon">
                                <button id="searchButton">
                                    <span class="glyphicon glyphicon-search"></span>
                        </button>
                        </span>

                    </div>

                    <div class="filters">
                        <a href="#"><strong class="bartitle">Ordina per:</strong></a>
                        <div class="list-group">
                            <button type="button" class="list-group-item" id="btnName">Alfabetico</button>
                            <button type="button" class="list-group-item" id="btnMinPrice">Fascia di Prezzo</button>
                            <button type="button" class="list-group-item" id="btnVal">Valutazione</button>
                        </div>
                    </div>

                    <a href="#" data-toggle="collapse" data-target="#collapsediv"><strong class="bartitle">Opzioni Filtro <i id="glyphicollapse" class="glyphicon glyphicon-chevron-down"></i></strong></a>
                    <div id="collapsediv" class="collapse">
                        <div class="radio">
                            <label><input type="radio" name="priceradio" checked value="all">Tutti</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="priceradio" value="less15">&#60; 15 euro</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="priceradio" value="between1535">Tra 15 e 35 euro </label>
                        </div>

                        <div class="radio">
                            <label><input type="radio" name="priceradio" value="more35">&#62; 35 euro</label>
                        </div>
                   

                    
                        <button type="button" id="filterbtn">Filtra</button>
                        <button type="button" id="decheckallbtn">Deseleziona tutti</button>
                        <button type="button" id="checkallbtn">Seleziona tutti</button>
                        <div id="cuisineChecks">

                        </div>
                   </div> <!--fine collapsediv-->
                     <hr>
</form>
                
            </div>
            <!--/barra sinistra-->


            <!--sezione destra -->
            <div class="col-sm-9">
                <strong class="bartitle"> <a href="#" ><i class="glyphicon glyphicon-search"></i> Risultati trovati: <span id="trovatiLabel"></span></a></strong>
                <hr>
                <div class="row" id="row-thumbnail">

                </div>
                <!--row-->

            </div>
            <!--/sezione destra-->

        </div>
        <!--/row generale -->

    </div>
    <!--/Container generale -->

    <!--script-->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="js/vendor/bootstrap.min.js"></script>
    <script src="js/login.js"></script>
    <script src="js/results.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript" src="js/autoComplete.js"></script>
</body>

</html>
