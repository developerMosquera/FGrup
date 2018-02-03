<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-01-31 19:56:05
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-02 20:53:28
 */

/**
* Clase modelo para el login
*/
class LoginModel extends Model
{
  function __construct()
  {
    parent::__construct();
  }

  public function authenticate($user, $pass)
  {
    $sql = $this->db->prepare("SELECT ID, USUARIO, CONTRASENA, ESTADO, FECHA_VENCIMIENTO, TOKEN, NOMBRE, PERFIL, PERMISOS FROM usuarios WHERE USUARIO = :usuario");
    $sql->execute(array(':usuario' => $user));
    if($result = $sql->fetchAll(PDO::FETCH_ASSOC))
    {
      $token = date("YmdHis") . $user;
      $sqlToken = $this->db->prepare("UPDATE usuarios SET TOKEN = :token WHERE USUARIO = :usuario");
      $sqlToken->execute(array(':token' => md5($token), ':usuario' => $user));

      if(!password_verify($pass, $result[0]['CONTRASENA']))
      {
        return array("result" => false, "mensaje" => "Verifique, contraseña no es valida");
      }
      elseif($result[0]['ESTADO'] == 0)
      {
        return array("result" => false, "mensaje" => "Verifique, usuario se encuentra inactivo");
      }
      elseif($result[0]['FECHA_VENCIMIENTO'] < date("Y-m-d"))
      {
        return array("result" => false, "mensaje" => "Verifique, usuario se encuentra vencido");
      } else {
        //Varible donde almacenamos datos del usuario para cargarlos a una session
        $ingresoUsuario = array("estado" => $result[0]['ESTADO'], "usuario" => $result[0]['USUARIO'], "token" => $result[0]['TOKEN'], "nombre" => $result[0]['NOMBRE'], "perfil" => $result[0]['PERFIL'], "permisos" => $result[0]['PERMISOS']);

        //Creamos la session
        //Session::crear("usuario", $ingresoUsuario);

        return array("result" => true, "mensaje" => "");
      }

    } else {
      return array("result" => false, "mensaje" => "Verifique, usuario no es valido");
    }
  }
}
?>