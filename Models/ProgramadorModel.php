<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-17 19:23:23
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-04-01 00:31:52
 */

/**
* Clase modelo para administrar el programador
*/
class ProgramadorModel extends Model
{
  function __construct()
  {
    parent::__construct();
  }

  public function listAll()
  {
    $sql = $this->db->prepare("SELECT programador.SERIAL_SISTEMA, programador.FECHA_PROGRAMADOR, tiposEquipos.TIPO_EQUIPO, servicios.SERVICIO, servicios.ALIAS, clientes.CLIENTE, usuarios.NOMBRE AS CREADOR, usuarios_tecnico.NOMBRE AS TECNICO, estados.ESTADO  FROM programador LEFT JOIN equipos ON equipos.SERIAL_SISTEMA = programador.SERIAL_SISTEMA LEFT JOIN servicios ON servicios.ID = programador.ID_SERVICIO LEFT JOIN clientes ON clientes.ID = programador.ID_CLIENTE LEFT JOIN usuarios ON usuarios.ID = programador.ID_CREADOR LEFT JOIN usuarios AS usuarios_tecnico ON usuarios_tecnico.ID = programador.ID_TECNICO LEFT JOIN estados ON estados.ID = programador.ESTADO LEFT JOIN tiposEquipos ON tiposEquipos.ID = equipos.ID_TIPO_EQUIPO");
    $sql->execute();
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function listOne()
  {
    $sql = $this->db->prepare("SELECT programador.SERIAL_SISTEMA, equipos.SERIAL_REAL, estados.ID AS ID_ESTADO, programador.FECHA_PROGRAMADOR, tiposEquipos.TIPO_EQUIPO, servicios.SERVICIO, servicios.ALIAS, clientes.CLIENTE, usuarios.NOMBRE AS CREADOR, usuarios_tecnico.NOMBRE AS TECNICO, estados.ESTADO FROM programador LEFT JOIN equipos ON equipos.SERIAL_SISTEMA = programador.SERIAL_SISTEMA LEFT JOIN servicios ON servicios.ID = programador.ID_SERVICIO LEFT JOIN clientes ON clientes.ID = programador.ID_CLIENTE LEFT JOIN usuarios ON usuarios.ID = programador.ID_CREADOR LEFT JOIN usuarios AS usuarios_tecnico ON usuarios_tecnico.ID = programador.ID_TECNICO LEFT JOIN estados ON estados.ID = programador.ESTADO LEFT JOIN tiposEquipos ON tiposEquipos.ID = equipos.ID_TIPO_EQUIPO WHERE programador.LLAVE = :llave");
    $sql->execute(array(":llave" => $_POST['filterSql']['llave']));
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function listAllProgramador()
  {
    $sql = $this->db->prepare("SELECT programador.LLAVE AS id, programador.FECHA_PROGRAMADOR AS start, programador.FECHA_PROGRAMADOR AS 'end', CONCAT(tiposEquipos.TIPO_EQUIPO,', ',equipos.SERIAL_REAL,', ',clientes.CLIENTE,', ',servicios.SERVICIO) AS title, CONCAT('false') AS allDay, estados.COLOR AS color, estados.TEXT_COLOR AS textColor FROM programador LEFT JOIN equipos ON equipos.SERIAL_SISTEMA = programador.SERIAL_SISTEMA LEFT JOIN servicios ON servicios.ID = programador.ID_SERVICIO LEFT JOIN clientes ON clientes.ID = programador.ID_CLIENTE LEFT JOIN usuarios ON usuarios.ID = programador.ID_CREADOR LEFT JOIN usuarios AS usuarios_tecnico ON usuarios_tecnico.ID = programador.ID_TECNICO LEFT JOIN estados ON estados.ID = programador.ESTADO LEFT JOIN tiposEquipos ON tiposEquipos.ID = equipos.ID_TIPO_EQUIPO");
    $sql->execute();
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function insert()
  {
    $idCreador = Session::getSession('usuario')['idUsuario'];
    $idCliente = $_POST['cliente'];
    $idServicio = explode("|", $_POST['servicio']);

    $fechaProgramador = strftime("%Y-%m-%d", strtotime(date("Y-m-d") . " + ". $idServicio[3] ." days"));

    $combinaciones = explode(",", $idServicio[1]);
    if($combinaciones[0] == 0)
    {
      $llave = $_POST['serialSistema'] . $idServicio[0];
      $llaveCombinacion = $_POST['serialSistema'] . $idServicio[0];

      /***
        Elimino los servicios que su primer estado es 3, ya que rotan demasiado en la tabla progrmador, y la llave del serial y el idServicio debe ser único
      ***/
      if($idServicio[0] == 26 || $idServicio[0] == 27 || $idServicio[0] == 32 || $idServicio[0] == 33 || $idServicio[0] == 35)
      {
        $sqlRemove = $this->db->prepare("DELETE FROM programador WHERE LLAVE = :llave");
        $sqlRemove->execute(array(':llave' => $llave));
      }
      /***
        Fin
      ***/

      $sql = $this->db->prepare("INSERT INTO programador (LLAVE, LLAVE_COMBINACION, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :llaveCombinacion, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
      $sql->execute(array(':llave' => $llave, ':llaveCombinacion' => $llaveCombinacion, ':serialSistema' => $_POST['serialSistema'], ':idServicio' => $idServicio[0], ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':estado' => $idServicio[2], ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));
      $affectedRows = $sql->rowCount();

      if($affectedRows > 0)
      {
        $sqlHistorial = $this->db->prepare("INSERT INTO programador_historial (LLAVE, LLAVE_COMBINACION, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :llaveCombinacion, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
        $sqlHistorial->execute(array(':llave' => $llave, ':llaveCombinacion' => $llaveCombinacion, ':serialSistema' => $_POST['serialSistema'], ':idServicio' => $idServicio[0], ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':estado' => $idServicio[2], ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));
        $errorNoDos = $sqlHistorial->errorInfo();

        return array("result" => true, "mensaje" => "Servicio agregado");
      } else {
        $errorNo = $sql->errorInfo();
        if($errorNo[1] === 1062)
        {
          return array("result" => false, "mensaje" => "Servicio ya solicitado");
        } else {
          return array("result" => false, "mensaje" => "Programación no almacenada");
        }
      }

    } else {

      foreach ($combinaciones as $key => $servicio)
      {
        $llave = $_POST['serialSistema'] . $servicio;
        $llaveCombinacion = $_POST['serialSistema'] . $idServicio[0];

        $sql = $this->db->prepare("INSERT INTO programador (LLAVE, LLAVE_COMBINACION, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :llaveCombinacion, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
        $sql->execute(array(':llave' => $llave, ':llaveCombinacion' => $llaveCombinacion, ':serialSistema' => $_POST['serialSistema'], ':idServicio' => $servicio, ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':estado' => $idServicio[2], ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));

        $affectedRows = $sql->rowCount();
        if($affectedRows == 0)
        {
          $errorNo = $sql->errorInfo();
          if($errorNo[1] === 1062)
          {
            return array("result" => false, "mensaje" => "Servicio ya solicitado");
          } else {
            return array("result" => false, "mensaje" => "Programación no almacenada");
          }

          break;

        } else {
          $sqlHistorial = $this->db->prepare("INSERT INTO programador_historial (LLAVE, LLAVE_COMBINACION, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :llaveCombinacion, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
          $sqlHistorial->execute(array(':llave' => $llave, ':llaveCombinacion' => $llaveCombinacion, ':serialSistema' => $_POST['serialSistema'], ':idServicio' => $servicio, ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':estado' => $idServicio[2], ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));
        }
      }

      return array("result" => true, "mensaje" => "Servicio agregado");
    }
  }
}

?>