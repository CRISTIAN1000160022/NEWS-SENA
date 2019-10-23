<!DOCTYPE html>
<html>
<head>
	<title>Mostrar</title>
	<?php include"crud.php"; ?>
</head>
<body>
	<form method="post" action="insertar.php">
		<p>Nombre del alumno : <input type="text" name="nombre"></p>
		<p>Email del alumno : <input type="email" name="correo"></p>
		<p>Curso : <select name="curso">
						<option> ---- </option>
						<option value="1">PHP</option>
						<option value="2">ASP</option>
						<option value="3">JSP</option>
			    	</select> 
		</p>
		<input type="submit" value="Agregar">
	</form>
</body>
</html>
