<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>RECUPERAR CONTRASEÑA</title>

  <!-- Font Awesome Icons -->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="../vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Theme CSS - Includes Bootstrap -->
  <link href="../css/creative.min.css" rel="stylesheet">
  <?php 
include"conexionpdo.php";
   ?>
</head>
<body>
	<div class="alert alert-info" role="alert">
		<center><h1>RECUPERAR CONTRASEÑA</h1></center>
	</div>
	<CENTER>
<form method="post">
<select name="segurityask">
   <?php 
   error_reporting(0);
        $db = conexion::conectar();
        $sql = "SELECT * FROM pregunta_seguridad";
        foreach ($db->query($sql) as $r) 
        {
        echo "<option value='".$r['cod_ps']."'>".$r['desc_ps']."</option>";
        }
        
        ?>
</select>
<br>
<br>
<input type="text" name="respuesta" placeholder="Digite su respuesta" class="form-control-lg">
<br>
<br>
<input type="submit" value="Cambiar" name="cambiar" class="btn btn-info" >	<br>
</form>
<?php
error_reporting(0);
  $segurityask=$_POST['segurityask'];
  $respuesta=$_POST['respuesta'];
  $db = conexion::conectar();
  $sql="SELECT * from usuario where fk_cod_ps_u='$segurityask' and respuesta_ps_u = '$respuesta'";
  $validarRespuesta = $db->prepare($sql);
  $validarRespuesta->execute();
  if (isset($_REQUEST['cambiar'])) 
  {
  
if ($validarRespuesta->rowCount()>0) 
{  
  $cambiar = 1;
}
  else 
  {
echo "<br>"."<h1>"."Pregunta de seguridad y/o respuesta incorrectas."."</h1>";
  }

  }
if (isset($cambiar)) {
  $db = conexion::conectar();
  $sql="SELECT * from usuario where fk_cod_ps_u='$segurityask' and respuesta_ps_u = '$respuesta'";
  foreach ($db->query($sql) as $r) 
  {
 ?>
<form method="post">
<br>
<input type="password" name="contraseñaNueva" placeholder="Digite su contraseña nueva : " class="form-control-lg"><br><br>
<input type="password" name="repetirContraseña" placeholder="Confirme su contraseña nueva : " class="form-control-lg"><br><br>
<input type="hidden" name="contraseñaVieja" class="form-control-lg" value="<?php echo $r['contrasena_u']; ?>" >
<input type="submit" name="actualizar" value="Modificar" class="btn btn-warning">
</form>

<?php }  
}
error_reporting(0);
if (isset($_REQUEST['actualizar'])) 
{
  $contraseñaNueva=$_POST['contraseñaNueva'];
  $repetirContraseña=$_POST['repetirContraseña'];
  if ($contraseñaNueva==$repetirContraseña) 
  {
     $actualizar = "UPDATE usuario
                 set contrasena_u='".$_REQUEST['contraseñaNueva']."' 
                 WHERE contrasena_u='".$_REQUEST['contraseñaVieja']."'";
      $db = conexion::conectar();
      $actContraseña = $db->prepare($actualizar);
      $actContraseña->execute(); 
    if ($actContraseña->rowCount()>0) 
   { 
     
      echo "<center>";
      echo "<b>"."<h1>"."Su contraseña fue modificada con exito"."<br>"."Y es: ".$_REQUEST['contraseñaNueva']."</h1>"."</b>";
   }
  else 
   {
      echo "<center>";
      echo "<br>"."<h1>"."Problemas en la actualización de la contraseña."."</h1>";
   }
  }
  else
  {
     echo "<center>";
     echo "<br>"."<h1>"."Las contraseñas que ingreso no coinciden"."</h1>";
  }

}
?> 

 


   <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="../vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="../js/creative.min.js"></script>
</body>
</html>