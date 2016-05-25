<%-- 
    Document   : newRestaurantForm
    Created on : 24-mag-2016, 15.04.14
    Author     : riccardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Restaurant</title>
    </head>
    <body>
        <form action="NewRestaurant" method="post">
            <input type="text" maxlength="25" minlength="1" placeholder="name*" id="name" name="name">
            <input type="text" maxlength="32000" minlength="1" placeholder="description* (at least 100 characters)" id="description" name="description">
            <input type="text" maxlength="255" minlength="1" placeholder="address*" id="address" name="address">
            <input type="text" maxlength="255" placeholder="web_site_url" id="web_site_url" name="web_site_url">
            <input type="submit" value="create"> <br>
            <h3> ${formNotValid}
            
        </form>
    </body>
</html>
