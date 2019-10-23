<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
	<title>Buscador factura</title>
	<link rel="stylesheet" type="text/css" href="vista/css/bootstrap.css">
  <?php 
    include "conexionPROYECTOGRUPAL.php";
  ?>
</head>
<body>
	<body>
    <div class="alert alert-info" role="alert">
  <center><h3>AÑADIR NOVEDAD RETIRO VOLUNTARIO</h3><center>
    </div>
        <h3>Programas</h3>
  <form method="post">
    <p><h4>Programa de formacion:</h4> : <select class="form-control-lg" name="programa" onchange="this.form.submit()">
      <option>Seleccione el Programa</option>
      <?php
        $programas = "SELECT * FROM programa"; 
        foreach ($conexion->query($programas) as $rows) {
          echo "<option value=".$rows['cod_programa'].">".$rows['desc_programa']."</option>";
        }
        ?>
    </select></p>
  </form>
  <?php if (isset($_REQUEST['programa'])||isset($_REQUEST['ficha'])) { $programa = $_POST['programa']; ?>
    <h3>Fichas</h3>
    <form method="post"> 
    <p><h4>Ficha de formacion:</h4> : <select class="form-control-lg" name="ficha" onchange="this.form.submit()">
      <option>Seleccione la ficha de formacion</option>
      <?php 
        $programaFichas = "SELECT cod_ficha,fk_cod_programa_f,cod_programa from ficha f join programa p on p.cod_programa = f.fk_cod_programa_f WHERE cod_programa = '".$programa."'";
        foreach ($conexion->query($programaFichas) as $rows ) { 
          echo "<option value=".$rows['cod_ficha'].">".$rows['cod_ficha']."</option>";
         } ?>
    </select></p>
  </form>
  <?php } ?> 
  <?php if (isset($_REQUEST['ficha'])) { $fichaAprendiz = $_POST['ficha'];
      $aprendices = "SELECT pkfk_id_persona_a, pkfk_cod_td_a, p_nombre_p,s_nombre_p, p_apellido_p,s_apellido_p, cel_tel_a, desc_programa, cod_ficha 
      FROM aprendiz a 
      join persona pe on pe.id_persona=a.pkfk_id_persona_a
      join aprendiz_ficha af on af.pkfk_id_persona_af = a.pkfk_id_persona_a
      join ficha f on f.cod_ficha=af.pkfk_cod_ficha_af
      join programa p on p.cod_programa = f.fk_cod_programa_f 
    WHERE af.pkfk_cod_ficha_af = '".$fichaAprendiz."'" ;
  ?>

    <table class='table' style='width: 1200px'> 
          <thead>
            <tr>
              <th>N° Documento del aprendiz</th>
              <th>Tipo de documento del aprendiz</th>
              <th>Nombre del aprendiz</th>
              <th>Apellido del aprendiz</th>
              <th>Telefono del aprendiz</th> 
              <th>Programa de formacion</th>
              <th>Ficha</th>
              <th>Acciones</th>
            </tr>
          </thead>
  <?php } foreach ($conexion->query($aprendices) as $rows ) { ?>
          <tbody>
            <tr>
              <td><?php echo $rows["pkfk_id_persona_a"]; ?></td>
              <td><?php echo $rows["pkfk_cod_td_a"]; ?>"</td>
              <td><?php echo $rows["p_nombre_p"]." ".$rows['s_nombre_p']; ?></td>
              <td><?php echo $rows["p_apellido_p"]." ".$rows['s_apellido_p']; ?></td>
              <td><?php echo $rows["cel_tel_a"]; ?></td>
              <td><?php echo $rows["desc_programa"]; ?></td>
              <td><?php echo $rows["pkfk_cod_ficha_af"]; ?></td>
              <td><form method="post" action="novedad.php">
<input type="hidden" name="aprendiz" value="<?php echo $rows['num_doc'] ?>">
<input type="submit" class="btn btn-primary" value="Agregar Novedad">
</form></td>
              <?php }?>
            </tr>
          </tbody>
        </table>
<div class="modal fade" id="novedad" tabindex="-1" role="dialog" aria-labelledby="novedadLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5>Agregar novedad del aprendiz</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    </div>
    <div class="modal-body">
      <?php if (isset($_REQUEST['novedad'])) { $aprendizDoc = $_GET['aprendiz'];
        $aprendizNovedad = "SELECT num_doc, tipo_doc, nombre_aprendiz, apellido_aprendiz from aprendices where num_doc = '".$aprendizDoc."'";
        foreach ($conexion->query($aprendizNovedad) as $rows) {?>
          <h3>Informacion del aprendiz</h3>
          <p><strong>Numero de documento del aprendiz : </strong><?php echo $rows['num_doc']; ?></p>
          <p><strong>Tipo de documentio del aprendiz : </strong><?php echo $rows['tipo_doc']; ?></p>
          <p><strong>Nombre del aprendiz : </strong><?php echo $rows['nombre_aprendiz']; ?></p>
          <p><strong>Apellido del aprendiz : </strong><?php echo $rows['apellido_aprendiz']; ?></p>
        <?php }
      } ?>
      <form method="post">
      <h3>Agregar</h3>
      
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
          <input type="submit" name="" class="btn btn-success" value="Agregar">
          </form>
    </div>
  </div>
</div>
<form action="../coordinadorprincipal.php" method="post"><input type="submit" name="regresar" value="Regresar" class="btn btn-danger"></form>
 <script src="vista/js/bootstrap.js"></script>
 <script src="vista/js/jquery-3.4.1.js"></script>
 <script src="vista/js/popper.min.js"></script>
</body>
</html>