<?php
    class ControllersRegistrarEmpresa extends UtilController
    {
        function __construct()
        {
            parent::__construct();
            $this->view->mensaje="";
        }

        function loadScreen(){
            $this->view->loadScreen('Empresa/registrarEmpresa');
        }

        function registrarEmpresa(){

            $codigo = $_POST['nitEmpresa'];
            $descripcion = $_POST['nombre'];
            $mensaje = "";

            if ($this->model->insert(['vCodigo'=>$codigo,'vDescripcion'=>$descripcion])) {
                $mensaje = "<h1>"."<b>"."Nueva Empresa Creada"."</b>"."</h1>";
            } else {
                $mensaje = "<h1>" . "<b>" . "El Registro ya Existe" . "</b>" . "</h1>";
            }

            $this->view->mensaje=$mensaje;
            $this->loadScreen();

        }
    }
