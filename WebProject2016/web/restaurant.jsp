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

        <title>${r.name} - TuttoBistro</title>
    </head>
    <body>
        
        <!-- header -->
        <jsp:include page="header/header.jsp"></jsp:include>

        <!-- alerts -->
        <c:if test="${param.notReclamed != null}">
            <div class="alert">
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                Hai già reclamato questo ristorante!
            </div>
        </c:if>
        <c:if test="${param.reviewNotInsert != null}">
            <div class="alert">
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                Ci scusiamo, non è stato possibile inserire la review
            </div>
        </c:if>


        <!--new carousel -->
        <div class="container">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">

                    <c:forEach var="i" begin="0" end="${numberOfPhotos-1}">
                        <c:if test="${i==0}">
                            <li data-target="#carousel-example-generic" data-slide-to="i" class="active"></li>
                            </c:if>
                            <c:if test="${i>0}">
                            <li data-target="#carousel-example-generic" data-slide-to="i"></li>
                            </c:if>
                        </c:forEach>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <c:set value="0" var="i"></c:set>
                    <c:forEach  items="${photos}" var="current">
                        <c:if test="${i==0}" >
                            <div class="item active">   
                            </c:if>
                            <c:if test="${i>0}" >  
                                <div class="item">
                                </c:if>

                                <img src="${current}" alt="...">

                            </div>
                            <c:set value="1" var="i"></c:set>    
                        </c:forEach>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>


            <!--infos-->
            <div class="container">
                <!--left-->
                <!--name-->
                <div class="col-lg-6 col-sm-12 col-xs-12 col-md-6">
                    <h1 class="h1-restaurant-title"><c:out value="${r.name}"></c:out></h1>

                        <p></p>
                        <p class="restaurant-specs"> <span class="glyphicon glyphicon-globe"></span> <c:out value="${r.address}"/>, <c:out value="${r.city}"/>, <c:out value="${state.name}"/></p>
                    <!-- price range -->
                    <div>
                        <p class="restaurant-specs"><span class=" glyphicon glyphicon-tag"></span>  €<c:out value="${minPrice}"></c:out> - <c:out value="${maxPrice}"></c:out></p>
                        </div>
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

                    <!-- opening hours -->
                    <p class="restaurant-specs">Orari di apertura: <br>
                        <c:forEach items="${openingDates}" var="odIterator">
                            <c:out value="${odIterator}"></c:out> <br>
                        </c:forEach>
                        <!-- cuisine types -->
                    <div class="cuisine-labels"> 
                        <c:forEach items="${cuisines}" var="current">
                            <span class="cuisine-label label label-info" style="font-size: 14px;">
                                <c:out value="${current.name}"></c:out>
                                </span>
                        </c:forEach>
                    </div>

                    <!-- qrcode -->
                    <div class="row">
                        <p></p>
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="qr-code-small" id="qrCodeSmall">
                            </div>
                        </div>
                        <!-- Modal for QR -->
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
                    </div>
                    <!--reclame button-->
                        <div class="reclame">
                            <c:if test="${sessionScope.user != null}">
                                <form action="ReclameRestaurant" method="POST">
                                    <input name="restaurantID" hidden value="${r.id}">
                                    <button class="btn btn-outline-primary">Reclama Ristorante</button>
                                </form>
                            </c:if>
                        </div>
                </div>

                <!--right-->
                <script>
                    var name = "${r.name}";
                    var address = "${r.address}";
                    var openingDates = "${openingDates}";
                </script>

                <div class="maps-temporary-override col-lg-6 col-sm-12 col-xs-12 col-md-6">
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
                    <h2 class="h2-title"> Descrizione </h2> <br>
                    <blockquote class="blockquote-description">
                        <c:out value="${r.description}" />
                    </blockquote>
                </div>

                <!-- recensioni -->
                <div class="review">
                    <h2 class="h2-title"> Recensioni </h2>
                    <c:set value="0" var="i"></c:set>
                    <c:forEach items="${reviews}" var="current">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="h4-review "><c:out value="${current.name}"/>  </h4>
                                <div><c:out value='${userNicknamesOfReviews.get(i)}'/>
                                    <wbr>|<wbr>
                                    <c:out value="${current.data_creation}"/>
                                    <div class="review-elements col-stars">
                                        <%-- stelle piene --%>
                                        <c:forEach var="c" begin="1" end="${r.global_value}">
                                            <span class="glyphicon glyphicon-star"></span>
                                        </c:forEach>
                                        <%-- stelle vuote --%>
                                        <c:forEach var="c" begin="${r.global_value + 1}" end="5">
                                            <span class="glyphicon glyphicon-star-empty"></span>
                                        </c:forEach>
                                    </div>
                                    <div class="review-elements p-misc">
                                        Cibo: <c:out value="${current.food}" /> 
                                        |
                                        Qualità / Prezzo: <c:out value="${current.value_for_money}" />
                                        |
                                        Atmosfera: <c:out value="${current.atmosphere}" />
                                        |
                                        Servizio: <c:out value="${current.service}" />
                                    </div>
                                    <label id="${current.id}-1-gen" class="label label-like label-success" onclick="like(${current.id}, 1,${user.id})">
                                        Mi piace <label  id="${current.id}-1"><c:out value="${likes.get(i)}"/></label> </label>

                                    <label id="${current.id}-0-gen" class="label label-like label-danger" onclick="like(${current.id}, 0,${user.id})">
                                        Non mi piace  <label id="${current.id}-0"><c:out value="${dislikes.get(i)}"/></label></label> 


                                </div>


                            </div>
                            <div class="p-misc panel-body">
                                <c:out value="${current.description}"></c:out>
                                <img id="photo" src="${photoPaths.get(i)}" style="max-height: 50px; max-width: 50px;">
                            </div>

                            <c:if test="${current.reply!=null}">
                                <div class='panel-footer'>


                                    <div class="panel panel-default-reply">

                                        <div class="panel panel-reply">
                                            <div class="panel-heading">Risposta da: ${current.reply.nameOfIdOwner}</div>
                                            <div class="panel-body">${current.reply.desc}</div>

                                        </div>
                                    </div>
                                </c:if>

                            </div>
                            <c:set value="${i+1}" var="i"></c:set>
                        </c:forEach>
                    </div>
                    <!--newReview-->
                    <div class="review">
                        <c:if test="${sessionScope.user!=null}">
                            <form action="NewReview" method="post" enctype="multipart/form-data">
                                <div class="panel panel-default">
                                    <div class="panel-heading form-panel">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-4 col-xs-6 col-sm-8 col-lg-4">
                                                    <input required type="text" placeholder="Titolo recensione" class="form-control" id="name" name='name'>
                                                </div>
                                                <div class="col-md-8 col-xs-6 col-sm-4 col-lg-8 text-right">
                                                    <button type=" submit" class="btn-violet btn btn-primary">Invia</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row row-mine">
                                                <div class="review-parameters col-md-2 col-lg-2 col-sm-8 col-xs-8">
                                                    <input required placeholder="Stelle (0-5)" type="number" id="stars" name='stars' min="0" max="5" class="form-control">
                                                </div>
                                                <div class="review-parameters col-md-2 col-lg-2 col-sm-8 col-xs-8">
                                                    <input required placeholder="Cibo (0-5)" type="number" id="food" name='food' min="0" max="5" class="form-control">
                                                </div>
                                                <div class="review-parameters col-md-2 col-lg-2 col-sm-8 col-xs-8">
                                                    <input required placeholder="Qual/prez (0-5)" type="number" id="valueForMoney" name='valueForMoney' min="0" max="5" class="form-control">
                                                </div>
                                                <div class="review-parameters col-md-2 col-lg-2 col-sm-8 col-xs-8">
                                                    <input required placeholder="Atmosfera (0-5)" type="number" id="atmosphere" name='atmosphere' min="0" max="5" class="form-control">
                                                </div>
                                                <div class="review-parameters col-md-2 col-lg-2 col-sm-8 col-xs-8">
                                                    <input required  placeholder="Servizio (0-5)" type="number" id="service" name='service' min="0" max="5" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body form-panel">
                                        <div class="row">
                                            <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                                <textarea required class="form-control" rows="3"  placeholder="Descrivi la tua esperienza" id="description" name='description'></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer form-panel" >
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
                </div>

                <script type="text/javascript" src="js/map.js"></script>

                <script type="text/javascript" src="js/qrCreator.js"></script>
                <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCM8Aa2NRfiQZrc73Jj34ssPJV7bXPX7Qs&callback=initMap"></script>

                </body>
                </html>
