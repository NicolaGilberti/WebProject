<%-- 
    Document   : newRestaurantForm
    Created on : 24-mag-2016, 15.04.14
    Author     : riccardo, Mirko
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="week" value="${['Lunedì','Martedì','Mercoledì','Giovedì','Venerdì','Sabato','Domenica']}" scope="application" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Nuovo Ristorante - TuttoBistro</title>

        <!-- script -->
        <jsp:include page="header/headerFiles.jsp" />
        <script src="js/checksrestaurantform.js"></script> 

        <!-- css -->
        <link rel="stylesheet" href="css/newRestaurantForm.css">

    </head>
    <body>

        <!-- header -->
        <jsp:include page="header/header.jsp" />

        <div class="container">
            <h2>Inserisci nuovo ristorante</h2>
            <hr class="customized">
            <form action="NewRestaurant" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="form-group">
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                            <label for="nome">Nome del ristorante:</label>
                            <input required type="nome" class="form-control" id="nome" name="nome" placeholder="Inserisci un nome"  maxlength="50">
                        </div>

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                            <label for="nome">Carica una foto</label>
                            <input type="file" class="form-control" id="foto" name="foto">
                        </div>
                    </div>


                </div>
                <p></p>
                <div class="row">
                    <div class="form-group">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                            <label for="descrizione">Descrizione:</label>
                            <textarea required type="descrizione" class="form-control" id="descrizione" name="descrizione"
                                      placeholder="Inserisci una descrizione" required="true" maxlength="32000"
                                      rows="5">
                            </textarea>
                        </div>
                    </div>
                </div>
                <p></p>
                <div class="row">
                    <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 form-group">
                        <label for="URL_sito">URL sito esterno:</label>
                        <input type="url" class="form-control" name="URL_sito" id="URL_sito" placeholder="">
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 form-group">
                        <label for="telefono">Numero Telefonico:</label>
                        <input type="tel" pattern="\d*" class="form-control" id="telefono" name="telefono" placeholder="">
                    </div>
                </div>
                <p></p>
                <div class="row">
                    <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 form-group">
                        <label for="email">E-mail:</label>
                        <input class="form-control" type="email" placeholder="indirizzo email" id="email" name="email">
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 form-group">
                        <label for="indrizzo">Indirizzo:</label>
                        <input required class="form-control" type="text" maxlength="255" placeholder="indirizzo" id="indrizzo" name="indirizzo">
                    </div>
                </div>
                <p></p>
                <div class="row">
                    <div class="col-md-2 col-lg-2 col-sm-2 col-xs-2 form-group">
                        <label for="CAP">CAP:</label>
                        <input required class="form-control" type="number" placeholder="CAP" id="cap" name="cap">
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 form-group">
                        <label for="citta">Città:</label>
                        <input required class="form-control" type="text" maxlength="255" placeholder="città" id="citta" name="citta">
                    </div>
                </div>
                <p>
                <div class="row">
                    <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                        <div class="form-group">
                            <label for="sel1">Stato:</label>
                            <select required class="form-control" id="sel1" name="stato">
                                <c:forEach items="${states}" var="state">
                                    <option value="${state.id}">
                                        ${state.name}

                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                        <div class="form-group">
                            <label for="selprice">Seleziona la fascia di prezzo del tuo ristorante:</label>
                            <select required class="form-control" id="selprice" name="pricerange">
                                <c:forEach items="${rangeList}" var="range">
                                    <option value="${range.id}">
                                        ${range.min_value} -  ${range.max_value} euro

                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <label >Seleziona l'orario di apertura del tuo ristorante.</label>
                    <div class="checkbox">
                        <c:forEach items="${ohList}" var="oh">
                            <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                                <label><input type="checkbox" name="openinghour" value="${oh.id}">${week[oh.day-1]}   ${oh.openHS} - ${oh.closeHS}</label>
                            </div> 
                        </c:forEach>
                    </div>
                </div>




                <div class="row">
                    <label >Seleziona i tipi di cucina del tuo ristorante.</label>
                    <div class="checkbox">
                        <c:set var="counter" value="0"></c:set>
                        <c:forEach items="${restaurantTypes}" var="type">
                            <div class="col-md-3 col-lg-4 col-sm-6 col-xs-6">
                                <label><input type="checkbox" name="cuisine" value="${type.id}">${type.name}</label>
                            </div> 
                        </c:forEach>
                    </div>

                    <div class="row col-md-6 col-lg-12 col-sm-12 col-xs-12 btn-padding">
                        <button type="submit" class="btn btn-default" onclick="return checkforms();">Inserisci</button>
                        <button type="reset" class="btn btn-warning">Reset</button>
                    </div>
                </div>
            </form>
        </div>

    </form>
</body>
</html>
