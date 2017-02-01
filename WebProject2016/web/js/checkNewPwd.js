/**
 * Verifica l'uguaglianza tra il campo "password" e "reinserisci password".
 * @returns {Boolean}
 */
function checkNewPwd() {
	var newpwd = document.getElementById('newPwd');
	var newpwd2 = document.getElementById('newPwd2');
	if (newpwd.value == newpwd2.value) {
		return true;
	} else {
		newpwd2.style.borderColor = 'red';
		document.getElementById('label-newPwd2').style.color = 'red';
		return false;
	}
}