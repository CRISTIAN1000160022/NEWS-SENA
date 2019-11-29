<?php
class ControllersRegistrarAprendiz extends UtilController
{
    function __construct()
    {
        parent::__construct();
        $this->view->mensaje = "";
    }

    function loadScreen()
    {
        $this->view->loadScreen('Aprendiz/registrarAprendiz');
    }

    function registrarAprendiz()
    {

        $documento = $_POST['documentoAprendiz'];
        $tipo = $_POST['tipo'];
        $primerNombre = $_POST['nombreAprendiz1'];
        $segundoNombre = $_POST['nombreAprendiz2'];
        $primerApellido = $_POST['apellidoAprendiz1'];
        $segundoApellido = $_POST['apellidoAprendiz2'];
        $celular = $_POST['celularAprendiz'];
        $direccion = $_POST['direccionAprendiz'];
        $email = $_POST['emailAprendiz'];
        $ficha = $_POST['ficha'];
        $nitEmpresa = $_POST['nitempresaAprendiz'];
        $mensaje = "";
        if ($this->model->insert(['vdocumento' => $documento, 'vtipo' => $tipo, 'vprimerNombre' => $primerNombre, 'vsegundoNombre' => $segundoNombre, 'vprimerApellido' => $primerApellido, 'vsegundoApellido' => $segundoApellido])) {
            if ($this->model->insert(['vdocumento' => $documento, 'vtipo' => $tipo, 'vnitEmpresa' => $nitEmpresa, 'vcelular' => $celular, 'vdireccion' => $direccion, 'vemail' => $email])) {
                if ($this->model->insert(['vdocumento' => $documento, 'vtipo' => $tipo, 'vficha' => $ficha])) {
                    $mensaje = "<h1>" . "<b>" . "El Aprendiz ha sido Creado Exitosamente" . "</b>" . "</h1>";
                } else {
                    $mensaje = "<h1>" . "<b>" . "No se pudo asignar Ficha al Aprendiz" . "</b>" . "</h1>";
                }
            } else {
                $mensaje = "<h1>" . "<b>" . "No se pudo registrar el Aprendiz" . "</b>" . "</h1>";
            }
        } else {
            $mensaje = "<h1>" . "<b>" . "No se pudo registrar la Persona" . "</b>" . "</h1>";
        }

        $this->view->mensaje = $mensaje;
        $this->loadScreen();
    }
}
