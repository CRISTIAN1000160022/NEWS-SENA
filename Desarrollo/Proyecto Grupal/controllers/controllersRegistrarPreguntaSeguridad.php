<?php
    class ControllersRegistrarPreguntaSeguridad extends UtilController
    {
        function __construct()
        {
            parent::__construct();
            $this->view->mensaje="";
        }

        function loadScreen(){
            $this->view->loadScreen('pregunta_seguridad/registrarPSeguridad');
        }

        function registrarPreguntaSeguridad(){

            $codigo = $_POST['codigo'];
            $descripcion = $_POST['nombre'];

            $mensaje = "";

            if ($this->model->insert(['vCodigo'=>$codigo,'vDescripcion'=>$descripcion])) {
                $mensaje = "<h1>"."<b>"."Nueva Pregunta de Seguridad Creada"."</b>"."</h1>";
            } else {
                $mensaje = "<h1>" . "<b>" . "El Registro ya Existe" . "</b>" . "</h1>";
            }

            $this->view->mensaje=$mensaje;
            $this->loadScreen();

        }
    }
