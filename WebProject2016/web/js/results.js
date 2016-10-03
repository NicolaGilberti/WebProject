/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var data;

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function visualizzaTabella() {
    //  console.log("Entrato in vis tabella");
    $.each(data, function (arrayID, restaurant) {

        var html = ' <div class="col-sm-6 col-xs-12 col-md-6 col-centered">' +
            '   <div class="thumbnail">' +
            '<img class="img-responsive"' + 'src="img/ristoTest.jpg" alt="Nessuna immagine disponibile">' +
            '<div class="caption">' +
            '<h3>' +
            restaurant.name +
            '</h3>' +
            ' <p> <a href="http://maps.google.com/?q=' + restaurant.address + ' ' + restaurant.city + '"><span class="glyphicon ' + 'glyphicon-map-marker"></span></a> ' +
            restaurant.address + ', ' +
            restaurant.city + '' +
            '</p>' +
            '<p><span class="glyphicon glyphicon-star"> </span> Valutazione: ' + restaurant.score + '</p>' +
            ' <p><span class="glyphicon glyphicon-tag"> </span> Fascia di prezzo: ' + restaurant.minPrice + ' - ' + restaurant.maxPrice + ' </p> <p>' + restaurant.description + '' +
            '   </p> </div></div>  </div>';

        $(".row-thumbnail").append(html);

        //    console.log('<a href="' + restaurant.description + '">');
    });

}

function sortData(val) {
    // console.log(data);

    if (val === "minPrice") {
        data.sort(function (a, b) {
            return a.minPrice - b.minPrice
        });
    }
    if (val === "val") {
        data.sort(function (a, b) {
            return a.score - b.score
        });
    }
    if (val === "name") {
        data.sort(function (a, b) {
            return a.name.localeCompare(b.name);
        });
    }
    // console.log("ordinato");
    $(".row").empty();
    visualizzaTabella();
}



$(document).ready(function () {
    $.ajax({
        type: 'GET',
        url: 'SearchRestaurant',
        data: {
            searchinput: getParameterByName('searchinput'),
            country: getParameterByName('country'),
            city: getParameterByName('city'),
            cuisine: getParameterByName('cuisine'),
            lat: getParameterByName('lat'),
            long: getParameterByName('long')
        },
        success: function (response) {
            //   var jsonstring= JSON.stringify(response);
            //   console.log(JSON.stringify(jsonstring));
            //
            //now json variable contains data in json format
            //let's display a few items
            data = $.map(response, function (el) {
                return el
            });
            visualizzaTabella();
            $("#nresults").append('<p id="nresP">Risultati trovati: ' + data.length + "</p>");
        }
    });

    $("#btnMinPrice").click(function () {
        sortData("minPrice");
    });
    $("#btnName").click(function () {
        sortData("name");
    });
    $("#btnVal").click(function () {
        sortData("val");
    });


    $("#searchForm").submit(function (event) {
        event.preventDefault();
        $(".row-thumbnail").empty();
        $("#nresults").empty();

        $.ajax({
            type: 'GET',
            url: 'SearchRestaurant',
            data: {
                searchinput: $('#searchInput').val()
            },
            success: function (response) {
                //   var jsonstring= JSON.stringify(response);
                //   console.log(JSON.stringify(jsonstring));
                //
                //now json variable contains data in json format
                //let's display a few items
                data = $.map(response, function (el) {
                    return el
                });
                visualizzaTabella();
                $("#nresults").append('<p id="nresP">Risultati trovati: ' + data.length + "</p>");
            }
        });
    });


});
