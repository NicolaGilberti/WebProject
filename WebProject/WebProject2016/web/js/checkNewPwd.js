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

function resetChangePwd() {
	document.getElementById('oldPwd').value = '';
	document.getElementById('newPwd').value = '';
	document.getElementById('newPwd2').value = '';
	document.getElementById('newPwd2').style.borderColor = document.getElementById('newPwd').style.borderColor;
	document.getElementById('label-newPwd2').style.color = document.getElementById('label-newPwd').style.color;
}