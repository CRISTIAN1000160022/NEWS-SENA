<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
	<title>Buscador Novedad</title>
	<link rel="stylesheet" type="text/css" href="vista/css/bootstrap.css">
  <?php 
    include "conexionPROYECTOGRUPAL.php";
  ?>
</head>
<body>
  <center>
<div class="alert alert-info" role="alert">
<h2>Buscador De Novedades</h2>
</div>
<br>
<form method="post">
<h5>Seleccione el tipo de documento del aprendiz</h5>
<select class="form-control-lg" name="tipo">
<?php
        $tipo_documento = "SELECT * FROM tipo_documento"; 
        foreach ($conexion->query($tipo_documento) as $rows) {
          echo "<option value=".$rows['cod_td'].">".$rows['desc_td']."</option>";
        }
?>
</select>
<br>
<br>
  <h5>Digite el id del aprendiz o el número del radico</h5>
<p><input type="text" name="buscador" placeholder="Digite el id del aprendiz o el número del radico" class="form-control-lg"></p>
<br>
<input type="submit" name="buscar" value="Buscar" class="btn btn-warning">
<input type="submit" name="regresar" value="Regresar" class="btn btn-danger">
<br>
<?php 
if (isset($_REQUEST['buscar'])) 
{
  $contador = 0;
  $novedad = $_POST['buscador'];
  $tipo_documento=$_POST['tipo'];
  $consulta = "SELECT  pkfk_id_persona_af,pkfk_cod_td_af, p_nombre_p,s_nombre_p,p_apellido_p,s_apellido_p, descripcion_tn,fecha_novedad
   FROM persona p 
   JOIN aprendiz i on p.id_persona = i.pkfk_id_persona_a
   join aprendiz_ficha fa on i.pkfk_id_persona_a=fa.pkfk_id_persona_af
   join novedad n on fk_aprendiz_ficha_id_persona_a=pkfk_id_persona_af
   join tipo_novedad tn on  cod_tn=cod_tipo_novedad
   WHERE fk_aprendiz_ficha_id_persona_a = '".$novedad."' " ;

          foreach($conexion->query($consulta) as $rows)
      {
         echo "<b>"."<h4>"."El aprendiz posee una novedad"."</h4>"."</b>"."<br>";
         echo "El número de identificación es: "."<b>".$rows['pkfk_id_persona_af']."</b>"."<br><br>";
         echo "El tipo de documento es: "."<b>".$rows['pkfk_cod_td_af']."</b>"."<br><br>";
         echo "El primer primer nombre es: "."<b>".$rows['p_nombre_p']."</b>"."<br><br>";
         echo "El segundo nombre es: "."<b>".$rows['s_nombre_p']."</b>"."<br><br>";
         echo "El primer apellido es: "."<b>".$rows['p_apellido_p']."</b>"."<br><br>";
         echo "El segundo apellido es: "."<b>".$rows['s_apellido_p']."</b>"."<br><br>";
         echo "La novedad que posee es: "."<b>".$rows['descripcion_tn']."</b>"."<br><br>";
         echo "Fecha de la novedad: "."<b>".$rows['fecha_novedad']."</b>"."<br><br>";
         echo "<hr>";
         $id_aprendiz=$rows['pkfk_id_persona_af'];
         $tipo_documento=$rows['pkfk_cod_td_af'];
      }
   if ($id_aprendiz!=$novedad && $tipo_documento !=$tipo_documento) 
    {
      echo "<br>"."<h2><b>"."El aprendiz no tiene ninguna novedad."."</h2></b>";
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