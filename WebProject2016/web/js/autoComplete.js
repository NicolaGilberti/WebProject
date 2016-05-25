/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $(function () {
        $("#cittaSearchInput").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "AutoCompleteCitta",
                    type: "POST",
                    data: {term: request.term},
                    dataType: "json",
                    success: function (data) {
                        response(data);
                    }
                });
            }
        });
    });

$(function () {
        $("#cosaSearchInput").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "AutoCompleteCosa",
                    type: "POST",
                    data: {term: request.term},
                    dataType: "json",
                    success: function (data) {
                        response(data);
                    }
                });
            }
        });
    });


});