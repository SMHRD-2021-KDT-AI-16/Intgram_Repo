import 'js/jquery-3.7.1.min.js';

function loadLoginScreen() {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			document.getElementById('login-screen').innerHTML = xhr.responseText;
			document.getElementById('login-screen').style.display = 'block';
		}
	};
	xhr.open('GET', '../components/login.html', true);
	xhr.send();
}

function loadLoginScreen() {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			document.getElementById('join-screen').innerHTML = xhr.responseText;
			document.getElementById('join-screen').style.display = 'block';
		}
	};
	xhr.open('GET', '../components/join.html', true);
	xhr.send();
}
