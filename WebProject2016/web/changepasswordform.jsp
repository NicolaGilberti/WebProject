<%-- 
    Document   : changepasswordform
    Created on : 27-set-2016, 15.36.43
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reimposta la password</title>


        <script src="http://code.jquery.com/jquery-1.7.min.js"></script>
        <script src="js/passwordstrength.js"></script>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/form-elements.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/passwordstrength.css">
    </head>
    <body>
        <div class="inner-bg">
            <div class="container">

                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 text">
                        <h1 style="color: white"><strong>TuttoBistrò</strong> | Reimposta la password</h1>

                    </div>
                </div>

                <div class="row">

                    <div class="col-md-offset-3 col-sm-12 col-md-6">

                        <div class="form-box">
                            <div class="form-top">
                                <div class="form-top-left">
                                    <h3>Cambia password</h3>
                                    <p>Inserisci una nuova password con la quale accedere.</p>
                                </div>

                            </div>
                            <div class="form-bottom">
                                <form action="ChangePasswordQuery" method="POST" class="registration-form" role="form" >
                                    <div class="form-group">
                                        <label class="sr-only" for="form-password">Password</label>
                                        <input required type="password" name="password" placeholder="Password" maxlength="255" class="form-password form-control" id="form-password" pattern= "(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn">Reimposta</button>
                                        <input type="text" name="id" value='<%=request.getAttribute("id")%>' hidden>

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

                                </form>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
