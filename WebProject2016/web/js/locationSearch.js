function geoFindMe() {


    if (!navigator.geolocation) {
        output.innerHTML = "<p>Il servizio di geolocalizzazione non e' supportato nel tuo browser.</p>";
        return;
    }

    function success(position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        var url = 'SearchByLocation?lat=' + latitude + '&long=' + longitude;
        window.location.href = url;
    };

    function error() {
        alert("Impossibile trovare la tua posizione.");
    };


    navigator.geolocation.getCurrentPosition(success, error);
}
