// This example displays a marker at the center of Australia.
     // When the user clicks the marker, an info window opens.

     function initMap() {
       var center = {lat: Number(latitude), lng: Number(longitude)};
       var map = new google.maps.Map(document.getElementById('map'), {
           zoom : 15,
         center: center
       });

       var contentString = name;

       var infowindow = new google.maps.InfoWindow({
         content: contentString
       });

       var marker = new google.maps.Marker({
         position: center,
         map: map,
         title: name
       });
       marker.addListener('click', function() {
         infowindow.open(map, marker);
       });
     }
