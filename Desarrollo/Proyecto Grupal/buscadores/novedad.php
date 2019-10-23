<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="vista/css/bootstrap.css">
	<?php $aprendiz = $_REQUEST ?>
</head>
<body>
	<div class="alert alert-info">
	<h1 style="text-align: center;">AÑADIR NOVEDAD RETIRO VOLUNTARIO</h1>
</div>
<form>
<div style="margin: auto; width: 40%; " class="card">
	<div class="row" style="padding: 20px;">
		<h2>Subir Archivos</h4>
		<div class="col">
			<div class="card" style="margin-bottom: 50px;">
				<h4>Formato de retiro voluntario</h4>
				<input type="file" name="formato">
			</div>
		</div>
		<div class="col">
			<div class="card">
				<h4>Captura del sofia plus</h4>
				<input type="file" name="formato">
			</div>
		</div>
	</div>
	<hr>
	<input type="hidden" name="aprendiz" value="<?php echo $aprendiz = $_REQUEST['aprendiz'] ?>">
	<input type="submit" name="agregar" value="Subir soportes" class="btn btn-success">
</div>	
</form>
<script src="vista/js/bootstrap.js"></script>
 <script src="vista/js/jquery-3.4.1.js"></script>
 <script src="vista/js/popper.min.js"></script> 
</body>
</html>