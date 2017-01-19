
/*
In HTML:
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script src="path//MapLib.js" type="text/javascript"></script>
*/

	/*
	function(double, double, string)
	*/
	function createMap(lat, long, htmlID) {
		var myCenter = new google.maps.LatLng(lat, long);

		function initialize() {
			var mapProp = {
				center:myCenter,
				zoom:14,
				mapTypeId:google.maps.MapTypeId.ROADMAP
			};

			var marker = new google.maps.Marker({
				position:myCenter
			});

			var map = new google.maps.Map(document.getElementById(htmlID),mapProp);
			marker.setMap(map); 
		}

		google.maps.event.addDomListener(window, 'load', initialize);
	}

	/* 
	list:
		LAT0
		LONG0
		LAT1
		LONG1
		.
		.
		.
		LATn
		LONGn

		indice = 0 (LAT0, LONG0) => centro della mappa
			(ristorante intorno al quale si esegue la ricerca)

	firstInCenter:
			TRUE 	-->	le prime due coordinate si riferiscono ad un ristorante e
						va aggiunto il marker alla mappa (sarà al centro)
			FALSE 	-->	le prime due coordinate sono il centro del raggio di
						ricerca, ma non si riferiscono ad un ristorante (posizione)

	function (double[], string[], string[], boolean, int (metri), string)
	*/
	function createListMap(list, names, links, firstInCenter, searchRadius, htmlID) {
		var myCenter = new google.maps.LatLng(list[0], list[1]);
		var zoom = parseInt(14 - Math.log2(searchRadius / 1000));

		function markerLink(marker) {
			return function() {
				window.location.href = marker.url;
			}
		}

		function initialize() {
			var mapProp = {
				center:myCenter,
				zoom:zoom,
				mapTypeId:google.maps.MapTypeId.ROADMAP
			};

			var map = new google.maps.Map(document.getElementById(htmlID),mapProp);

			var circle = new google.maps.Circle({
				center:myCenter,
				radius:searchRadius,
				strokeColor:"#0000FF",
				strokeOpacity:0.8,
				strokeWeight:2,
				fillColor:"#0000FF",
				fillOpacity:0.4
			});
			circle.setMap(map);

			var markers = [];
			markers.length = list.length / 2;
			
			var j = 0;

			var i;
			if (firstInCenter) {
				i = 0;
			} else {
				i = 2;
			}

			for (; i < list.length; i += 2) {
				myCenter = new google.maps.LatLng(list[i], list[i + 1]);

				markers[j] = new google.maps.Marker({
					position:myCenter,
					title:names[j],
					url:links[j]
				});

				google.maps.event.addListener(markers[j], 'click', markerLink(markers[j]));

				markers[j].setMap(map); 
				j++;
			}
		}

		google.maps.event.addDomListener(window, 'load', initialize);
	}


	/*
	function (string)
	return coordinates[] (array: 0-->lat, 1-->lng)
	*/
	function getPositionFromAddress(address) {
		var coords = 0;
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode( { 'address': address}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
		       	coords = results[0].geometry.location;
				return [coords.lat(), coords.lng()];
			} else {
			   	alert("Non sono riuscito a trovare le coordinate!");
			}
		});
	}

//}
//});