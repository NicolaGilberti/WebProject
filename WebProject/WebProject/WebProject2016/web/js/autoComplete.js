/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {

    $(function () {
        $("#searchInput").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "SearchRestaurantAutocomplete",
                    minLength: 4,
                    type: "POST",
                    data: {
                        term: request.term
                    },
                    dataType: "json",
                    success: function (data) {
                        response(data);
                    }
                });
            }
        });
    });

    $(function () {
        $("#city").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "SearchAdvancedAutocomplete",
                    minLength: 4,
                    type: "POST",
                    data: {
                        city: request.term
                    },
                    dataType: "json",
                    success: function (data) {
                        response(data);
                    }
                });
            }
        });
    });


    $(function () {
        $("#country").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "SearchAdvancedAutocomplete",
                    minLength: 4,
                    type: "POST",
                    data: {
                        country: request.term
                    },
                    dataType: "json",
                    success: function (data) {
                        response(data);
                    }
                });
            }
        });
    });

    $(function () {
        $("#cuisine").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "SearchAdvancedAutocomplete",
                    minLength: 4,
                    type: "POST",
                    data: {
                        cuisine: request.term
                    },
                    dataType: "json",
                    success: function (data) {
                        response(data);
                    }
                });
            }
        });
    });

    //fine jquery doc
});
