<%-- 
    Document   : testmap
    Created on : 2-feb-2017, 23.26.54
    Author     : MirkoPortatile
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery-1.11.1.js"></script>

        <style>
            html, body, #map-canvas {
                height: 100%;
                margin: 0px;
                padding: 0px
            }

            #infowindow{
                padding: 10px;
            }
        </style>

    </head>
    <body>
        <h1>Hello World!</h1>
        <div id='map-canvas'></div>


    </body>
    <script>

        var locations = [
            ["Split", 43.5148515, 16.4490835],
            ["Zagreb", 45.840196, 15.9643316],
            ["Dubrovnik", 42.6457256, 18.094058]
        ];

        function initMap() {

            var infowindow = new google.maps.InfoWindow(); /* SINGLE */
            var map = new google.maps.Map(document.getElementById('map-canvas'), {
                zoom: 4,
                center: new google.maps.LatLng(45, 15)
            });

            function placeMarker(loc) {
                var latLng = new google.maps.LatLng(loc[1], loc[2]);
                var marker = new google.maps.Marker({
                    position: latLng,
                    map: map
                });
                google.maps.event.addListener(marker, 'click', function () {
                    infowindow.close(); // Close previously opened infowindow
                    infowindow.setContent("<div id='infowindow'>" + loc[0] + "</div>");
                    infowindow.open(map, marker);
                });
            }

            // ITERATE ALL LOCATIONS
            // Don't create functions inside for loops
            // therefore refer to a previously created function
            // and pass your iterating location as argument value:
            for (var i = 0; i < locations.length; i++) {
                placeMarker(locations[i]);
            }

        }


    </script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCM8Aa2NRfiQZrc73Jj34ssPJV7bXPX7Qs&callback=initMap"></script>

</html>
