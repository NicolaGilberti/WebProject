$(document).ready(function () {


    $("#formlogin").submit(function () {
        // passo i dati (via POST) alla servlet che effettua le verifiche 
        $.post("LoginAttempt", {
            email: $('#email').val(),
            password: $('#password').val(),
        }, function (risposta) {
            // se i dati sono corretti...
            console.log(risposta)
            if (risposta == 1) {
                // applico l'effetto allo span con id "messaggio"
                $("#messaggio").fadeTo(200, 0.1, function () {
                    // per prima cosa mostro, con effetto fade, un messaggio di attesa
                    $(this).removeClass().addClass("incorso").text('Login in corso...').fadeTo(900, 1, function () {
                        // al termine effettuo il redirect alla pagina privata
                        document.location.reload(true);
                    });
                });
                // se, invece, i dati non sono corretti...
            } else {
                // stampo un messaggio di errore
                $("#messaggio").fadeTo(200, 0.1, function () {
                    $(this).removeClass().addClass("attenzione").text('Dati di login non corretti!').fadeTo(900, 1);
                });
            }
        });
        // evito il submit del form (che deve essere gestito solo dalla funzione Javascript)
        return false;
    });


});
