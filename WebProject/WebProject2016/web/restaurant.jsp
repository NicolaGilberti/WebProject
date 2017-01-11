<%-- 
    Document   : restaurant
    Created on : 25-set-2016, 16.57.04
    Author     : RiccardoUni
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.io.OutputStream"%>
<%@page import="net.glxn.qrgen.image.ImageType"%>
<%@page import="net.glxn.qrgen.QRCode"%>
<%@page import="net.glxn.qrgen.QRCode"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="beans.Restaurant"%>
<%@page import="Servlet.qrGenerator" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
    <head>
        <!--meta-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!--meta-->


        <script type="text/javascript" src="js/login.js"></script> 

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDy1utuunJuJPAVmn-__YplB6DCwGhMidc"
        async defer></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- <script src="js/MapLib.js" type="text/javascript"></script>

        <!--css-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/search_resturant_css.css">
        <link href="css/resultsStyle.css" rel="stylesheet">
        <style>
            .carousel-inner > .item > img,
            .carousel-inner > .item > a > img {
                width: auto;
                height: 400px;
                margin: auto;
            }
        </style>
        <!--css-->
    

        <title>JSP Page</title>
    </head>
    <body onload="createMap(1.1, 1.1, 'map');">
        <!-- header -->
        <jsp:include page="header.jsp"></jsp:include>


            <!-- carousel -->
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                <c:forEach var="i" begin="0" end="${numberOfPhotos-1}">
                    <c:if test="${i==0}">
                        <li data-target="#myCarousel" data-slide-to="i" class="active tales"></li>
                        </c:if>
                        <c:if test="${i>0}">
                        <li data-target="#myCarousel" data-slide-to="i"></li>
                        </c:if>
                    </c:forEach>
            </ol>
            <!-- Wrapper for slides -->

            <div class="carousel-inner" role="listbox">
                <c:set value="0" var="i"></c:set>
                <c:forEach  items="${photos}" var="current">
                    <c:if test="${i==0}" >
                        <div class="item active">   
                        </c:if>
                        <c:if test="${i>0}" >  
                            <div class="item">
                            </c:if>
                            <img src="${current}" class="img-rounded" alt="${current}">
                        </div>
                        <c:set value="1" var="i"></c:set>    
                    </c:forEach>
                </div>
                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <!-- restaurant name -->
        <div class="container">
            <h2><c:out value="${r.name}"></c:out></h2>

                <!-- stars -->
                <div>
                <c:forEach begin="1" end="${r.global_value}">
                    <span class="glyphicon glyphicon-star"></span>
                </c:forEach>
                <c:forEach begin="${r.global_value+1}" end="5">
                    <span class="glyphicon glyphicon-star-empty"></span>
                </c:forEach>
            </div>
            <p></p>

            <!-- price range -->
            <div>
                <span class="glyphicon glyphicon-tag">
                </span>
                $ <c:out value="${minPrice}"></c:out> - <c:out value="${maxPrice}"></c:out>
                </div>

                <!-- cuisine types -->
                <p></p>
                <div class="cuisine-labels"> 
                <c:forEach items="${cuisines}" var="current">
                    <span class="label label-info" style="font-size: 14px;">
                        <c:out value="${current.name}"></c:out>
                        </span>
                </c:forEach>
            </div>
        </div>

        <!-- description -->
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <h3> Descrizione </h3>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <blockquote style="border-color:#900c3f;">
                        <c:out value="${r.description}" />
                    </blockquote>
                </div>
            </div>
        </div>

        <!-- recensioni -->
        <div class="container">
            <h3> Recensioni </h3>
            <c:set value="0" var="i"></c:set>
            <c:forEach items="${reviews}" var="current">
                <div class="panel panel-default" style="border-color:#900c3f;">
                    <div class="panel-heading">
                        <h4 style="font: bold;"><c:out value="${userNameOfReviews.get(i)}" />
                            <small class="text-muted">
                                <c:out value="${current.data_creation}" />
                            </small>
                        </h4>
                    </div>
                    <div class="panel-body">
                        <c:out value="${current.description}"></c:out>
                        </div>
                    </div>
                <c:set value="${i+1}" var="i"></c:set>
            </c:forEach>
        </div>
        <!-- map -->
        <button onclick="createMap(1.1, 1.1, 'map');">click for map</button>
        <div id="map" style="width: 300px; height: 200px;"></div>
    </body>
</html>
