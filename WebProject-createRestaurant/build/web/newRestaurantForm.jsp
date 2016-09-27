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
    </head>
    <body>
        <% HttpSession ses = request.getSession(false); 
        User userId = (User) ses.getAttribute("utente");
        if (userId!=null) {   %>
        <form action="NewRestaurant" method="post">
            <input type="text" maxlength="25" required placeholder="nome*" id="nome" name="nome">
            <input type="text" maxlength="32000" required placeholder="descrizione*" id="descrizione" name="descrizione">
            <input type="url" placeholder="URL sito" id="URL_sito" name="URL_sito">
            <input type="tel" pattern="\d*" placeholder="numero tel" id="telefono" name="telefono">
            <input type="email" placeholder="indrizzo email" id="email" name="email">
            
            <input type="text" maxlength="255" placeholder="indrizzo" id="indrizzo" name="indrizzo">
            
            <input type="number" placeholder="CAP" id="cap" name="cap">
            <input type="text" maxlength="255" placeholder="città" id="citta" name="citta">
            <select name="stato" >
                <%  
                StateQueries sq = new StateQueries();
                ResultSet rs = sq.states();
                while (rs.next()) {
                %>
                    <option value="<%=rs.getString(1)%>"> <%=rs.getString(1)%> </option>
                <%
                }  
                %>
            </select>
            <input type="submit" value="create"> <br>
        }
        else {
        %>
            <jsp:forward page="UserNotAuthenticated.html" />
        <% }
        %>
        </form>
    </body>
</html>
