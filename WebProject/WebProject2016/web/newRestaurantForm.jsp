<%-- 
    Document   : newRestaurantForm
    Created on : 24-mag-2016, 15.04.14
    Author     : riccardo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dao.StateDAO"%>
<%@page import="beans.UserBean"%>
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
        <% HttpSession ses = request.getSession(false); 
        UserBean userId = (UserBean) ses.getAttribute("user");
        if (userId!=null) {   %>
        <div class="container">
            <h2>New Restaurant Form</h2>
            <form action="NewRestaurant" method="post">
                <div class="row">
                <div class="form-group">
                    <div class="col-md-6">
                        <label for="nome">Nome:</label>
                        <input type="nome" class="form-control" id="nome" placeholder="Inserisci un nome" required="true" maxlength="50">
                    </div>
                </div>
                </div>
                <p></p>
                <div class="row">
                <div class="form-group">
                    <div class="col-md-12">
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
                <div class="col form-group">
                    <div class="col-md-6">
                    <label for="URL_sito">URL sito esterno:</label>
                    <input type="url" class="form-control" id="URL_sito" placeholder="">
                    </div>
                </div>
                <div class="col form-group">
                    <div class="col-md-6">
                    <label for="telefono">Numero Telefonico:</label>
                    <input type="tel" pattern="\d*" class="form-control" id="telefono" placeholder="">
                    </div>
                </div>
                </div>
                <p></p>
                <div class="row">
                <div class="col form-group">
                    <div class="col-md-6">
                    <label for="email">e-mail:</label>
                    <input class="form-control" type="email" placeholder="indrizzo email" id="email" name="email">
                    </div>
                </div>
                <div class="col form-group">
                    <div class="col-md-6">
                    <label for="indrizzo">Indrizzo:</label>
                    <input class="form-control" type="text" maxlength="255" placeholder="indrizzo" id="indrizzo" name="indrizzo">
                    </div>
                </div>
                </div>
                <p></p>
                <div class="row">
                <div class="col form-group">
                    <div class="col-md-2">
                    <label for="CAP">CAP:</label>
                    <input class="form-control" type="number" placeholder="CAP" id="cap" name="cap">
                    </div>
                </div>
                <div class="col form-group">
                    <div class="col-md-6">
                    <label for="citta">città:</label>
                    <input class="form-control" type="text" maxlength="255" placeholder="città" id="citta" name="citta">
                    </div>
                </div>
                </div>
                <p>
                <div class="row">
                <div class="col-md-6">
                <select>
                    <%
                        StateDAO sq = new StateDAO();
                        ResultSet rs = sq.states();
                        while (rs.next()) {
                    %>
                    <option><%=rs.getString(1)%></option>
                    <%
                        }
                    %>
                </select>
                </div>
                <hr>
                </div>
                <p></p>
                <div class="row col-md-6">
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
