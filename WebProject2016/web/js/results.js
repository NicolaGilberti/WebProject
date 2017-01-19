/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var data;
var filter;
var dataFiltered;
var cuisineList;
var redirectRestaurantRelativePath="../WebProject2016/RestaurantRequest?id=";

function getParameterByName(name, url) {
    if (!url)
        url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
    if (!results)
        return null;
    if (!results[2])
        return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function priceless15(obj) {
    if (obj.minPrice <= 15)
        return true
    else
        return false;
}

function priceBetween1535(obj) {
    if (obj.minPrice < 15 || obj.minPrice > 35)
        return false
    else
        return true;
}

function pricemore35(obj) {
    if (obj.minPrice >= 35)
        return true
    else
        return false;
}

function visualizzaTabella() {
    $("#row-thumbnail").empty();


    //  console.log("Entrato in vis tabella");
    $.each(dataFiltered, function (arrayID, restaurant) {

        var html = '<!--singola card-->' +
                '                    <div class="col-sm-12 col-xs-12 col-md-6 col-centered">' +
                '                        <div class="thumbnail">' +
                '                            <div class="module">' +
                '                                <img class="module img-responsive" src="img/restImgs/' + restaurant.imgPath + '" alt="Nessuna immagine disponibile"/>' +
                '                                <div class="overlay">' +
                '                                </div>' +
                '                                <header>' +
                '                                    <h1><a style="color: white; text-decoration: none;" href="' + redirectRestaurantRelativePath + restaurant.id + '">' + restaurant.name + '</a></h1>' +
                '' +
                '                                    <div>';
        var nStar = restaurant.score;
        for (var i = 0; i < nStar; i++) {
            html += '<span class="pull-right glyphicon glyphicon-star val"></span>';
        }
        html += '                                    </div>' +
                '                                </header>' +
                '                            </div>' +
                '                            <div class="caption">' +
                '                                <div class="cuisine-labels">';
        var labelList = restaurant.cuisineTypes;
        // console.log(labelList)
        for (var i in labelList) {
            html += '<span class="label label-info">' + labelList[i].name + '</span>';
        }
        ;

        html += '                                    <p class="pull-right">' + restaurant.numReviews + ' Recensioni</p>' +
                '                                </div>' +
                '                                <p> <span class="glyphicon glyphicon-globe"></span>' + restaurant.address + ', ' + restaurant.city + '</p>' +
                '' +
                '                                <p><span class="glyphicon glyphicon-tag"> </span>$' + restaurant.minPrice + '-' + restaurant.maxPrice + '</p>' +
                '' +
                '                                <div class="thumb-footer">' +
                '                                    <a href="#" class="dettagli">DETTAGLI</a>' +
                '                                    <div class="pull-right">' +
                '                                        <a href="http://maps.google.com/?q=' + restaurant.address + ',' + restaurant.city + '" target="new_blank"><span class="glyphicon glyphicon-map-marker"> </span> Mappa</a>' +
                '                                    </div>' +
                '                                </div>' +
                '                            </div>' +
                '                        </div>' +
                '                    </div>' +
                '                    <!--fine singola card-->';

        $("#row-thumbnail").append(html);

        //    console.log('<a href="' + restaurant.description + '">');
    });
    $("#trovatiLabel").empty();
    $("#trovatiLabel").append(dataFiltered.length);
}

function sortData(val) {
    // console.log(data);

    if (val === "minPrice") {
        dataFiltered.sort(function (a, b) {
            return a.minPrice - b.minPrice
        });
    }
    if (val === "val") {
        dataFiltered.sort(function (a, b) {
            return a.score - b.score
        });
    }
    if (val === "name") {
        dataFiltered.sort(function (a, b) {
            return a.name.localeCompare(b.name);
        });
    }
    // console.log("ordinato");
    //   $("#row-thumbnail").empty();
    visualizzaTabella();
}



$(document).ready(function () {
    $.ajax({
        type: 'GET',
        url: 'SearchRestaurant',
        data: {
            searchinput: getParameterByName('searchinput'),
            lat: getParameterByName('lat'),
            long: getParameterByName('long')
        },
        success: function (response) {
            //   var jsonstring= JSON.stringify(response);
            //   console.log(response);
            //
            //now json variable contains data in json format
            //let's display a few items
            data = $.map(response, function (el) {
                return el
            });
            dataFiltered = data;
            visualizzaTabella();
            //   $("#trovatiLabel").append(data.length);
        }
    });

    $.ajax({
        type: 'GET',
        url: 'GetCuisine',
        data: {},
        success: function (response) {
            cuisineList = $.map(response, function (el) {
                return el
            });

            $.each(cuisineList, function (arrayID, cuisine) {
                var html = '<div class=""> <label class="checkspan">' +
                        '<input type="checkbox" name="cuisinecheck" value="' + cuisine.id + '"checked/> ' + cuisine.name + '  </label></div>';
                $("#cuisineChecks").append(html);
            });


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
    $("#checkallbtn").click(function () {
        $('input[name="cuisinecheck"]').prop('checked', true);
    });
    $("#decheckallbtn").click(function () {
        $('input[name="cuisinecheck"]').prop('checked', false);
    });

    $('#collapsediv').on('hidden.bs.collapse', function () {
        $("#glyphicollapse").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
    });

    $('#collapsediv').on('shown.bs.collapse', function () {
        $("#glyphicollapse").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
    });

    $("#filterbtn").click(function () {
        //
        filter = $('input[name=priceradio]:checked', '#searchForm').val();
        //console.log("Valore filtro:" + filter);
        var checkSelected = [];
        $('input[name="cuisinecheck"]:checked').each(function () {
            checkSelected.push($(this).val());
        });
        // console.log(checkSelected);


        dataFiltered = $.grep(data, function (element, index) {

//            var val = $(this).val();
            //   console.log("Valore checkbox:" + val);
            //return element.cuisineTypes.includes();
            //   console.log("Element di data: " + element.id);
            for (var i in element.cuisineTypes) {
                //       console.log("element.cuisineTypes[i].id: "+element.cuisineTypes[i].id);
                if (checkSelected.includes(String(element.cuisineTypes[i].id))) {
                    return true;
                }
            }
            return false;
        });

        //  console.log("Datafiltered prima di filtro prezzo:" + dataFiltered);

        switch (filter) {
            case "all":
                dataFiltered = dataFiltered;
                break;
            case "less15":
                dataFiltered = dataFiltered.filter(priceless15);
                break;
            case "between1535":
                dataFiltered = dataFiltered.filter(priceBetween1535);
                break;
            case "more35":
                dataFiltered = dataFiltered.filter(pricemore35);
                break;
            default:
                dataFiltered = data;
        }
        //  console.log("Datafiltered dopo filtri prezzo:" + dataFiltered);

        visualizzaTabella();

    });



    $("#searchButton").click(function (event) {
        event.preventDefault();
        $("#row-thumbnail").empty();
        //   $("#trovatiLabel").empty();

        $.ajax({
            type: 'GET',
            url: 'SearchRestaurant',
            data: {
                searchinput: $('#searchInput').val() || "pizzeria"
            },
            success: function (response) {
                //   var jsonstring= JSON.stringify(response);
                //   console.log(JSON.stringify(jsonstring));
                //
                //now json variable contains data in json format
                //let's display a few items
                console.log(response);
                data = $.map(response, function (el) {
                    return el
                });
                dataFiltered = data;
                visualizzaTabella();
                //      $("#trovatiLabel").append(data.length);
            }
        });
    });


});
