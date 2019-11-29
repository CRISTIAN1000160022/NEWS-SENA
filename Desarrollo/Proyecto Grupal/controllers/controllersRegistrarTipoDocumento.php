<?php
    class ControllersRegistrarTipoDocumento extends UtilController
    {
        function __construct()
        {
            parent::__construct();
            $this->view->mensaje="";
        }

        function loadScreen(){
            $this->view->loadScreen('tipo_documento/registrarTDocumento');
        }

        function registrarTipoDocumento(){

            $codigo = $_POST['txtVCRcodigo'];
            $descripcion = $_POST['txtVCRnombre'];

            $mensaje = "";

            if ($this->model->insert(['vCodigo'=>$codigo,'vDescripcion'=>$descripcion])) {
                $mensaje = "<h1>"."<b>"."Nuevo Tipo de Documento Creado"."</b>"."</h1>";
            } else {
                $mensaje = "<h1>" . "<b>" . "El Registro ya Existe" . "</b>" . "</h1>";
            }

            $this->view->mensaje=$mensaje;
            $this->loadScreen();

        }
    }
