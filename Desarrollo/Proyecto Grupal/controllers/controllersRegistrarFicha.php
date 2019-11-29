<?php
    class ControllersRegistrarFicha extends UtilController
    {
        function __construct()
        {
            parent::__construct();
            $this->view->mensaje="";
        }

        function loadScreen(){
            $this->view->loadScreen('Ficha/registrarFicha');
        }

        function registrarFicha(){

            $codigoFicha = $_POST['codigoFicha'];
            $codigoJornada = $_POST['jornada'];
            $codigoPrograma = $_POST['programa'];

            $mensaje = "";

            if ($this->model->insert(['vCodigoFicha'=>$codigoFicha,'vCodigoJornada'=>$codigoJornada,'vCodigoPrograma'=>$codigoPrograma])) {
                $mensaje = "<h1>"."<b>"."Nueva Ficha Creado"."</b>"."</h1>";
            } else {
                $mensaje = "<h1>" . "<b>" . "El Registro ya Existe" . "</b>" . "</h1>";
            }

            $this->view->mensaje=$mensaje;
            $this->loadScreen();

        }
    }
