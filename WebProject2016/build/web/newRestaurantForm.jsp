<%-- 
    Document   : newRestaurantForm
    Created on : 24-mag-2016, 15.04.14
    Author     : riccardo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.StateQueries"%>
<%@page import="beans.User"%>
<%@page import="java.net.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Restaurant</title>

        <!-- script -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            // ADD SLIDEDOWN ANIMATION TO DROPDOWN //
            $('.dropdown').on('show.bs.dropdown', function (e) {
                $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
            });

            // ADD SLIDEUP ANIMATION TO DROPDOWN //
            $('.dropdown').on('hide.bs.dropdown', function (e) {
                $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
            });
        </script>
        <!-- <script src="js/MapLib.js" type="text/javascript"></script-->

        <!-- css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>
        <!--% HttpSession ses = request.getSession(false); 
        User userId = (User) ses.getAttribute("utente");
        if (userId!=null) {   %-->
        <div class="container">
            <h2>New Restaurant Form</h2>
            <form action="NewRestaurant" method="post">
                <div class="form-group">
                    <label for="nome">Nome:</label>
                    <input type="nome" class="form-control" id="nome" placeholder="Inserisci un nome" required="true" maxlength="50">
                </div>
                <div class="form-group">
                    <label for="descrizione">Descrizione:</label>
                    <textarea type="descrizione" class="form-control" id="descrizione" 
                           placeholder="Inserisci una descrizione" required="true" maxlength="32000"
                           rows="5">
                    </textarea>
                </div>
                <div class="form-group">
                    <label for="URL_sito">URL sito esterno:</label>
                    <input type="url" class="form-control" id="URL_sito" placeholder="">
                </div>
                <div class="form-group">
                    <label for="telefono">Numero Telefonico:</label>
                    <input type="tel" pattern="\d*" class="form-control" id="telefono" placeholder="">
                </div>
                <div class="form-group">
                    <label for="email">e-mail:</label>
                    <input class="form-control" type="email" placeholder="indrizzo email" id="email" name="email">
                </div>
                <div class="form-group">
                    <label for="indrizzo">Indrizzo:</label>
                    <input class="form-control" type="text" maxlength="255" placeholder="indrizzo" id="indrizzo" name="indrizzo">
                </div>
                <div class="form-group">
                    <label for="CAP">CAP:</label>
                    <input class="form-control" type="number" placeholder="CAP" id="cap" name="cap">
                </div>
                <div class="form-group">
                    <label for="citta">città:</label>
                    <input class="form-control" type="text" maxlength="255" placeholder="città" id="citta" name="citta">
                </div>
                <select>
                    <%
                        StateQueries sq = new StateQueries();
                        ResultSet rs = sq.states();
                        while (rs.next()) {
                    %>
                    <option><%=rs.getString(1)%></option>
                    <%
                        }
                    %>
                </select>
                <button type="submit" class="btn btn-default">Submit</button>
                <button type="reset" class="btn btn-warning">Reset</button>
            </form>
        </div>
        <!--%
        }
        else {
        %-->
        <!--jsp:forward page="UserNotAuthenticated.html" /-->
        <!--% }
        %-->
    </form>
</body>
</html>
