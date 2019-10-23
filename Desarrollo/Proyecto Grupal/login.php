<?php
	if (isset($_REQUEST['ingresar'])) {
		$correo = $_POST['correo'];
		$contraseña = $_POST['password'];
		if ($correo==("cajimenez220@misena.edu.co")&&$contraseña==("C1000160022")) {
			header('location:coordinadorprincipal.html');
		} else {
			header('location:index.html');
		}
	}


?>