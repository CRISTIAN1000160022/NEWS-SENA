<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>RECUPERAR CONTRASEÑA</title>

  <!-- Font Awesome Icons -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Theme CSS - Includes Bootstrap -->
  <link href="css/creative.min.css" rel="stylesheet">
</head>
<body>
	<div class="alert alert-info" role="alert">
		<center><h1>RECUPERAR CONTRASEÑA</h1></center>
	</div>
	<CENTER>
<form action="pdo(LOGIN)/crud.php" method="post">
	<span class="label label-warning">Seleccione su tipo de documento:</span><br>
<select name="tiporc"class="form-control-lg">
<option>Seleccione tipo de documento</option>
      <option value="CC">Cedula de Cuidadania</option>
      <option value="CE">Cedula de Extranjeria</option>
      <option value="TI">Tarjeta de Información</option>
</select>
<br>
<span class="label label-warning">N° de documento:</span><br>
<input type="number" name="documentorc" class="form-control-lg" placeholder="Digite su número de documento:">
<br>
<br>
<input type="submit" value="Validar" name="validar" class="btn btn-info" >	
<input type="submit" value="Regresar" name="regresar" class="btn btn-danger">	
</form>
<?php 
	if (isset($_GET['mensaje'])) {
		echo "<br>"."<h1>"."Usuario no encontrado"."</h1>";
	}
 ?>

   <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/creative.min.js"></script>
</body>
</html>