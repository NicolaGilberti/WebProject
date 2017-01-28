/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var el = kjua({text: "nome: " + name + ", indrizzo: " + address + ", orari di apertura: " + openingDates , 
    size : 100, rounded: 100});
document.querySelector('#qrCodeSmall').appendChild(el);
document.querySelector('#qrCodeSmall').setAttribute('data-toggle', 'modal');
document.querySelector('#qrCodeSmall').setAttribute('data-target', '#qrModal');
var el = kjua({text: "nome: " + name + ", indrizzo: " + address + ", orari di apertura: " + openingDates , 
    size : 400, rounded: 100});
document.querySelector('#qrCodeBig').appendChild(el);
