<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
	<title>Buscador de Instructores</title>
	<link rel="stylesheet" type="text/css" href="vista/css/bootstrap.css">
  <?php 
    include "conexionPROYECTOGRUPAL.php";
  ?>
</head>
<body>
  <center>
    <div class="alert alert-info" role="alert">
<h2>Buscar Instructor</h2>
    </div>
<br>
<form  method="post">
<p><input type="text" name="buscador" placeholder="Digite el nombre o apellido" class="form-control-lg"></p>
<br>
<input type="submit" name="buscar" value="Buscar" class="btn btn-warning">
<input type="submit" name="regresar" value="Regresar" class="btn btn-danger">
<br>
</form>
<?php 
if (isset($_REQUEST['buscar'])) 
  {

      $instructor = $_POST['buscador'];
      $consulta = "SELECT pkfk_id_persona_i, pkfk_cod_td_i, p_nombre_p, s_nombre_p, p_apellido_p, s_apellido_p FROM persona p JOIN instructor i on p.id_persona = i.    pkfk_id_persona_i WHERE p.p_nombre_p like'".$instructor."%' OR p.s_nombre_p like '".$instructor."%' OR p.p_apellido_p like '".$instructor."%' OR p.s_apellido_p like'".$instructor."%' ";
      foreach($conexion->query($consulta) as $rows)
      {
        echo "El número de identificación es: "."<b>".$rows['pkfk_id_persona_i']."</b>"."<br><br>";
        echo "El tipo de documento es: "."<b>".$rows['pkfk_cod_td_i']."</b>"."<br><br>";
        echo "El primer primer nombre es: "."<b>".$rows['p_nombre_p']."</b>"."<br><br>";
        echo "El segundo nombre es: "."<b>".$rows['s_nombre_p']."</b>"."<br><br>";
        echo "El primer apellido es: "."<b>".$rows['p_apellido_p']."</b>"."<br><br>";
        echo "El segundo apellido es: "."<b>".$rows['s_apellido_p']."</b>"."<br><br>";
        echo "<hr>";
      }
  }
  if (isset($_REQUEST['regresar'])) 
  {
   header('location:../coordinadorprincipal.php');
  }

 ?> 
 <script src="vista/js/bootstrap.js"></script>
 <script src="vista/js/jquery-3.4.1.js"></script>
 <script src="vista/js/popper.min.js"></script>
</body>
</html>