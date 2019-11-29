<?php
class ControllersRegistrarCoordinador extends UtilController
{
    function __construct()
    {
        parent::__construct();
        $this->view->mensaje = "";
    }

    function loadScreen()
    {
        $this->view->loadScreen('Coordinador/registrarCoordinador');
    }

    function registrarCoordinador()
    {

        $documento = $_POST['documentoCoordinador'];
        $tipo = $_POST['tipo'];
        $primerNombre = $_POST['nombreCoordinador1'];
        $segundoNombre = $_POST['nombreCoordinador2'];
        $primerApellido = $_POST['apellidoCoordinador1'];
        $segundoApellido = $_POST['apellidoCoordinador2'];
        $codPS = $_POST['segurityask'];
        $respuestaPS = $_POST['respuesta'];
        $contraseñaPS = $_POST['password'];
        $cargo = $_POST['cargo'];
        $mensaje = "";
        if ($this->model->insert(['vdocumento' => $documento, 'vtipo' => $tipo, 'vprimerNombre' => $primerNombre, 'vsegundoNombre' => $segundoNombre, 'vprimerApellido' => $primerApellido, 'vsegundoApellido' => $segundoApellido])) {
            if ($this->model->insert(['vdocumento' => $documento, 'vtipo' => $tipo, 'vcodPS' => $codPS, 'vrespuestaPS' => $respuestaPS, 'vcontraseñaPS' => $contraseñaPS])) {
                if ($this->model->insert(['vdocumento' => $documento, 'vtipo' => $tipo, 'vcargo' => $cargo])) {
                    $mensaje = "<h1>" . "<b>" . "El Coordinador ha sido Creado Exitosamente" . "</b>" . "</h1>";
                } else {
                    $mensaje = "<h1>" . "<b>" . "No se pudo asignar usuario al Coordinador" . "</b>" . "</h1>";
                }
            } else {
                $mensaje = "<h1>" . "<b>" . "No se pudo registrar el Coordinador" . "</b>" . "</h1>";
            }
        } else {
            $mensaje = "<h1>" . "<b>" . "No se pudo registrar la Persona" . "</b>" . "</h1>";
        }

        $this->view->mensaje = $mensaje;
        $this->loadScreen();
    }
}
