<%-- 
    Document   : currentUser
    Created on : 22-set-2016, 16.26.18
    Author     : nicol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <title>TuttoBistrò - User</title>

        <style>
            img {
                max-width: 100%;
            }
            div {
                /*max-width: 100%;*/
                /*border: 1px solid black;*/
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="userImage col-sm-4">
                    <img src="img/user.jpg" />
                </div>
                <div class="userName col-sm-6" >
                    <div class="row">
                        <h1 class="col-sm-11">Nicola Schiavon</h1>
                        <form class="col-sm-1" action="#" method="post">
                            <input type="submit" value="Modifica" />
                        </form>
                    </div>

                    <div class="row">
                        <p class="col-sm-11 userNickname">
                            nicolaburetta
                        </p>
                        <form class="col-sm-1" action="#" method="post">
                            <input type="submit" value="Modifica" />
                        </form>
                    </div>
                    <div class="row">
                        <p class="col-sm-11 userEmail">
                            nicolaburetta@gmail.com
                        </p>
                        <form class="col-sm-1" action="#" method="post">
                            <input type="submit" value="Modifica" />
                        </form>
                    </div>
                    <div class="row">
                        <p class="userLastLog">
                            ultimo accesso 12:34
                        </p>
                    </div>

                </div>
                <div class="col-sm-2">
                    <form action="#" method="post">
                        <input type="submit" value="Log out" />
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <h2>Le mie ultime recensioni</h2>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-2">
                    <h3>S S S S S</h3>
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
                    <h3>S S S S S</h3>
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
                    <h3>S S S S S</h3>
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


        </div>
    </body>
</html>

<script>

</script>