<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-01-31 18:41:27
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-02 20:41:19
 */

/**
* Clase controlador general
*/
abstract class Controller
{
  protected function callModel($model)
  {
    //Modelo llamado
    $callModel = ucfirst($model) . 'Model';
    //Ruta del modelo llamado
    $routeModel = ROOT . 'Models/' . $callModel .'.php';

    if(is_readable($routeModel))
    {
      require_once $routeModel;
      $model = new $callModel;
      return $model;
    }
  }
}
?>