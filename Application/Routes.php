<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-01-31 18:41:42
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-03 12:56:36
 */

/**
* Clase de control de rutas para la aplicación
*/
class Routes
{
  public static function run()
  {
    if(isset($_GET['module']))
    {
      $formatUrl = explode('?', $_GET['module']);
      $formatModule = explode('/', $formatUrl[0]);
      $module = preg_replace('([^0-9a-zA-Z])', '', $formatModule[0]);
      if(empty($formatModule[1]))
      {
        $view = preg_replace('([^0-9a-zA-Z])', '', ucfirst($formatModule[0]));
      } else {
        $view = preg_replace('([^0-9a-zA-Z])', '', ucfirst($formatModule[1]));
      }

      $routeModule = ROOT . 'Modules/' . $module .'/'. $view . '.php';
      $routeModuleError = ROOT . 'Modules/Error/Error.php';
      if(is_readable($routeModule))
      {
        require_once $routeModule;
      } else {
        require_once $routeModuleError;
      }
    }
  }
}
?>