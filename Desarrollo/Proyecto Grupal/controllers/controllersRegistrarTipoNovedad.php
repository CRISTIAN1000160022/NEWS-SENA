<?php
    class ControllersRegistrarTipoNovedad extends UtilController
    {
        function __construct()
        {
            parent::__construct();
            $this->view->mensaje="";
        }

        function loadScreen(){
            $this->view->loadScreen('tipo_novedad/registrarTNovedad');
        }

        function registrarTipoNovedad(){

            $codigo = $_POST['codigoTNovedad'];
            $descripcion = $_POST['nombreTNovedad'];

            $mensaje = "";

            if ($this->model->insert(['vCodigo'=>$codigo,'vDescripcion'=>$descripcion])) {
                $mensaje = "<h1>"."<b>"."Nuevo Tipo de Novedad Creado"."</b>"."</h1>";
            } else {
                $mensaje = "<h1>" . "<b>" . "El Registro ya Existe" . "</b>" . "</h1>";
            }

            $this->view->mensaje=$mensaje;
            $this->loadScreen();

        }
    }
