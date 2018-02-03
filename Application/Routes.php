<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-01-31 18:41:42
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-02 17:28:42
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
      echo "Ruta";
    }
  }
}
?>