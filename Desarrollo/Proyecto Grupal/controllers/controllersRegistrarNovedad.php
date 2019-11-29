<?php
    class ControllersRegistrarNovedad extends UtilController
    {
        function __construct()
        {
            parent::__construct();
            $this->view->mensaje="";
        }

        function loadScreen(){
            $this->view->loadScreen('Novedad/registrarNovedad');
        }

        function registrarNovedad(){

            $codigo = $_POST['codNovedad'];
            $idEncargado = $_POST['encargado'];
            $sede = $_POST['sede'];
            $causa = $_POST['causa'];
            $tipoNovedad = $_POST['tipoNovedad'];
            $fecha = $_POST['fechaNovedad'];
            $idAprendiz = $_POST['documento'];
            $codTdAprendiz = $_POST['tipoDocumento'];
            $ficha = $_POST['ficha'];
            $formato1 = $_POST['formato1'];
            $formato2 = $_POST['formato2'];
            $mensaje = "";

            if ($this->model->insert(['vCodigo'=>$codigo,'vidEncargado'=>$idEncargado,'vSede'=>$sede,'vCausa'=>$causa,'vtipoNovedad'=>$tipoNovedad,'vFecha'=>$fecha,'vidAprendiz'=>$idAprendiz,'vcodTdAprendiz'=>$codTdAprendiz,'vFicha'=>$ficha,'vFormato1'=>$formato1,'vFormato2'=>$formato2])) {
                $mensaje = "<h1>"."<b>"."Nueva Novedad Creada"."</b>"."</h1>";
            } else {
                $mensaje = "<h1>" . "<b>" . "El Registro ya Existe" . "</b>" . "</h1>";
            }

            $this->view->mensaje=$mensaje;
            $this->loadScreen();

        }
    }
