<%-- 
    Document   : newRestaurantForm
    Created on : 24-mag-2016, 15.04.14
    Author     : riccardo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.StateDAO"%>
<%@page import="beans.UserBean"%>
<%@page import="java.net.*"%>
<%@page import="servlets.prepareNewRestaurantForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Nuovo Ristorante - TuttoBistro</title>
        
        <!-- script -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <jsp:include page="header/headerFiles.jsp" />

        <!-- css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/newRestaurantForm.css">


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    </head>
    <body>
        <% HttpSession ses = request.getSession(false); 
        UserBean userId = (UserBean) ses.getAttribute("user");
        if (userId!=null) {   %>
        
        <!-- header -->
        <jsp:include page="header/header.jsp" />
        
        <div class="container">
            <h2>Inserisci nuovo ristorante</h2>
            <hr class="customized">
            <form action="NewRestaurant" method="post">
                <div class="row">
                <div class="form-group">
                    <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                        <label for="nome">Nome:</label>
                        <input type="nome" class="form-control" id="nome" placeholder="Inserisci un nome" required="true" maxlength="50">
                    </div>
                </div>
                </div>
                <p></p>
                <div class="row">
                <div class="form-group">
                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                        <label for="descrizione">Descrizione:</label>
                        <textarea type="descrizione" class="form-control" id="descrizione" 
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
                    <input type="url" class="form-control" id="URL_sito" placeholder="">
                </div>
                <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 form-group">
                    <label for="telefono">Numero Telefonico:</label>
                    <input type="tel" pattern="\d*" class="form-control" id="telefono" placeholder="">
                </div>
                </div>
                <p></p>
                <div class="row">
                <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 form-group">
                    <label for="email">e-mail:</label>
                    <input class="form-control" type="email" placeholder="indrizzo email" id="email" name="email">
                </div>
                <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 form-group">
                    <label for="indrizzo">Indrizzo:</label>
                    <input class="form-control" type="text" maxlength="255" placeholder="indrizzo" id="indrizzo" name="indrizzo">
                </div>
                </div>
                <p></p>
                <div class="row">
                <div class="col-md-2 col-lg-2 col-sm-2 col-xs-2 form-group">
                    <label for="CAP">CAP:</label>
                    <input class="form-control" type="number" placeholder="CAP" id="cap" name="cap">
                </div>
                <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 form-group">
                    <label for="citta">città:</label>
                    <input class="form-control" type="text" maxlength="255" placeholder="città" id="citta" name="citta">
                </div>
                </div>
                <p>
                <div class="row">
                <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                    <div class="form-group">
                        <label for="sel1">state:</label>
                        <select class="form-control" id="sel1">
                        <c:forEach items="${states}" var="state">
                                <option>
                                    <c:out value="${state}">
                                    </c:out>
                                </option>
                        </c:forEach>
                        </select>
                    </div>
                </div>
                </div>
                
                <div class="checkbox">
                    <c:set var="counter" value="0"></c:set>
                    <c:forEach items="${restaurantTypes}" var="type">
                        <div class="col-md-3 col-lg-4 col-sm-6 col-xs-6">
                            <label><input type="checkbox" value="${type}">${type}</label>
                        </div> 
                    </c:forEach>
                </div>
                <p></p>
                <hr class="customized">
                <p></p>
                <div class="row col-md-6 col-lg-12 col-sm-12 col-xs-12">
                <button type="submit" class="btn btn-default">Submit</button>
                <button type="reset" class="btn btn-warning">Reset</button>
                </div>
            </form>
        </div>
        <%
        }
        else {
        %>
        <jsp:forward page="UserNotAuthenticated.html" />
        <% }
        %>
    </form>
</body>
</html>
