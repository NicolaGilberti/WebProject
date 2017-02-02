<%-- 
    Document   : currentUser
    Created on : 22-set-2016, 16.26.18
    Author     : nicol
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="header/headerFiles.jsp" />
        <link href="css/userpage.css" rel="stylesheet">
        <link href="css/resultsStyle.css" rel="stylesheet">
        <link rel="stylesheet" href="css/passwordstrength.css">

        <title>TuttoBistrò - Profilo Utente</title>

    </head>
    <body>

        <!-- header -->
        <jsp:include page="header/header.jsp" />

        <%-- pannello modal per la visualizzazione delle foto --%>
        <div id="photo-modal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content photo-modal-content">
                    <img id="photo-modal-img" src="" >
                </div>

            </div>
        </div>

        <%-- pannello modal per la modifica del nickname --%>
        <div id="changeNickname" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modifica nickname</h4>
                    </div>
                    <form method="post" action="ChangeUserNickname">
                        <div class="modal-body">
                            <p>

                                <label for="newNickname">Nuovo nickname:</label>
                                <input type="text" class="form-control" id="newNickname" name="newNickname" required />
                                <label for="pwd">Password:</label>
                                <input type="password" class="form-control" id="nicknamePwd" name="nicknamePwd" required />

                            </p>
                        </div>
                        <div class="modal-footer">

                            <button type="submit" class="btn btn-default">Salva</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Annulla</button>

                        </div>
                    </form>
                </div>

            </div>
        </div>

        <%-- pannello modal per la modifica della password --%>
        <div id="changePassword" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modifica password</h4>
                    </div>
                    <form method="post" action="ChangeUserPassword" onsubmit="return checkNewPwd()">
                        <div class="modal-body">
                            <p>

                                <label for="oldPwd">Vecchia password:</label>
                                <input type="password" class="form-control" id="oldPwd" name="oldPwd" required >
                                <label for="newPwd" id="label-newPwd">Nuova password:</label>
                                <input type="password" class="form-password form-control" id="newPwd" name="newPwd" pattern= "(?=.*\d)(?=.*[a-z]).{8,}" required >

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

                            <label for="newPwd2" id="label-newPwd2">Ripeti password:</label>
                            <input type="password" class="form-control" id="newPwd2" name="newPwd2" pattern= "(?=.*\d)(?=.*[a-z]).{8,}" required >

                            </p>
                        </div>
                        <div class="modal-footer">

                            <button type="submit" class="btn btn-default">Salva</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" id="annulla-btn">Annulla</button>

                        </div>
                    </form>
                </div>

            </div>
        </div>

        <div class="container">
            
            <%-- controllo se esiste un alert e se esiste lo stampo a schermo.
            Un alert puo venire generato dalla servlet che modifica la password (richiamata
            al click del bottone "salva" nell'apposito modal panel in alto) oppure dalla
            servlet che modifica il nickname (allo stesso modo della password). --%>
            <c:if test="${alert.type gt -1}">
                <div class="user-alert-box">
                    <c:choose>
                        <c:when test="${alert.type == 0}">
                            <div class="alert alert-success fade in">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>
                                    <c:out value="${alert.title}" />
                                </strong>
                                <c:out value="${alert.description}" />
                            </div>
                        </c:when>
                        <c:when test="${alert.type == 1}">
                            <div class="alert alert-danger fade in">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>
                                    <c:out value="${alert.title}" />
                                </strong>
                                <c:out value="${alert.description}" />
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </c:if>
            <%-- fine alert --%>

            <%-- INFORMAZIONI UTENTE --%>
            <div class="user-info">
                
                <%-- nome e cognome --%>
                <div class="row">
                    <div class="col-md-12">
                        <h1 style="color: #900c3f">
                            <c:out value="${user.name} ${user.surname}" />
                        </h1>
                    </div>
                </div>
                <br>

                <%-- nickname --%>
                <div class="row">

                    <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                        <span class="iconInfo glyphicon glyphicon-user"></span>
                    </div>
                    <div class="col-xs-8 col-sm-4 col-md-3 col-lg-3">
                        <p class="pUser">
                            <c:out value="${user.nickname}" />
                        </p>
                    </div>
                        
                    <%-- bottone di modifica nickname --%>
                    <div class="col-xs-2 col-sm-6 col-md-8 col-lg-8">
                        <button type="button" class="iconButton" data-toggle="modal" data-target="#changeNickname"><span class="glyphicon glyphicon-pencil"></span></button>
                    </div>

                </div>
                    
                <%-- email --%>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                        <span class="iconInfo glyphicon glyphicon-envelope"></span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-11 col-lg-11">
                        <p class="pUser">
                            <c:out value="${user.email}" />
                        </p>
                    </div>
                    <div class="col-xs-2"></div>
                </div>
                        
                <%-- ultimo accesso --%>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                        <span class="iconInfo glyphicon glyphicon-time"></span>
                    </div>
                    <div class="col-xs-8 col-sm-10 col-md-11 col-lg-11">
                        <p class="pUser">
                            Ultimo accesso: 
                            <c:out value="${user.last_log}" />
                        </p>
                    </div>
                    <div class="col-xs-2"></div>
                </div>
                        
                <%-- bottone di modifica password --%>
                <div class="row">
                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-xs-12 col-sm-11 col-md-11 col-lg-11">
                        <button type="button" class="btn btn-default col-xs-center" data-toggle="modal" data-target="#changePassword">Modifica password</button>
                    </div>
                </div>

            </div>


            <%-- I MIEI RISTORANTI --%>

            <%-- controllo se l'utente in sessione puo avere ristoranti e se li ha
            effettivamente --%>
            <c:if test="${user.type gt 0 && fn:length(restaurants) gt 0}">

                <hr class="style15">

                <div class="row">
                    <div class="user-restaurants-title col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <h2 class="user-restaurants user-title col-xs-center">I miei ristoranti</h2>
                    </div>
                </div>

                <%-- visualizzazione ristoranti tramite panels --%>
                <div class="row" id="row-thumbnail">

                    <c:forEach items="${restaurants}" var="restaurant">
                        <div class="col-sm-6 col-xs-12 col-md-4 col-centered">
                            <div class="thumbnail">
                                <div class="module">
                                    <img class="module img-responsive" src="img/restImgs/<c:out value='${restaurant.imgPath}' />" alt="Nessuna immagine disponibile">
                                    <div class="overlay"></div>
                                    <header>
                                        <h1>
                                            <a style="color: white; text-decoration: none;" href="RestaurantRequest?id=${restaurant.id}">
                                                <c:out value='${restaurant.name}' />
                                            </a>
                                        </h1>
                                        <div>
                                            <c:forEach var="i" begin="1" end="${restaurant.global_value}">
                                                <span class="pull-right glyphicon glyphicon-star val"></span>
                                            </c:forEach>
                                        </div>
                                    </header>
                                </div>
                                <div class="caption">
                                    <div class="cuisine-labels">
                                        <c:forEach var="cuisine" items="${restaurant.cuisineTypes}">
                                            <span class="label label-info">
                                                <c:out value="${cuisine.name}" />
                                            </span>
                                        </c:forEach>
                                        <p class="pull-right">
                                            <c:out value="${restaurant.numReviews}" />
                                            <c:choose>
                                                <c:when test="${restaurant.numReviews eq 1}">
                                                    Recensione
                                                </c:when>
                                                <c:otherwise>
                                                    Recensioni
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                    <p>
                                        <span class="glyphicon glyphicon-globe"></span>
                                        <c:out value="${restaurant.address}" />
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>

                <%-- bottone per aggiunta di un nuovo ristorante. 
                Reindirizzamento alla pagina di inserimento ristorante --%>
                <div class="row add-restaurant-row">
                    <div class="col-sm-3"></div>
                    <div class="add-restaurant-btn col-xs-12 col-sm-6">
                        <h1>Aggiungi ristorante</h1>
                        <a class="add-restaurant-link" href="PrepareNewRestaurantForm"></a>
                    </div>
                </div>

            </c:if>

            <%-- fine ristoranti --%>


            <%-- LE MIE ULTIME RECENSIONI --%>

            <%-- controllo che effettivamente esistano reviews --%>
            <c:if test="${fn:length(reviews) gt 0}" >

                <hr class="style15">

                <%-- titolo --%>
                <div class="row">
                    <div class="col-sm-12">
                        <h2 class="user-reviews user-title col-xs-center">Le mie ultime recensioni</h2>
                    </div>
                </div>

                <%-- reviews organizzate in panels (classe di bootstrap) --%>
                <div class="panel-group">
                    <c:forEach var="r" items="${reviews}">
                        <div class="panel panel-default panel-review">
                            <div class="panel-heading panel-outer">
                                <div class="panel-heading-inner"></div>
                                <div class="row">
                                    
                                    <%-- titolo --%>
                                    <div class="panel-title col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <h3>
                                            <c:out value="${r.name}" />
                                        </h3>
                                    </div>
                                        
                                    <%-- valutazione (stelle) --%>
                                    <div class="col-stars col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <c:forEach var="i" begin="1" end="${r.global_value}">
                                            <span class="glyphicon glyphicon-star"></span>
                                        </c:forEach>
                                    </div>
                                    
                                    <%-- valutazione nei singoli campi --%>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="valutations">
                                            
                                            <%-- cibo --%>
                                            <span class="label label-warning label-review">CIBO: 
                                                <span class="badge badge-review">
                                                    <c:out value="${r.food}" />
                                                </span>
                                            </span>
                                                
                                            <%-- qualita/prezzo --%>
                                            <span class="label label-warning label-review">QUALITA'/PREZZO: 
                                                <span class="badge badge-review">
                                                    <c:out value="${r.value_for_money}" />
                                                </span>
                                            </span>
                                                
                                            <%-- atmosfera --%>
                                            <span class="label label-warning label-review">ATMOSFERA: 
                                                <span class="badge badge-review">
                                                    <c:out value="${r.atmosphere}" />
                                                </span>
                                            </span>
                                                
                                            <%-- servizio --%>
                                            <span class="label label-warning label-review">SERVIZIO: 
                                                <span class="badge badge-review">
                                                    <c:out value="${r.service}" />
                                                </span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                                
                                <%-- nome e citta ristorante --%>
                                <div class="row">
                                    <div class="review-rest col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <h4>
                                            <c:out value="${r.restaurant_name}" />
                                            <small class=" review-sm-date text-muted">
                                                <c:out value="${r.restaurant_city} - ${fn:split(r.data_creation, ' ')[0]}" />
                                            </small>
                                        </h4>
                                        <h4 class="review-xs-date">
                                            <small class="text-muted">
                                                <c:out value="${r.restaurant_city} - ${fn:split(r.data_creation, ' ')[0]}" />
                                            </small>
                                        </h4>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <c:out value="${r.description}" />
                            </div>
                            
                            <%-- inserimento foto (se esistono) --%>
                            <c:if test="${r.photo_name != ''}">
                                <div class="panel-footer panel-outer">
                                    <div class="photos-container">
                                        <div class="review-photo">
                                            <a data-toggle="modal" data-target="#photo-modal" <%--onclick="setModalImage('<c:out value='${r.photo_name}' />')"--%>>
                                                <img src="
                                                     <c:out value='${r.photo_name}' />
                                                     " >
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>

            </c:if>

            <%-- fine recensioni --%>

        </div>

        <!-- js files -->
        <script src="js/checkNewPwd.js"></script>
        <script src="js/changeUserPwd.js"></script>
        <script src="js/scripts.js"></script>
        <script src="js/UserPageModalImages.js"></script>

    </body>
</html>
