<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-01 18:16:44
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-01 23:49:34
 */

/**
* CLase para el control de las sessiones
*/
class Session
{
  public static function start()
  {
    session_start();
  }

  public static function setSession($session, $valor)
  {
    if(!empty($session) && !empty($valor))
    {
      $_SESSION[$session] = $valor;
    }
  }

  public static function getSession($session)
  {
    if(isset($_SESSION[$session]))
    {
      return $_SESSION[$session];
    }
  }

  public static function validateUserOn()
  {
    if(Session::getSession('usuarioOn') !== true)
    {
      Session::redirect('Modules/Login/Login.php');
    }
  }

  public static function redirect($url)
  {
    header('location: ' . $url);
  }

  public static function destroySession()
  {
    session_destroy();
  }
}
?>