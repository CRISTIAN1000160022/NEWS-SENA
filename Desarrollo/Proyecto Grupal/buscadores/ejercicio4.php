<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
	<title>Buscador Aprendiz</title>
	<link rel="stylesheet" type="text/css" href="vista/css/bootstrap.css">
  <?php 
    include "conexionPROYECTOGRUPAL.php";
  ?>
</head>
<body>
  <center>
<div class="alert alert-info" role="alert">
<h2>Buscador De Aprendices Con Novedad Según La Sede</h2>
</div>
<br>
<form method="post">
<p><input type="text" name="buscador" placeholder="Digite la Sede" class="form-control-lg"></p>
<br>
<input type="submit" name="buscar" value="Buscar" class="btn btn-warning">
<input type="submit" name="regresar" value="Regresar" class="btn btn-danger">
<br>
<?php 
if (isset($_REQUEST['buscar'])) {
  $contador = 0;
  $sede = $_POST['buscador'];
  $consulta = "SELECT  pkfk_id_persona_af,pkfk_cod_td_af, p_nombre_p,s_nombre_p,p_apellido_p,s_apellido_p, cod_sede,fk_aprendiz_ficha_ficha_cod_ficha_a
   FROM persona p 
   JOIN aprendiz i on p.id_persona = i.pkfk_id_persona_a
   join aprendiz_ficha fa on i.pkfk_id_persona_a=fa.pkfk_id_persona_af
   join novedad n on fk_aprendiz_ficha_id_persona_a=pkfk_id_persona_af
   join sede s on cod_sede=fk_cod_sede_n 
   WHERE desc_sede = '".$sede."' ";
  foreach($conexion->query($consulta) as $rows){
    echo "Aprendiz N°"."<b>".$contador+=1,"</b>"."<br>";
    echo "El número de identificación es: "."<b>".$rows['pkfk_id_persona_af']."</b>"."<br><br>";
    echo "El tipo de documento es: "."<b>".$rows['pkfk_cod_td_af']."</b>"."<br><br>";
    echo "El primer primer nombre es: "."<b>".$rows['p_nombre_p']."</b>"."<br><br>";
    echo "El segundo nombre es: "."<b>".$rows['s_nombre_p']."</b>"."<br><br>";
    echo "El primer apellido es: "."<b>".$rows['p_apellido_p']."</b>"."<br><br>";
    echo "El segundo apellido es: "."<b>".$rows['s_apellido_p']."</b>"."<br><br>";
    echo "La ficha del aprendiz es: "."<b>".$rows['fk_aprendiz_ficha_ficha_cod_ficha_a']."</b>"."<br><br>";
    echo "<hr>";
  }
}
if (isset($_REQUEST['regresar'])) 
{
   header('location:../coordinadorprincipal.php');
}
 ?> 
</form>
 <script src="vista/js/bootstrap.js"></script>
 <script src="vista/js/jquery-3.4.1.js"></script>
 <script src="vista/js/popper.min.js"></script>
</body>
</html>