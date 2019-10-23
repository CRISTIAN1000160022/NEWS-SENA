<?php 
error_reporting(0);
   $host="localhost";
   $user="root";
   $password="";
   $database="proyecto_grupal";
     // REPRESENTA UNA CONEXIÓN ENTRE PHP Y UNA BASE DA DATOS MYSQL//
     $conexion= new mysqli($host,$user,$password,$database);
            if ($conexion-> connect_errno) 
            {
            	echo "La conexión fallo!"."<br>";
            }
              else
              {
                  // echo "Conexión exitosa!"."<br>";	
              }
?>