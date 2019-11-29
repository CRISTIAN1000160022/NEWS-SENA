<?php
    class ControllersRegistrarCausa extends UtilController
    {
        function __construct()
        {
            parent::__construct();
            $this->view->mensaje="";
        }

        function loadScreen(){
            $this->view->loadScreen('Causa/registrarCausa');
        }

        function registrarCausa(){

            $codigo = $_POST['codigoCausa'];
            $descripcion = $_POST['razon'];
            $mensaje = "";

            if ($this->model->insert(['vCodigo'=>$codigo,'vDescripcion'=>$descripcion])) {
                $mensaje = "<h1>"."<b>"."Nueva Causa Creada"."</b>"."</h1>";
            } else {
                $mensaje = "<h1>" . "<b>" . "El Registro ya Existe" . "</b>" . "</h1>";
            }

            $this->view->mensaje=$mensaje;
            $this->loadScreen();

        }
    }
