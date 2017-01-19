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
        <script type="text/javascript" src="js/login.js"></script> 

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        
        <script src="js/kjua-0.1.1.min.js" type="text/javascript"></script>
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <jsp:include page="header/headerFiles.jsp" />
        
        <!--css-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/search_restaurant.css">
        <link rel="stylesheet" href="css/restaurantPage.css">

        <title>${r.name} - tuttobistro</title>
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

            <!--left-->
            <!--name-->
            <div class="container">
                <div class="col-lg-6 col-sm-6 col-xs-6 col-md-6">
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
                    <div class="Row">
                        orari di apertura:
                    </div>

                    <div class="Row">
                        <c:out value="${openingDates}"></c:out>
                    </div>
                    <!-- cuisine types -->
                    <p></p>
                    <div class="cuisine-labels"> 
                    <c:forEach items="${cuisines}" var="current">
                        <span class="label label-info" style="font-size: 14px;">
                            <c:out vamlue="${current.name}"></c:out>
                            </span>
                    </c:forEach>
                    </div>
                </div>
                    
                <!--right-->
                <!-- qrcode -->
                <p></p>
                <div class="text-right">
                    <div class="" id="qrCode">
                    </div>
                    <!--map-->
                    <p></p>
                    <script src='https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBJUV-VhfzHrLgEKIBkoNpMH5Un4uef5Pc'></script>
                    <div style='overflow:hidden;height:200px;width:310px;'>
                        <div id='gmap_canvas' style='height:200px;width:310px;'></div>
                        <style>#gmap_canvas img{max-width:none!important;background:none!important}</style>
                    </div> 
                    <a href='http://maps-generator.com/it'>maps generator</a>
                    <script type='text/javascript' src='https://embedmaps.com/google-maps-authorization/script.js?id=9d55fbe0a8781beced2c83653978a9ae60980a2e'></script>
                    <script type='text/javascript'>
                        function init_map()
                        {
                            var myOptions = {zoom:12,center:new google.maps.LatLng(${r.latitude},${r.longitude}),mapTypeId: google.maps.MapTypeId.ROADMAP};
                            map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
                            marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(${r.latitude},${r.longitude})});
                            infowindow = new google.maps.InfoWindow({content:'<strong></strong>${r.name}'});google.maps.event.addListener(marker, 'click', function(){infowindow.open(map,marker);});
                            infowindow.open(map,marker);
                        }
                        google.maps.event.addDomListener(window, 'load', init_map);
                    </script>
                </div>       
                </div>
            </div>
                                
            <div class="container">
                <!-- description -->
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

                <!-- recensioni -->
                
                <h3> Recensioni </h3>
                <c:set value="0" var="i"></c:set>
                <c:forEach items="${reviews}" var="current">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 style="font: bold;"><c:out value="${current.name}"/> 
                                <div>
                                <small class="text-muted">
                                    <c:out value='${userNameOfReviews.get(i)}'/> 
                                    <wbr>|<wbr>
                                    <c:out value="${current.data_creation}"/> 
                                    <div class="col-stars">
                                        <%-- stelle piene --%>
                                        <c:forEach var="i" begin="1" end="${r.global_value}">
                                            <span class="glyphicon glyphicon-star"></span>
                                        </c:forEach>
                                        <%-- stelle vuote --%>
                                        <c:forEach var="i" begin="${r.global_value + 1}" end="5">
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
                                </small>
                                </div>
                                
                            </h4>
                        </div>
                        <div class="panel-body">
                            <c:out value="${current.description}"></c:out>
                        </div>
                    </div>
                    <c:set value="${i+1}" var="i"></c:set>
                </c:forEach>
            </div>
            
        </div>
        <script>
            var el = kjua({text: "${r.name} ${r.address} ${openingDates}", size: 100});
            document.querySelector('#qrCode').appendChild(el);
        </script>
        
        
    </body>
</html>
