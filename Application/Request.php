<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-01-31 18:49:18
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-25 19:28:40
 */

/**
* Clase para las solicitudes POST y GET
*/
class Request
{
  public static function run()
  {
    if(isset($_POST['action']) && $_POST['action'] == 'post')
    {
      //Nombre de la clase controlador
      $callController = ucfirst($_POST['controller']) . "Controller";
      //Metodo a utilizar del controller
      $method = $_POST['method'];
      //Ruta del controlador
      $routeController = ROOT . 'Controllers/' . ucfirst($_POST['controller']) . "Controller.php";

      //Si existe el archivo, realizamos la instancia
      if(is_readable($routeController))
      {
        require_once $routeController;
        $controller = new $callController;

        //Llama el metodo requerido
        call_user_func(array($controller, $method));

      } else {
        echo json_encode(array("result" => true, "mensaje" => "Algo salió mal"));
      }
    }
  }

}

?>