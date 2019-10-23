<?php 
error_reporting();
	class ingreso{
		
		public function login($documento,$tipoDocumento,$contrasena)
		{
				session_start();

				require_once"conexionpdo.php";

				$db = conexion::conectar();

				$cont = 0;


				$sql = "SELECT * from usuario WHERE pkfk_id_usuario = '".$documento."' AND pkfk_cod_td_u = '".$tipoDocumento."' AND contrasena_u = '".$contrasena."'";
				$validacion = $db->prepare($sql);
				$validacion->execute();
				while ($filas = $validacion->fetch(PDO::FETCH_ASSOC)) {
					$document = stripslashes($filas['pkfk_id_usuario']);
					$typeDocument = stripslashes($filas['pkfk_cod_td_u']);
					$password = stripslashes($filas['contrasena_u']);
				$cont = $cont + 1;
				}
				echo $document," ",$typeDocument," ",$password;
				if ($cont ==0) 
				{
					header("location:../index.php?mensaje=true");
				} else {
					$rolInstructor = "SELECT pkfk_id_usuario, pkfk_cod_td_u, pkfk_id_persona_i,pkfk_cod_td_i FROM usuario u JOIN instructor i ON u.pkfk_id_usuario=i.pkfk_id_persona_i WHERE pkfk_id_usuario = '".$document."'";
					$rolEncargado = "SELECT pkfk_id_usuario, pkfk_cod_td_u, pkfk_id_persona_e,pkfk_cod_td_e FROM usuario u JOIN encargado e ON u.pkfk_id_usuario=e.pkfk_id_persona_e WHERE pkfk_id_usuario = '".$document."'";
					$validacionRolInstructor = $db->prepare($rolInstructor);
					$validacionRolInstructor->execute();
					while ($filas = $validacionRolInstructor->fetch(PDO::FETCH_ASSOC)) {
						$docInstructor = stripslashes($filas['pkfk_id_persona_i']);
						$tipDocInstructor = stripslashes($filas['pkfk_cod_td_i']);
					}
					$validacionRolEncargado = $db->prepare($rolEncargado);
					$validacionRolEncargado->execute();
					while ($filas = $validacionRolEncargado->fetch(PDO::FETCH_ASSOC)) {
						$docCoordinador = stripslashes($filas['pkfk_id_persona_e']);
						$tipDocCoordinador = stripslashes($filas['pkfk_cod_td_e']);
					}
					if ($document == $docCoordinador  && $typeDocument == $tipDocCoordinador) 
					{
						header('location:../coordinadorprincipal.php');
					}
					if ($document == $docInstructor  && $typeDocument == $tipDocInstructor) 
					{
						header('location:../instructorprincipal.php');
					}
				}

		}
		public function recuperarContraseña($tipoDocumento, $documento)
		{
			session_start();

			require_once"conexionpdo.php";

			$db = conexion::conectar();

			$sql = "SELECT * from usuario WHERE pkfk_id_usuario = '".$documento."' AND pkfk_cod_td_u = '".$tipoDocumento."'";
			$validar = $db->prepare($sql);
    		$validar->execute();
    		if ($filas = $validar->rowCount() > 0) 
    		{
    		header("Location: cambiarcontraseña.php?persona=$documento");
   		 	}else
   		 	{
    		header("Location: ../recuperarcontraseña.php?mensaje=true");
    		}
		}
		
	}
	$login = new ingreso();
	if (isset($_REQUEST['ingresar'])) 
	{
		$documento =$_POST['documento']; 
		$tipoDocumento =$_POST['tipo'];
		$contraseña =$_POST['password'];

		$login-> login($documento,$tipoDocumento,$contraseña);
	}
	if (isset($_REQUEST['validar'])) 
	{
		$documentorc =$_POST['documentorc']; 
		$tipoDocumentorc =$_POST['tiporc'];

		$login->recuperarContraseña($tipoDocumentorc,$documentorc);
	}
	if (isset($_REQUEST['regresar'])) 
	{
	header('location:../index.php');
	}
	

 ?>
 

 