<?php 
	class conexion{
		public function conectar(){
			$user = "root";
			$host = "localhost";
			$password = "";
			$db = "proyecto_grupal";
			$con = new PDO("mysql:host=$host;dbname=$db;",$user,$password);
			return $con;
		}
	}
 ?>