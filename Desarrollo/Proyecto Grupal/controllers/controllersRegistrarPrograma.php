<?php
    class ControllersRegistrarPrograma extends UtilController
    {
        function __construct()
        {
            parent::__construct();
            $this->view->mensaje="";
        }

        function loadScreen(){
            $this->view->loadScreen('Programa/registrarPrograma');
        }

        function registrarPrograma(){

            $codigo = $_POST['codigo'];
            $tipoPrograma = $_POST['tipo_programa'];
            $sigla = $_POST['sigla'];
            $nombre = $_POST['nombre'];
            $mensaje = "";

            if ($this->model->insert(['vCodigo'=>$codigo,'vtipoPrograma'=>$tipoPrograma,'vSigla'=>$sigla,'vNombre'=>$nombre])) {
                $mensaje = "<h1>"."<b>"."Nuevo Programa Creado"."</b>"."</h1>";
            } else {
                $mensaje = "<h1>" . "<b>" . "El Registro ya Existe" . "</b>" . "</h1>";
            }

            $this->view->mensaje=$mensaje;
            $this->loadScreen();

        }
    }
