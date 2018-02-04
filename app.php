<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-01-31 18:36:50
 * @Last Modified by:   developerMosquera
 * @Last Modified time: 2018-02-03 19:43:28
 */


/***
  Imprime errores de php
***/
error_reporting(E_ALL);
ini_set('display_errors', '1');

//Separacion de las carpetas para los distintos SO
define('DS', DIRECTORY_SEPARATOR);
//Ubicacion
define('ROOT', realpath(dirname(__FILE__)) . DS);
//Llama carpeta de la aplicacion el nucleo del sistema
define('APP_PATH', ROOT . 'Application' . DS);

//Nucleo del programa
require APP_PATH . 'Config.php';
require APP_PATH . 'Controller.php';
require APP_PATH . 'Model.php';
require APP_PATH . 'Database.php';
require APP_PATH . 'Request.php';
require APP_PATH . 'Routes.php';
require APP_PATH . 'Session.php';

Session::start();

//Contiene la clase para el ruteo de la aplicación
Routes::run();

//Llamados ajax para realizar el MVC
Request::run();
?>