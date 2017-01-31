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
<%@page import="beans.RestaurantBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="it">
    <head>
        <!--meta-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <!--script-->
        <jsp:include page="header/headerFiles.jsp" />
        <script src="js/likesReviewFunction.js" type="text/javascript"></script>
        <script src="js/kjua-0.1.1.min.js" type="text/javascript"></script>

        <!--css-->
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/search_restaurant.css">
        <link rel="stylesheet" href="css/restaurantPage.css">

        <style>
            /* Always set the map height explicitly to define the size of the div
             * element that contains the map. */
            #map {
                height: 250px;

            }
        </style>

        <title>${r.name} - TuttoBistro</title>
    </head>
    <body>
        <!-- header -->
        <jsp:include page="header/header.jsp"></jsp:include>


            <!-- carousel -->

            <div class="container">
                <div id="myCarousel" class="col-md-12 col-lg-12 col-sm-12 col-xs-12 carousel slide" data-ride="carousel">
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
                                <img src="${current}" class="carousel-img img-rounded" alt="${current}">
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
        </div>

        <!--infos-->
        <div class="container">
            <!--left-->
            <!--name-->
            <div class="col-lg-6 col-sm-12 col-xs-12 col-md-6">
                <h2><c:out value="${r.name}"></c:out></h2>

                    <p></p>
                    <p> <span class="glyphicon glyphicon-globe"></span> <c:out value="${r.address}"/></p>
                <!-- stars -->
                <div c>
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

                    <!-- opening hours -->
                    <p>
                        orari di apertura: <br>
                    <c:forEach items="${openingDates}" var="odIterator">
                        <c:out value="${odIterator}"></c:out> <br>
                    </c:forEach>
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

            <!--right-->
            <!-- qrcode -->
            <script>
                var name = "${r.name}";
                var address = "${r.address}";
                var openingDates = "${openingDates}";
            </script>
            <div class="col-lg-6 col-sm-12 col-xs-12 col-md-6">
                <p></p>

                <div class="text-right">
                    <div style="cursor: pointer" id="qrCodeSmall">

                    </div>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="qrModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">

                        <div class="modal-body" style="align-content: center;">
                            <div id="qrCodeBig" style="align-content: center;">

                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <div class="col-lg-6 col-sm-12 col-xs-12 col-md-6">
                <script>
                    var name = "${r.name}";
                    var latitude = "${r.latitude}";
                    var longitude = "${r.longitude}";
                </script>
                <div id="map"></div>
            </div>
        </div> 

        <div class="container">
            <!-- description -->
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h3> Descrizione </h3> <br>
                <blockquote style="border-color:#900c3f;">
                    <c:out value="${r.description}" />
                </blockquote>
            </div>


            <!-- recensioni -->

            <h3> Recensioni </h3>
            <c:set value="0" var="i"></c:set>
            <c:forEach items="${reviews}" var="current">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 style="font: bold;"><c:out value="${current.name}"/> 
                            <div>
                                <small class="text-muted">
                                    <c:out value='${userNicknamesOfReviews.get(i)}'/> 
                                    <wbr>|<wbr>
                                    <c:out value="${current.data_creation}"/>
                                    <div class="col-stars">
                                        <%-- stelle piene --%>
                                        <c:forEach var="c" begin="1" end="${r.global_value}">
                                            <span class="glyphicon glyphicon-star"></span>
                                        </c:forEach>
                                        <%-- stelle vuote --%>
                                        <c:forEach var="c" begin="${r.global_value + 1}" end="5">
                                            <span class="glyphicon glyphicon-star-empty"></span>
                                        </c:forEach>
                                    </div>
                                    <div>
                                        CIBO: <c:out value="${current.food}" /> 
                                        |
                                        QUALITA'/PREZZO: <c:out value="${current.value_for_money}" />
                                        |
                                        ATMOSFERA: <c:out value="${current.atmosphere}" />
                                        |
                                        SERVIZIO: <c:out value="${current.service}" />
                                    </div>
                                    <label style ="color: green" onclick="like(${current.id}, 1,${user.id})">
                                        Mi piace </label>
                                    <label id="${current.id}-1"><c:out value="${likes.get(i)}"/></label>
                                    |
                                    <label style="color:red" onclick="like(${current.id}, 0,${user.id})">
                                        Non mi piace  </label> 
                                    <label id="${current.id}-0"><c:out value="${dislikes.get(i)}"/></label>

                                </small>

                            </div>

                        </h4>
                    </div>
                    <div class="panel-body">
                        <c:out value="${current.description}"></c:out>
                        </div>
                        <div class='panel-footer'>
                            <img id="photo" src="${photoPaths.get(i)}" style="max-height: 50px; max-width: 50px;">
                        <!-- Modal -->
                        <div class="modal fade" id="photosModal" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <span class="close">&times;</span>
                                    <div class="modal-body" style="align-content: center;">
                                        <img src="${photoPaths.get(i)}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:out value="${replies.get(i)}"/>
                    </div>
                </div>
                <c:set value="${i+1}" var="i"></c:set>
            </c:forEach>


            <!--newReview-->
            <c:if test="${sessionScope.user!=null}">
                <form action="NewReview" method="post" enctype="multipart/form-data">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-4 col-xs-6 col-sm-8 col-lg-4">
                                        <input required type="text" placeholder="Com'è il ristorante?" class="form-control" id="name" name='name'>
                                    </div>
                                    <div class="col-md-8 col-xs-6 col-sm-4 col-lg-8 text-right">
                                        <button type=" submit" class="btn btn-primary">Invia</button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2 col-lg-2 col-sm-8 col-xs-8">
                                        <input required placeholder="stelle (0-5)" type="number" id="stars" name='stars' min="0" max="5" class="form-control">
                                    </div>
                                    <div class="col-md-2 col-lg-2 col-sm-8 col-xs-8">
                                        <input required placeholder="cibo (0-5)" type="number" id="food" name='food' min="0" max="5" class="form-control">
                                    </div>
                                    <div class="col-md-2 col-lg-2 col-sm-8 col-xs-8">
                                        <input required placeholder="qual/prez (0-5)" type="number" id="valueForMoney" name='valueForMoney' min="0" max="5" class="form-control">
                                    </div>
                                    <div class="col-md-2 col-lg-2 col-sm-8 col-xs-8">
                                        <input required placeholder="atmosfera (0-5)" type="number" id="atmosphere" name='atmosphere' min="0" max="5" class="form-control">
                                    </div>
                                    <div class="col-md-2 col-lg-2 col-sm-8 col-xs-8">
                                        <input required  placeholder="servizio (0-5)" type="number" id="service" name='service' min="0" max="5" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                    <textarea required class="form-control" rows="3"  placeholder="la tua esperienza..." id="description" name='description'></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                                    <label class="label-text" for="nome">Carica una foto</label>
                                    <input accept="image/jpeg,image/gif,image/png" type="file" class="form-control" id="foto" name="foto" multipart>
                                </div>
                            </div>
                        </div>
                    </div> 
                    <input type='hidden' name="restaurantId" value="${r.id}">
                </form>
            </c:if>
        </div>

        <script type="text/javascript" src="js/map.js"></script>
        <script type="text/javascript" src="js/modalForReviews.js"></script>
        <script type="text/javascript" src="js/qrCreator.js"></script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCM8Aa2NRfiQZrc73Jj34ssPJV7bXPX7Qs&callback=initMap"></script>

    </body>
</html>
