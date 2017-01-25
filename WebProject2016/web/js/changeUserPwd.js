/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {

$('#annulla-btn').click(function(){
    $('#pswd_info').hide();
    $('#oldPwd').val('');
    $('#newPwd').val('');
    $('#newPwd2').val('').css('border-color', $('#newPwd').css('border-color'));
    $('#label-newPwd2').css('color', $('#label-newPwd').css('color'));
});

$('#newPwd').keyup(function() {
   var pswd = $(this).val();
    if ( pswd.length < 8 ) {
    $('#length').removeClass('valid').addClass('invalid');
} else {
    $('#length').removeClass('invalid').addClass('valid');
}
    
    if ( pswd.match(/[a-z]/) ) {
    $('#letter').removeClass('invalid').addClass('valid');
} else {
    $('#letter').removeClass('valid').addClass('invalid');
}

//validate capital letter
if ( pswd.match(/[A-Z]/) ) {
    $('#capital').removeClass('invalid').addClass('valid');
} else {
    $('#capital').removeClass('valid').addClass('invalid');
}

//validate number
if ( pswd.match(/\d/) ) {
    $('#number').removeClass('invalid').addClass('valid');
} else {
    $('#number').removeClass('valid').addClass('invalid');
}
}).focus(function() {
    $('#pswd_info').show();
});

$('#oldPwd').focus(function(){
    $('#pswd_info').hide();
});

$('#newPwd2').focus(function(){
    $('#pswd_info').hide();
});

});

