<%-- 
    Document   : changepasswordform
    Created on : 27-set-2016, 15.36.43
    Author     : David
--%>

<!DOCTYPE html>
<html lang="it">

    <head>

        <jsp:include page="header/headerFiles.jsp" />

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>TuttoBistrò Reimposta password dimenticata</title>

        <!-- CSS -->
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
        <link rel="stylesheet" href="css/form-elements.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/form-elements.css">
        <link rel="stylesheet" href="css/passwordstrength.css">

        <!-- scripts -->
        <script src="js/passwordstrength.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>

        <!--/scripts-->
    </head>

    <body>
        <jsp:include page="header/header.jsp" />
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
                                        <h3>Reimposta password</h3>
                                        <p>Reimposta la password per continuare ad utilizzare il tuo account</p>
                                    </div>

                                </div>
                                <div class="form-bottom">
                                    <form role="form" action="ChangePasswordSetter" method="post" class="registration-form">

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

                                        <input type="hidden" name="id">
                                        <input type="hidden" name="cod">
                                        <button type="submit" class="btn">Reimposta</button>
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