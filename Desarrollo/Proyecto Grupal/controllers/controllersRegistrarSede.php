<?php
    class ControllersRegistrarSede extends UtilController
    {
        function __construct()
        {
            parent::__construct();
            $this->view->mensaje="";
        }

        function loadScreen(){
            $this->view->loadScreen('Sede/registrarSede');
        }

        function registrarSede(){

            $codigo = $_POST['codigo'];
            $descripcion = $_POST['nombre'];
            $direccion = $_POST['direccion'];

            $mensaje = "";

            if ($this->model->insert(['vCodigo'=>$codigo,'vDescripcion'=>$descripcion,'vDireccion'=>$direccion])) {
                $mensaje = "<h1>"."<b>"."Nueva Sede Creada"."</b>"."</h1>";
            } else {
                $mensaje = "<h1>" . "<b>" . "El Registro ya Existe" . "</b>" . "</h1>";
            }

            $this->view->mensaje=$mensaje;
            $this->loadScreen();

        }
    }
