<!DOCTYPE html>
<html lang="it">

    <head>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>TuttoBistrò Registrazione</title>

        <!-- CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Pacifico|Lato" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
        <link rel="stylesheet" href="css/form-elements.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/form-elements.css">
        <link rel="stylesheet" href="css/passwordstrength.css">

        <!-- scripts -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/passwordstrength.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="js/login.js"></script>

        <!--/scripts-->

        <link rel="stylesheet" href="css/header.css">
    </head>

    <body>
        <jsp:include page="header.jsp" />
        <!-- Top content -->
        <div class="top-content">

            <h1> <strong>TuttoBistrò</strong> | <a href="http://localhost:8084/WebProject2016/">Home </a></h1>

            <div class="inner-bg">
                <div class="container">

                    <div class="row">

                        <div class="col-md-offset-3 col-sm-12 col-md-6">

                            <div class="form-box">
                                <div class="form-top">
                                    <div class="form-top-left">
                                        <h3>Registrati ora</h3>
                                        <p>Inserisci tutti i dati necessari alla registrazione per accedere al portale</p>
                                    </div>

                                </div>
                                <div class="form-bottom">
                                    <form role="form" action="Registration" method="post" class="registration-form">
                                        <div class="form-group">
                                            <label class="sr-only" for="form-first-name">Nome</label>
                                            <input required type="text" name="name" placeholder="Nome" maxlength="255" class="form-first-name form-control" id="form-first-name">
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="form-last-name">Cognome</label>
                                            <input required type="text" name="surname" placeholder="Cognome" maxlength="255" class="form-last-name form-control" id="form-last-name">
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="form-nickname">Nickname</label>
                                            <input required type="text" name="nickname" placeholder="Nickname" maxlength="255" class="form-nickname form-control" id="form-nickname">
                                        </div>

                                        <div class="form-group">
                                            <label class="sr-only" for="form-email">Email</label>
                                            <input required type="email" name="email" placeholder="Email" maxlength="255" class="form-email form-control" id="form-email">
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="form-password">Password</label>
                                            <input required type="password" name="password" pattern= "(?=.*\d)(?=.*[a-z]).{8,}" placeholder="Password" maxlength="255" class="form-password form-control" id="form-password">
                                        </div>
                                        <div class ="form-group">
                                            <div id="pswd_info">
                                                <h4>La password deve avere:</h4>
                                                <ul>
                                                    <li id="letter" class="invalid">Almeno <strong>una lettera in minuscolo</strong></li>
                                                    <li id="capital" class="invalid">Almeno <strong>una lettera in maiuscolo</strong></li>
                                                    <li id="number" class="invalid">Almeno <strong>un numero</strong></li>
                                                    <li id="length" class="invalid">Almeno <strong>8 caratteri</strong></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn">Registrati</button>
                                    </form>


                                </div>


                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>

        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>