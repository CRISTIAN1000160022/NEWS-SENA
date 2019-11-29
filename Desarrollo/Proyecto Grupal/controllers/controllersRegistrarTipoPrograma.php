<?php
    class ControllersRegistrarTipoPrograma extends UtilController
    {
        function __construct()
        {
            parent::__construct();
            $this->view->mensaje="";
        }

        function loadScreen(){
            $this->view->loadScreen('tipo_programa/registrarTPrograma');
        }

        function registrarTipoPrograma(){

            $codigo = $_POST['codigoTPrograma'];
            $descripcion = $_POST['nombreTPrograma'];

            $mensaje = "";

            if ($this->model->insert(['vCodigo'=>$codigo,'vDescripcion'=>$descripcion])) {
                $mensaje = "<h1>"."<b>"."Nuevo Tipo de Programa Creado"."</b>"."</h1>";
            } else {
                $mensaje = "<h1>" . "<b>" . "El Registro ya Existe" . "</b>" . "</h1>";
            }

            $this->view->mensaje=$mensaje;
            $this->loadScreen();

        }
    }
